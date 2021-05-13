using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace To_Ba_To_Iutta
{
    public partial class ChatElement : UserControl
    {
        private Crypt.ChatElementType chatType;
        public Crypt.ChatElementType Type { get => chatType; set { chatType = value; InitializeTypeDependent(); } }
        public ChatElement(Crypt.ChatElementType type)
        {
            InitializeComponent();
            Type = type;
            Crypt.Actions.ControlRoundBorder(copyCipherButton, new Pen(Color.White, 1f));
            Crypt.Actions.ControlRoundBorder(senderDelete, new Pen(Color.White, 1f));
            Crypt.Actions.ControlRoundBorder(recieverDelete, new Pen(Color.White, 1f));
        }
        private void InitializeTypeDependent()
        {
            if (Type == Crypt.ChatElementType.Sender)
            {
                panel.BackColor = Crypt.Constants.ColorThemeCollection[0].ChatSender;

                recieverDelete.Visible = false;

                senderDelete.Visible = true;
                copyCipherButton.Visible = true;
            }
            else
            {
                panel.BackColor = Crypt.Constants.ColorThemeCollection[0].ChatReceiver;

                senderDelete.Visible = false;
                copyCipherButton.Visible = false;

                recieverDelete.Visible = true;
            }
        }

        public override string Text
        { 
            get => textLabel.Text;
            set => textLabel.Text = value;
        }
        public string Cipher
        {
            get => cipherLabel.Text;
            set => cipherLabel.Text = value;
        }

        #region Actions
        private void CopyTextHandler(object sender, EventArgs e) => Clipboard.SetText(Text);
        private void CopyCipherHandler(object sender, EventArgs e) => Clipboard.SetText(Cipher);
        private void DeleteHandler(object sender, EventArgs e)
        {
            if (MessageBox.Show("Are you sure you want to delete this message?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.No) return;
            int index = Parent.Controls.IndexOf(this);

            for (int i = index + 1; i < Parent.Controls.Count; ++i)
                Parent.Controls[i].Location = new Point(Parent.Controls[i].Location.X, Parent.Controls[i].Location.Y - 8 - this.Height);

            Crypt.Data.ChatControls.Remove(this);

            this.Parent.Controls.Remove(this);
            this.Dispose();
        }
        private void SaveHandler(object sender, EventArgs e)
        {
            if(saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                using (Stream stream = saveFileDialog.OpenFile())
                {
                    using (StreamWriter wr = new StreamWriter(stream))
                    {
                        wr.WriteLine(Text);
                        wr.WriteLine("-------------------------------------------------------------------------------------");
                        wr.WriteLine(Cipher);
                    }
                }
            }
        }
        #endregion

        private void SetSize()
        {
            int h;

            h = textLabel.Location.Y + textLabel.Size.Height;
            h += 6;
            separatorPanel.Location = new Point(separatorPanel.Location.X, h);

            h = separatorPanel.Location.Y + separatorPanel.Size.Height;
            h += 6;
            cipherLabel.Location = new Point(cipherLabel.Location.X, h);

            h = cipherLabel.Location.Y + cipherLabel.Size.Height;
            h += 6;
            h += 25;
            h += 6;
            panel.Size = new Size(this.Size.Width, h);
            panel.Height = h;
        }
        private void ChatElement_Load(object sender, EventArgs e) => SetSize();
        private void textLabel_TextChanged(object sender, EventArgs e) => SetSize();
        private void cipherLabel_TextChanged(object sender, EventArgs e) => SetSize();
    }
}
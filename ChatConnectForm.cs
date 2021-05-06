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
    public partial class ChatConnectForm : Form
    {
        private byte[] Key { get; set; }
        private string KeyContainerName { get; set; }
        public ChatConnectForm(string keyContainerName)
        {
            InitializeComponent();
            this.OnResize(new EventArgs());

            KeyContainerName = keyContainerName;
            Key = Crypt.Asymmetric.GetKeyXmlBlob(keyContainerName);

            sendKey.Text = Convert.ToBase64String(Key);

            this.DialogResult = DialogResult.Cancel;
        }

        private void ChatConnectForm_Resize(object sender, EventArgs e)
        {
            int height = (this.Size.Height - 12 - 12 - save.Size.Height - 6 - 6 - 38 - connect.Size.Height - 8) / 2;
            int buttony = 12 + height + 6;
            int secondy = 12 + height + 6 + save.Size.Height + 6;

            save.Location = new Point(save.Location.X, buttony);
            copy.Location = new Point(copy.Location.X, buttony);
            reciveKey.Location = new Point(reciveKey.Location.X, secondy);
            recivedKeyLabel.Location = new Point(recivedKeyLabel.Location.X, secondy+3);

            reciveKey.Size = new Size(reciveKey.Size.Width, height);
            sendKey.Size = new Size(sendKey.Size.Width, height);
        }
        private void save_Click(object sender, EventArgs e)
        {
            saveFileDialog.FileName = KeyContainerName;
            if (saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                using (Stream fs = saveFileDialog.OpenFile())
                    fs.Write(Key, 0, Key.Length);
            }
        }
        private void copy_Click(object sender, EventArgs e) => Clipboard.SetText(Convert.ToBase64String(Key));

        private void connect_Click(object sender, EventArgs e)
        {

        }
    }
}

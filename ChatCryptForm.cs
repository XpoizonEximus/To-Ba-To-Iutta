using System;
using System.Net;
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
    public partial class ChatCryptForm : PanelForm
    {
        public ChatCryptForm()
        {
            InitializeComponent();

            string externalIpString = new WebClient().DownloadString("http://icanhazip.com").Replace("\\r\\n", "").Replace("\\n", "").Trim();
            ipLabel.Text = IPAddress.Parse(externalIpString).ToString();

            ControlRoundBorder();
            if(Crypt.Chat.Connected)
            {
                statusLabel.Text = "Connected";
                statusLabel.ForeColor = Color.Lime;
            }
            foreach (Control c in Crypt.Data.ChatControls)
                chatElementContainerPanel.Controls.Add(c);
        }
        private void ControlRoundBorder()
        {
            Crypt.Actions.ControlRoundBorder(connect, new Pen(Color.White, 1f));
            Crypt.Actions.ControlRoundBorder(disconnect, new Pen(Color.White, 1f));
            Crypt.Actions.ControlRoundBorder(containerPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(baseContainerPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(send, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(sendTextBoxPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(recive, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(reciveTextBoxPanel, new Pen(Color.Silver, 1f));
        }
        private void AddElem(string text, string cipher, Crypt.ChatElementType type)
        {
            ChatElement message = new ChatElement(type)
            {
                Text = text,
                Cipher = cipher
            };
            chatElementContainerPanel.Controls.Add(message);

            int x, y;
            y = Crypt.Data.ChatCurrentY + 8;
            if (type == Crypt.ChatElementType.Receiver) x = 8;
            else x = chatElementContainerPanel.Width - message.Width - 8;
            message.Location = new Point(x, y);

            Crypt.Data.ChatCurrentY += message.Height + 8;

            Crypt.Actions.ControlRoundBorder(message, new Pen(Color.Transparent, 1f));

            Crypt.Data.ChatControls.Add(message);
        }

        private void rightContainerPanel_Paint(object sender, PaintEventArgs e)
        {
            Pen p = new Pen(Color.Silver, 1f);
            e.Graphics.DrawLine(p, 0, 0, 0, baseContainerPanel.Height);
        }

        #region KeyUp
        private void sendTextBox_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                send.PerformClick();
                sendTextBox.Text.Trim();
            }
        }
        private void ReciveTextBox_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                recive.PerformClick();
            reciveTextBox.Text.Trim();
        }
        #endregion
        #region Click
        private void connect_Click(object sender, EventArgs e)
        {
            try
            {
                statusLabel.Text = "Connecting";
                statusLabel.ForeColor = Color.DarkGoldenrod;

                ChatConnectForm f = new ChatConnectForm(Crypt.Chat.Initialize());
                if (f.ShowDialog() == DialogResult.OK)
                {
                    Crypt.Chat.Connect(f.RecivedKey);

                    statusLabel.Text = "Connected";
                    statusLabel.ForeColor = Color.Lime;
                }
                else
                {
                    Crypt.Chat.Disconnect(false);
                    statusLabel.Text = "Not connected";
                    statusLabel.ForeColor = Color.Red;
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                statusLabel.Text = "Not connected";
                statusLabel.ForeColor = Color.Red;
            }
        }
        private void disconnect_Click(object sender, EventArgs e)
        {
            try
            {
                Crypt.Chat.Disconnect();
                statusLabel.Text = "Not connected";
                statusLabel.ForeColor = Color.Red;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void send_Click(object sender, EventArgs e) 
        {
            try
            {
                string text = sendTextBox.Text;
                string cipher = Convert.ToBase64String(Crypt.Chat.Encrypt(Encoding.UTF8.GetBytes(text)));
                AddElem(text, cipher, Crypt.ChatElementType.Sender);

                sendTextBox.Text = "";
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void recive_Click(object sender, EventArgs e)
        {
            try
            {
                string cipher = reciveTextBox.Text;
                string text = Encoding.UTF8.GetString(Crypt.Chat.Decrypt(Convert.FromBase64String(cipher)));
                AddElem(text, cipher, Crypt.ChatElementType.Receiver);

                reciveTextBox.Text = "";
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        #endregion
    }
}

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

            Crypt.Actions.ControlRoundBorder(connect, new Pen(Color.White, 1f));
            Crypt.Actions.ControlRoundBorder(disconnect, new Pen(Color.White, 1f));
            Crypt.Actions.ControlRoundBorder(containerPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(baseContainerPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(send, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(sendTextBoxPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(recive, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(reciveTextBoxPanel, new Pen(Color.Silver, 1f));
        }
        private void AddElem()
        {
            ChatElement ch = new ChatElement();
            ch.Location = new Point(0, 0);
            ch.Text = "sfdsdf\nsdfsdf\nsdff\nsdfsdf\ndfs";
            chatElementContainerPanel.Controls.Add(ch);
            Crypt.Actions.ControlRoundBorder(ch.panel, new Pen(ch.panel.BackColor, 1f));
        }
        private void rightContainerPanel_Paint(object sender, PaintEventArgs e)
        {
            Pen p = new Pen(Color.Silver, 1f);
            e.Graphics.DrawLine(p, 0, 0, 0, baseContainerPanel.Height);
        }

        private void sendTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                send.PerformClick();
        }
        private void ReciveTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                recive.PerformClick();
        }

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
                else disconnect.PerformClick();
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
                Crypt.Chat.Disconnect(false);
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
                Clipboard.SetText(Convert.ToBase64String(Crypt.Chat.Encrypt(Encoding.UTF8.GetBytes(sendTextBox.Text))));
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
                MessageBox.Show(Encoding.UTF8.GetString(Crypt.Chat.Decrypt(Convert.FromBase64String(reciveTextBox.Text))));
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}

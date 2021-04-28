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
            Crypt.Actions.ControlRoundBorder(containerPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(baseContainerPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(send, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(sendTextBoxPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(recive, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(reciveTextBoxPanel, new Pen(Color.Silver, 1f));
        }

        private void connect_Click(object sender, EventArgs e)
        {

        }

        private void rightContainerPanel_Paint(object sender, PaintEventArgs e)
        {
            Pen p = new Pen(Color.Silver, 1f);
            e.Graphics.DrawLine(p, 0, 0, 0, baseContainerPanel.Height);
        }
    }
}

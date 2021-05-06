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
    public partial class AsymmetricEncryptForm : PanelForm
    {
        public AsymmetricEncryptForm()
        {
            InitializeComponent();
            Crypt.Actions.ControlRoundBorder(inputPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(outputPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(keyNamePanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(keyPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(button, new Pen(Color.White, 2f));
            Crypt.Actions.ControlRoundBorder(manageKeysButton, new Pen(Color.White, 1f));
            Crypt.Actions.ControlRoundBorder(uploadKeyButton, new Pen(Color.White, 1f));
        }

        private void button_Click(object sender, EventArgs e)
        {
            //try
            //{
                byte[] inputb = Encoding.UTF8.GetBytes(input.Text);
                byte[] outputb = null;
                if(keyRadio.Checked == true)
                {
                    if (String.IsNullOrWhiteSpace(key.Text)) 
                        return;
                    byte[] keyb = Convert.FromBase64String(key.Text);
                    outputb = Crypt.Asymmetric.Encrypt(inputb, keyb);
                }
                else if(keyNameRadio.Checked == true)
                {
                    if (String.IsNullOrWhiteSpace(keyName.Text))
                        return;
                    outputb = Crypt.Asymmetric.Encrypt(inputb, keyName.Text);
                }
                if(outputb != null) output.Text = Convert.ToBase64String(outputb);
            //}
            //catch (System.Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void uploadKeyButton_Click(object sender, EventArgs e)
        {
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    byte[] keyb;
                    using (Stream fs = openFileDialog.OpenFile())
                    {
                        keyb = new byte[fs.Length];
                        fs.Read(keyb, 0, (int)fs.Length);
                    }
                    key.Text = Convert.ToBase64String(keyb);

                    keyRadio.Checked = true;
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}

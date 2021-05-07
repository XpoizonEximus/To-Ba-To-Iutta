using System;
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
    public partial class AsymmetricDecryptForm : PanelForm
    {
        public AsymmetricDecryptForm()
        {
            InitializeComponent();
            Crypt.Actions.ControlRoundBorder(inputPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(outputPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(keyPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(button, new Pen(Color.White, 2f));
            Crypt.Actions.ControlRoundBorder(getPublicKeyButton, new Pen(Color.White, 1f));
            Crypt.Actions.ControlRoundBorder(manageKeysButton, new Pen(Color.White, 1f));
        }
        
        private void button_Click(object sender, EventArgs e)
        {
            try
            {
                if (String.IsNullOrWhiteSpace(keyName.Text))
                    return;
                byte[] inputb = Convert.FromBase64String(input.Text);
                byte[] outputb = Crypt.Asymmetric.Decrypt(inputb, keyName.Text);
                if (outputb != null)
                    output.Text = Encoding.UTF8.GetString(outputb);
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void getPublicKeyButton_Click(object sender, EventArgs e)
        {
            try
            {
                ExportAsymmetricKeyForm f = new ExportAsymmetricKeyForm(keyName.Text);
                f.ShowDialog();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void input_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                button.PerformClick();
        }

        private void keyName_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                button.PerformClick();
        }

        private void manageKeysButton_Click(object sender, EventArgs e)
        {
            SettingsForm f = new SettingsForm(1);
            f.ShowDialog();
        }
    }
}


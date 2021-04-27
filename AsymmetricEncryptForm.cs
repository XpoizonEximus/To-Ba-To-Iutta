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
    public partial class AsymmetricEncryptForm : PanelForm
    {
        public AsymmetricEncryptForm(Crypt.Procedure proc = Crypt.Procedure.Encrypt)
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
                byte[] inputb = Encoding.UTF8.GetBytes(input.Text);
                byte[] outputb = Crypt.Asymmetric.Encrypt(inputb, keyName.Text);
                output.Text = Convert.ToBase64String(outputb);
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}


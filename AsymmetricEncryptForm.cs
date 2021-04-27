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
        private Crypt.Procedure procedure;
        public AsymmetricEncryptForm(Crypt.Procedure proc = Crypt.Procedure.Encrypt)
        {
            InitializeComponent();
            Procedure = proc;
            Crypt.Actions.ControlRoundBorder(inputPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(outputPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(keyPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(button, new Pen(Color.White, 2f));
            Crypt.Actions.ControlRoundBorder(getPublicKeyButton, new Pen(Color.White, 1f));
            Crypt.Actions.ControlRoundBorder(manageKeysButton, new Pen(Color.White, 1f));
        }
        public Crypt.Procedure Procedure
        {
            get => procedure;
            set
            {
                procedure = value;
                if (value == Crypt.Procedure.Encrypt)
                {
                    this.button.Text = " " + "Encrypt";
                    this.button.Image = Crypt.Constants.EncryptButtonImage;
                }
                else
                {
                    this.button.Text = " " + "Decrypt";
                    this.button.Image = Crypt.Constants.DecryptButtonImage;
                }
            }
        }
        public void SwapProcedure() => Procedure = Procedure == Crypt.Procedure.Encrypt ? Crypt.Procedure.Decrypt : Crypt.Procedure.Encrypt;
        private void button_Click(object sender, EventArgs e)
        {
            try
            {
                byte[] inputb;
                byte[] outputb;
                if(Procedure==Crypt.Procedure.Encrypt)
                {
                    inputb = Encoding.UTF8.GetBytes(input.Text);

                }
                else
                {

                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}


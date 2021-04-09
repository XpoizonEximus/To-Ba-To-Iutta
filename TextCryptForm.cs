using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace To_Ba_To_Iutta
{
    public partial class TextCryptForm : PanelForm, Crypt.ISwapProcedure
    {
        private Crypt.Procedure procedure;
        public TextCryptForm(Crypt.Procedure proc = Crypt.Procedure.encrypt)
        {
            InitializeComponent();
            InitializeProcedure(proc);
            Crypt.Actions.ControlRoundBorder(inputPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(outputPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(keyPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(button, new Pen(Color.White, 2f));
        }
        private void InitializeProcedure(Crypt.Procedure proc)
        {
            procedure = proc;
            if (proc == Crypt.Procedure.encrypt)
            {
                this.button.Text = " Encrypt";
                this.button.Image = Crypt.Constants.EncryptButtonImage;
            }
            else
            {
                this.button.Text = " Decrypt";
                this.button.Image = Crypt.Constants.DecryptButtonImage;
            }
        }
        public void SwapProcedure()
        {
            InitializeProcedure(procedure == Crypt.Procedure.encrypt ? Crypt.Procedure.decrypt : Crypt.Procedure.encrypt);
        }

        private void button_Click(object sender, EventArgs e)
        {
            output.Text = input.Text;
        }
    }
}

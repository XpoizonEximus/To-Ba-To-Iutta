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
    public partial class IntroForm: Form
    {
        private readonly Random rand = new Random();

        private const string resPath = "C:\\Users\\xpoiz\\Documents\\Visual Studio 2019\\Projects\\C#\\To_ba_to_iutta\\To_ba_to_iutta\\res\\";

        private readonly Image regBg = Image.FromFile(resPath + "matrix_background_rex_reg.png");
        private readonly Image encryptBg = Image.FromFile(resPath + "matrix_background_rex_encrypt.png");
        private readonly Image decryptBg = Image.FromFile(resPath + "matrix_background_rex_decrypt.png");

        public IntroForm()
        {
            InitializeComponent();
            Init();
        }
        private void Init()
        {
            BackgroundImage = regBg;
            errorTimer.Start();
        }
        private void HandCursor() { this.Cursor = Cursors.Hand; }
        private void ResetDefaultCursor() { this.Cursor = Cursors.Default; }
        private void ResetThis(object sender, EventArgs e)
        {
            ResetDefaultCursor();
            BackgroundImage = regBg;
        }

        private void encryptPanel_MouseEnter(object sender, EventArgs e)
        {
            HandCursor();
            BackgroundImage = encryptBg;
        }

        private void decryptPanel_MouseEnter(object sender, EventArgs e)
        {
            HandCursor();
            BackgroundImage = decryptBg;
        }

        private void errorTimer_Tick(object sender, EventArgs e)
        {
            if (rand.Next(0, 35) == 0) this.Invalidate();
        }
    }
}

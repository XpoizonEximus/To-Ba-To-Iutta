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
    public partial class MainForm : Form
    {
        public MainForm(bool showSplash = true)
        {
            if (showSplash) showSplashForm();
            InitializeComponent();
            textboxFocusInit();
        }

        #region Procedures
        private void showSplashForm()
        {
            SplashForm f = new SplashForm();
            f.ShowDialog();
        }

        private void textboxResize()
        {
            int h = mainPanel.Size.Height;
            encryptedTextbox.Size = new Size(encryptedTextbox.Size.Width, (h - 12) / 2 - 3);
            decryptedTextbox.Location = new Point(decryptedTextbox.Location.X, 6 + encryptedTextbox.Size.Height + 6);
            decryptedTextbox.Size = new Size(decryptedTextbox.Size.Width, (h - 12) / 2 - 3);
        }

        private void textboxGotFocus(TextBox textbox)
        {
            if (textbox.ForeColor == Color.Silver)
            {
                textbox.Font = Crypt.TextboxFont(true);
                textbox.Text = "";
                textbox.ForeColor = Color.Black;
            }
        }
        private void textboxLostFocus(TextBox textbox, Crypt.Procedure p)
        {
            if (string.IsNullOrWhiteSpace(textbox.Text))
            {
                textbox.Text = "Introduceți aici textul pe care doriți să îl ";

                if (p == Crypt.Procedure.encrypt) textbox.Text += "criptați";
                else textbox.Text += "decriptați";

                textbox.Text += "...";

                textbox.Font = Crypt.TextboxFont(false);

                textbox.ForeColor = Color.Silver;
            }
        }
        private void textboxFocusInit()
        {
            encryptedTextbox.GotFocus += encryptedTextbox_GotFocus;
            encryptedTextbox.LostFocus += encryptedTextbox_LostFocus;
            decryptedTextbox.GotFocus += decryptedTextbox_GotFocus;
            decryptedTextbox.LostFocus += decryptedTextbox_LostFocus;
        }
        #endregion

        #region Events
        private void MainForm_Resize(object sender, EventArgs e)
        {
            textboxResize();
        }

        private void encryptedTextbox_GotFocus(object sender, EventArgs e) { textboxGotFocus(encryptedTextbox); }
        private void decryptedTextbox_GotFocus(object sender, EventArgs e) { textboxGotFocus(decryptedTextbox); }
        private void encryptedTextbox_LostFocus(object sender, EventArgs e) { textboxLostFocus(encryptedTextbox, Crypt.Procedure.decrypt); }
        private void decryptedTextbox_LostFocus(object sender, EventArgs e) { textboxLostFocus(decryptedTextbox, Crypt.Procedure.encrypt); }

        #endregion
    }
}

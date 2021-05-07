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
    public partial class NewAsymmetricKeyForm : Form
    {
        private string KeyXml { get; set; }
        private bool IsPublic { get; set; }
        public NewAsymmetricKeyForm(bool isPublic = false)
        {
            IsPublic = isPublic;
            KeyXml = null;
            InitializeComponent();
            if (IsPublic) optionalLabel.Visible = false;
            else optionalLabel.Visible = true;
            this.DialogResult = DialogResult.Cancel;
        }

        private void cancelButton_Click(object sender, EventArgs e) => this.Close();

        private void importButton_Click(object sender, EventArgs e)
        {
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                using (Stream stream = openFileDialog.OpenFile())
                {
                    using (StreamReader sr = new StreamReader(stream))
                    {
                        KeyXml = sr.ReadToEnd();
                    }
                }
                importLabel.Text = openFileDialog.FileName;
            }
        }

        private void createButton_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrWhiteSpace(nameTextBox.Text))
                return;
            byte[] xml = null;
            if(IsPublic)
            {
                if (!String.IsNullOrWhiteSpace(keyTextBox.Text))
                    xml = Convert.FromBase64String(keyTextBox.Text);
                else if (!String.IsNullOrWhiteSpace(KeyXml))
                    xml = Encoding.UTF8.GetBytes(KeyXml);
                else
                    MessageBox.Show("You need to insert a key or import one.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            Crypt.Asymmetric.CreateNewKeyContainer(nameTextBox.Text, xml != null, xml);

            if (Crypt.Asymmetric.VerifyKeyContainerExistence(nameTextBox.Text))
            {
                if (IsPublic) Properties.Settings.Default.PublicKeyPairs += nameTextBox.Text + "\r\r";
                else Properties.Settings.Default.PrivateKeyPairs += nameTextBox.Text + "\r\r";

                this.DialogResult = DialogResult.OK;
            }

            this.Close();
        }
    }
}

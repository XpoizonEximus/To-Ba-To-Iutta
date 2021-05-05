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
    public partial class SettingsForm : Form
    {
        private readonly Properties.Settings Settings = Properties.Settings.Default;
        #region Load Settings
        private void LoadSettings()
        {
            try
            {
                //Symmetric
                LoadSymmetricAlgorythm();
                LoadSymmetricIV();
                LoadSymmetricPadding();
                LoadSymmetricMode();

                //Asymmetric
                LoadAsymmetricAlgorythm();
                LoadAsymmetricKeySize();
                LoadAsymmetricPadding();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + "\n--Please reopen settings menu.--", "Settings Error", MessageBoxButtons.OK);
                Settings.Reset();
                this.Close();
            }
}       //Symmetric
        private void LoadSymmetricAlgorythm()
        {
            switch (Settings.SymmetricAlgorythm)
            {
                case "AES": { AESRadioButton.Checked = true; break; }
                case "DES3": { DES3RadioButton.Checked = true; break; }
                case "RC2": { RC2RadioButton.Checked = true; break; }
                case "DES": { DESRadioButton.Checked = true; break; }
                default: { throw new Exception("Symmetric Algorythm Settings error. Resetting all settings."); }
            }
        }
        private void LoadSymmetricIV()
        {
            if (String.IsNullOrWhiteSpace(Settings.SymmetricIV))
                deriveIVRadioButton.Checked = true;
            else
            {
                customIVRadioButton.Checked = true;
                customIVTextBox.Text = Settings.SymmetricIV;
            }
        }
        private void LoadSymmetricPadding()
        {
            switch (Settings.SymmetricPadding)
            {
                case "PKCS7"   : { symmetricPKCS7RadioButton.Checked = true; break; }
                case "ANSIX923": { symmetricANSIX923RadioButton.Checked = true; break; }
                case "ISO10126": { symmetricISO10126RadioButton.Checked = true; break; }
                case "Zeros"   : { symmetricZerosRadioButton.Checked = true; break; }
                case "None"    : { symmetricNoneRadioButton.Checked = true; break; }
                default: { throw new Exception("Symmetric Padding Settings error. Resetting all settings."); }
            }
        }
        private void LoadSymmetricMode()
        {
            switch (Settings.SymmetricMode)
            {
                case "CBC": { CBCRadioButton.Checked = true; break; }
                case "ECB": { ECBRadioButton.Checked = true; break; }
                case "CFB": { CFBRadioButton.Checked = true; break; }
                case "CTS": { CTSRadioButton.Checked = true; break; }
                case "OFB": { OFBRadioButton.Checked = true; break; }
                default: { throw new Exception("Symmetric Mode Settings error. Resetting all settings."); }
            }
        }
        //Asymmetric
        private void LoadAsymmetricAlgorythm()
        {
            //
        }
        private void LoadAsymmetricKeySize()
        {
            int size = Settings.AsymmetricKeySize;
            if(size < 1 || size > 10) throw new Exception("Symmetric Mode Settings error. Resetting all settings.");
            keySizeNumericUpDown.Value = size;
        }
        private void LoadAsymmetricPadding()
        {
            switch (Settings.AsymmetricPadding)
            {
                case "PKCS1": { asymmetricPKCS1RadioButton.Checked = true; break; }
                case "SHA256": { asymmetricSHA256RadioButton.Checked = true; break; }
                case "SHA384": { asymmetricSHA384RadioButton.Checked = true; break; }
                case "SHA512": { asymmetricSHA512RadioButton.Checked = true; break; }
                case "SHA1": { asymmetricSHA1RadioButton.Checked = true; break; }
                default: { throw new Exception("Asymmetric Padding Settings error. Resetting all settings."); }
            }
        }
        #endregion
        #region Save Settings
        private void SaveSettings()
        {
            /*
            //Symmetric
            SaveSymmetricAlgorythm();
            SaveSymmetricIV();
            SaveSymmetricPadding();
            SaveSymmetricMode();

            //Asymmetric
            SaveAsymmetricAlgorythm();
            SaveAsymmetricKeySize();
            SaveAsymmetricPadding();
            */
        }
        #endregion
        public SettingsForm()
        {
            InitializeComponent();
        }

        private void cancelButton_Click(object sender, EventArgs e) => this.Close();
        private void saveButton_Click(object sender, EventArgs e)
        {
            SaveSettings();
            this.Close();
        }

        private void SettingsForm_Resize(object sender, EventArgs e)
        {
            int width = (asymmetricKeysGroupBox.Size.Width - 18) / 2;
            Size size = new Size(width, asymmetricKeysGroupBox.Size.Height - 30);
            privateKeysGroupBox.Size = size;
            publicKeysGroupBox.Size = size;

            publicKeysGroupBox.Location = new Point(width + 12, publicKeysGroupBox.Location.Y);

            privateListName.Width = privateKeysListView.Size.Width;
            publicListName.Width = publicKeysListView.Size.Width;
        }
        private void customIVRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            if (customIVRadioButton.Checked == true) customIVTextBox.Enabled = true;
            else customIVTextBox.Enabled = false;
        }
        private void SettingsForm_Load(object sender, EventArgs e)
        {
            LoadSettings();
        }
    }
}

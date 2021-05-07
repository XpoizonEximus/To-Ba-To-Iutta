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
                LoadAsymmetricPrivateKeys();
                LoadAsymmetricPublicKeys();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + "\n--Please reopen settings menu.--", "Settings Error", MessageBoxButtons.OK);
                Settings.Reset();
                this.Close();
            }
        }       
        //Symmetric
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
                randomIVRadioButton.Checked = true;
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
        private void LoadAsymmetricPrivateKeys()
        {
            string str = Settings.PrivateKeyPairs;
            string[] vals = str.Split(new string[]{ "\r\r" }, StringSplitOptions.RemoveEmptyEntries);
            privateKeysListView.Items.Clear();
            foreach(string val in vals)
            {
                privateKeysListView.Items.Add(new ListViewItem(val));
            }
        }
        private void LoadAsymmetricPublicKeys()
        {
            string str = Settings.PublicKeyPairs;
            string[] vals = str.Split(new string[] { "\r\r" }, StringSplitOptions.RemoveEmptyEntries);
            publicKeysListView.Items.Clear();
            foreach (string val in vals)
            {
                publicKeysListView.Items.Add(new ListViewItem(val));
            }
        }
        #endregion
        #region Save Settings
        private void SaveSettings()
        {
            
            //Symmetric
            SaveSymmetricAlgorythm();
            SaveSymmetricIV();
            SaveSymmetricPadding();
            SaveSymmetricMode();

            //Asymmetric
            SaveAsymmetricAlgorythm();
            SaveAsymmetricPrivateKeys();
            SaveAsymmetricPublicKeys();

            //Save
            Settings.Save();
        }
        //Symmetric
        private void SaveSymmetricAlgorythm()
        {
            if (AESRadioButton.Checked) Settings.SymmetricAlgorythm = "AES";
            else if (DES3RadioButton.Checked) Settings.SymmetricAlgorythm = "DES3";
            else if (RC2RadioButton.Checked) Settings.SymmetricAlgorythm = "RC2";
            else if (DESRadioButton.Checked) Settings.SymmetricAlgorythm = "DES";
        }
        private void SaveSymmetricIV()
        {
            if (randomIVRadioButton.Checked)
                Settings.SymmetricIV = "";
            else
                Settings.SymmetricIV = customIVTextBox.Text;
        }
        private void SaveSymmetricPadding()
        {
            if (symmetricPKCS7RadioButton.Checked) Settings.SymmetricPadding = "PKCS7";
            else if (symmetricANSIX923RadioButton.Checked) Settings.SymmetricPadding = "ANSIX923";
            else if (symmetricISO10126RadioButton.Checked) Settings.SymmetricPadding = "ISO10126";
            else if (symmetricZerosRadioButton.Checked) Settings.SymmetricPadding = "Zeros";
            else if (symmetricNoneRadioButton.Checked) Settings.SymmetricPadding = "None";
        }
        private void SaveSymmetricMode()
        {
            if (CBCRadioButton.Checked) Settings.SymmetricMode = "CBC";
            else if (ECBRadioButton.Checked) Settings.SymmetricMode = "ECB";
            else if (CFBRadioButton.Checked) Settings.SymmetricMode = "CFB";
            else if (CTSRadioButton.Checked) Settings.SymmetricMode = "CTS";
            else if (OFBRadioButton.Checked) Settings.SymmetricMode = "OFB";
        }
        //Asymmetric
        private void SaveAsymmetricAlgorythm()
        {
            //
        }
        private void SaveAsymmetricPrivateKeys()
        {
            List<char> list = new List<char>();
            foreach(ListViewItem i in privateKeysListView.Items)
            {
                list.AddRange(i.Text);
                list.AddRange("\r\r");
            }
            string vals = new string(list.ToArray());
            Settings.PrivateKeyPairs = vals;
        }
        private void SaveAsymmetricPublicKeys()
        {
            List<char> list = new List<char>();
            foreach (ListViewItem i in publicKeysListView.Items)
            {
                list.AddRange(i.Text);
                list.AddRange("\r\r");
            }
            string vals = new string(list.ToArray());
            Settings.PublicKeyPairs = vals;
        }
        #endregion
        public SettingsForm(int index = 0)
        {
            InitializeComponent();
            tabControl.SelectedIndex = index;
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

            privateListName.Width = privateKeysListView.Size.Width - 2;
            publicListName.Width = publicKeysListView.Size.Width - 2;
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

        private void newPrivateKeyButton_Click(object sender, EventArgs e)
        {
            NewAsymmetricKeyForm f = new NewAsymmetricKeyForm(false);
            if (f.ShowDialog() == DialogResult.OK)
                this.LoadAsymmetricPrivateKeys();
            Settings.Save();
        }
        private void newPublicKeyButton_Click(object sender, EventArgs e)
        {
            NewAsymmetricKeyForm f = new NewAsymmetricKeyForm(true);
            if (f.ShowDialog() == DialogResult.OK)
                this.LoadAsymmetricPublicKeys();
            Settings.Save();
        }

        private void deletePrivateKeyButton_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Deleting keys loses their data forever. Consider saving them first.", "Warning", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) != DialogResult.OK) return;
            foreach (ListViewItem i in privateKeysListView.SelectedItems)
            {
                Crypt.Asymmetric.DeleteKey(i.Text);
                privateKeysListView.Items.Remove(i);
            }
            SaveAsymmetricPrivateKeys();
            Settings.Save();
        }
        private void deletePublicButton_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Deleting keys loses their data forever. Consider saving them first.", "Warning", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) != DialogResult.OK) return;
            foreach (ListViewItem i in publicKeysListView.SelectedItems)
            {
                Crypt.Asymmetric.DeleteKey(i.Text);
                publicKeysListView.Items.Remove(i);
            }
            SaveAsymmetricPublicKeys();
            Settings.Save();
        }

        private void exportPrivateKeyButton_Click(object sender, EventArgs e)
        {
            if (privateKeysListView.SelectedItems.Count == 0) return;
            bool includePrivate;
            if (MessageBox.Show("Do you want to include the private paramters?", "Include private parameters", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes) includePrivate = true;
            else includePrivate = false;
            if (includePrivate) if (MessageBox.Show("Exporting the private parameters should be done only for backup purposes. After restoring the backup, *.ck files should be permanently deleted as they store private information. For encryption, public paramenters are the only one needed. Do you want to continue?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.No) return;

            foreach (ListViewItem i in privateKeysListView.SelectedItems)
            {
                ExportAsymmetricKeyForm f = new ExportAsymmetricKeyForm(i.Text, includePrivate);
                f.ShowDialog();
            }
        }
        private void exportPublicKeyButton_Click(object sender, EventArgs e)
        {
            if (publicKeysListView.SelectedItems.Count == 0) return;
            foreach (ListViewItem i in publicKeysListView.SelectedItems)
            {
                ExportAsymmetricKeyForm f = new ExportAsymmetricKeyForm(i.Text, false);
                f.ShowDialog();
            }
        }

        private void defaultsButton_Click(object sender, EventArgs e)
        {
            Settings.Reset();
            LoadSettings();
        }
    }
}

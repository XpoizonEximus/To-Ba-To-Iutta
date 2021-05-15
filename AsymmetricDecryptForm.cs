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
    public partial class AsymmetricDecryptForm : PanelForm
    {
        public AsymmetricDecryptForm()
        {
            InitializeComponent();
            ControlRoundBorder();
        }
        private void ControlRoundBorder()
        {
            Crypt.Actions.ControlRoundBorder(inputPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(inputBottomPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(uploadFileButton, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(clearInputButton, new Pen(Color.Silver, 1.0f));

            Crypt.Actions.ControlRoundBorder(outputPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(outputBottomPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(saveFileButton, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(copyButton, new Pen(Color.Silver, 1.0f));

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

                if (input.Text.Length > Crypt.Constants.MaxInputLength)
                    input.Text = "";
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

        private void input_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                button.PerformClick();
                input.Text.Trim();
            }
        }
        private void keyName_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                button.PerformClick();
                keyName.Text.Trim();
            }
        }

        private void manageKeysButton_Click(object sender, EventArgs e)
        {
            SettingsForm f = new SettingsForm(1);
            f.ShowDialog();
        }

        #region Bottom panels
        #region Bottom panels apear/disappear

        private void inputPanel_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.Location.Y >= inputBottomPanel.Location.Y - 30)
                inputBottomPanel.Visible = true;
            else
                inputBottomPanel.Visible = false;
        }
        private void inputBottomPanel_MouseLeave(object sender, EventArgs e) => inputBottomPanel.Visible = false;

        private void outputPanel_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.Location.Y >= outputBottomPanel.Location.Y - 30)
                outputBottomPanel.Visible = true;
            else
                outputBottomPanel.Visible = false;
        }
        private void outputBottomPanel_MouseLeave(object sender, EventArgs e) => outputBottomPanel.Visible = false;
        #endregion
        #region Bottom panels functionality
        private void SaveFile()
        {
            string ext;
            string name;

            byte[] fileb;
            string file;

            string[] parts;
            string s = output.Text;

            parts = s.Split("\a\a\b\b".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

            if (parts.Length == 1)
            {
                file = s;
                fileb = Encoding.UTF8.GetBytes(s);
                ext = ".txt";
                name = "";
            }
            else if (parts.Length == 3)
            {
                ext = parts[0];
                name = parts[1];
                file = parts[2];
                fileb = Convert.FromBase64String(file);
            }
            else
            {
                MessageBox.Show("This is not a valid input to save to a file.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            saveFileDialog.FileName = name;
            saveFileDialog.DefaultExt = ext.Remove(0, 1);
            saveFileDialog.Filter = ext + " files|*" + ext + "|All files (*.*)|*.*";

            if (saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                using (Stream stream = saveFileDialog.OpenFile())
                    stream.Write(fileb, 0, fileb.Length);
            }
        }
        private void UploadEncryptedFile(string path = null)
        {
            byte[] inputb;
            if (path == null)
            {
                if (openEncryptedFileDialog.ShowDialog() != DialogResult.OK)
                    return;
                using (Stream stream = openEncryptedFileDialog.OpenFile())
                {
                    inputb = new byte[stream.Length];
                    stream.Read(inputb, 0, (int)stream.Length);
                }
            }
            else
            {
                using (FileStream stream = new FileStream(path, FileMode.Open))
                {
                    inputb = new byte[stream.Length];
                    stream.Read(inputb, 0, (int)stream.Length);
                }
            }
            string inputs = Convert.ToBase64String(inputb);
            input.Text = inputs;
        }

        private void uploadFileButton_Click(object sender, EventArgs e)
        {
            UploadEncryptedFile();
        }
        private void saveFileButton_Click(object sender, EventArgs e)
        {
            if (output.Text == "") return;
            SaveFile();
        }
        private void copyButton_Click(object sender, EventArgs e)
        {
            if (output.Text != null)
                Clipboard.SetText(output.Text);
        }
        private void clearInputButton_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Are you sure?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.OK)
                input.Text = "";
        }
        #endregion
        #endregion
        #region Drag-Drop Data
        string dropFilesString = "Drop files here...";
        private void input_DragDrop(object sender, DragEventArgs e)
        {
            dropFilesString = "Drop files here...";

            if (!e.Data.GetDataPresent(DataFormats.FileDrop))
            {
                MessageBox.Show("Please drop a file.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            string[] paths = (string[])e.Data.GetData(DataFormats.FileDrop);
            if (paths.Length != 1)
            {
                MessageBox.Show("Please drop only a single file.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            string path = paths[0];

            UploadEncryptedFile(path);
        }
        private void input_DragEnter(object sender, DragEventArgs e)
        {
            string tmp = dropFilesString;
            dropFilesString = input.Text;
            input.Text = tmp;

            e.Effect = DragDropEffects.Copy;
        }
        private void input_DragLeave(object sender, EventArgs e)
        {
            string tmp = dropFilesString;
            dropFilesString = input.Text;
            input.Text = tmp;
        }
        #endregion
    }
}


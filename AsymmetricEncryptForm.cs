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
    public partial class AsymmetricEncryptForm : PanelForm
    {
        public AsymmetricEncryptForm()
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

            Crypt.Actions.ControlRoundBorder(keyNamePanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(keyPanel, new Pen(Color.Silver, 1f));
            Crypt.Actions.ControlRoundBorder(button, new Pen(Color.White, 2f));
            Crypt.Actions.ControlRoundBorder(manageKeysButton, new Pen(Color.White, 1f));
            Crypt.Actions.ControlRoundBorder(uploadKeyButton, new Pen(Color.White, 1f));
        }

        private void button_Click(object sender, EventArgs e)
        {
            try
            {
                byte[] inputb = Encoding.UTF8.GetBytes(input.Text);
                byte[] outputb = null;
                if(keyRadio.Checked == true)
                {
                    if (String.IsNullOrWhiteSpace(key.Text)) 
                        return;
                    byte[] keyb = Convert.FromBase64String(key.Text);
                    outputb = Crypt.Asymmetric.Encrypt(inputb, keyb);
                }
                else if(keyNameRadio.Checked == true)
                {
                    if (String.IsNullOrWhiteSpace(keyName.Text))
                        return;
                    outputb = Crypt.Asymmetric.Encrypt(inputb, keyName.Text);
                }
                if(outputb != null) output.Text = Convert.ToBase64String(outputb);

                if (input.Text.Length > Crypt.Constants.MaxInputLength)
                    input.Text = "";
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void uploadKeyButton_Click(object sender, EventArgs e)
        {
            if (openKeyFileDialog.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    byte[] keyb;
                    using (Stream fs = openKeyFileDialog.OpenFile())
                    {
                        keyb = new byte[fs.Length];
                        fs.Read(keyb, 0, (int)fs.Length);
                    }
                    key.Text = Convert.ToBase64String(keyb);

                    keyRadio.Checked = true;
                    key.Focus();
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void keyName_TextChanged(object sender, EventArgs e) => keyNameRadio.Checked = true;
        private void key_TextChanged(object sender, EventArgs e) => keyRadio.Checked = true;

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
        private void key_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                button.PerformClick();
                key.Text.Trim();
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
        private void UploadFile(string path = null)
        {
            string ext;
            string name;

            byte[] fileb;
            string file;

            if (path == null)
            {
                if (openKeyFileDialog.ShowDialog() != DialogResult.OK)
                    return;
                ext = Path.GetExtension(openKeyFileDialog.FileName);
                name = openKeyFileDialog.SafeFileName;
                using (Stream stream = openKeyFileDialog.OpenFile())
                {
                    fileb = new byte[stream.Length];
                    stream.Read(fileb, 0, (int)stream.Length);
                }
            }
            else
            {
                ext = Path.GetExtension(path);
                name = Path.GetFileName(path);
                using (FileStream stream = new FileStream(path, FileMode.Open))
                {
                    fileb = new byte[stream.Length];
                    stream.Read(fileb, 0, (int)stream.Length);
                }
            }
            file = Convert.ToBase64String(fileb);

            if (ext == "") ext = ".txt";

            string s = ext + "\a\a\b\b" + name + "\a\a\b\b" + file;
            input.Text = s;
        }
        private void SaveEncryptedFile()
        {
            if (saveEncryptedFileDialog.ShowDialog() == DialogResult.OK)
            {
                string outputs = output.Text;
                byte[] outputb = Convert.FromBase64String(outputs);
                using (Stream stream = saveEncryptedFileDialog.OpenFile())
                    stream.Write(outputb, 0, outputb.Length);
            }
        }

        private void uploadFileButton_Click(object sender, EventArgs e)
        {
            UploadFile();
        }
        private void saveFileButton_Click(object sender, EventArgs e)
        {
            if (output.Text == "") return;

            SaveEncryptedFile();
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

            UploadFile(path);
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

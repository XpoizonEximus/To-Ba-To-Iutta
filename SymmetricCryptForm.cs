using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace To_Ba_To_Iutta
{
    public partial class SymmetricCryptForm : PanelForm, Crypt.ISwapProcedure
    {
        private Crypt.Procedure procedure;
        public SymmetricCryptForm(Crypt.Procedure proc = Crypt.Procedure.Encrypt)
        {
            InitializeComponent();
            Procedure = proc;
            ControlRoundBorder();

            if (Procedure == Crypt.Procedure.Encrypt)
                input.Text = Properties.Settings.Default.LastSymmetricEncryptInput;
            else
                input.Text = Properties.Settings.Default.LastSymmetricDecryptInput;
        }
        private void ControlRoundBorder()
        {
            Crypt.Actions.ControlRoundBorder(inputPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(inputBottomPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(uploadFileButton, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(clearInputButton, new Pen(Color.Silver, 1.0f));

            Crypt.Actions.ControlRoundBorder(outputPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(outputBottomPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(saveFileButton, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(copyButton, new Pen(Color.Silver, 1.0f));

            Crypt.Actions.ControlRoundBorder(keyPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(button, new Pen(Color.White, 2f));
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
                if (String.IsNullOrWhiteSpace(key.Text)) return;
                byte[] inputb = (procedure == Crypt.Procedure.Encrypt ? Encoding.UTF8.GetBytes(input.Text) : Convert.FromBase64String(input.Text));
                byte[] keyb = Encoding.UTF8.GetBytes(key.Text);

                byte[] outputb;
                if (Procedure == Crypt.Procedure.Encrypt)
                    outputb = Crypt.Symmetric.Encrypt(inputb, keyb);
                else
                    outputb = Crypt.Symmetric.Decrypt(inputb, keyb);
                if (outputb != null) 
                    output.Text = (procedure == Crypt.Procedure.Encrypt ? Convert.ToBase64String(outputb) : Encoding.UTF8.GetString(outputb));

                if (input.Text.Length > Crypt.Constants.MaxInputLength)
                    input.Text = "";
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        #region KeyUp
        private void key_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                button.PerformClick();
        }
        private void input_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                button.PerformClick();
        }
        #endregion
        #region Bottom panels
        #region Bottom panels apear/disappear
        private void input_TextChanged(object sender, EventArgs e)
        {
            if (Procedure == Crypt.Procedure.Encrypt)
                Properties.Settings.Default.LastSymmetricEncryptInput = input.Text;
            else
                Properties.Settings.Default.LastSymmetricDecryptInput = input.Text;
        }

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
                if (openFileDialog.ShowDialog() != DialogResult.OK)
                    return;
                ext = Path.GetExtension(openFileDialog.FileName);
                name = openFileDialog.SafeFileName;
                using (Stream stream = openFileDialog.OpenFile())
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
        private void SaveFile()
        {
            string ext;
            string name;

            byte[] fileb;
            string file;

            string[] parts;
            string s = output.Text;

            parts = s.Split("\a\a\b\b".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);

            if(parts.Length == 1)
            {
                file = s;
                fileb = Encoding.UTF8.GetBytes(s);
                ext = ".txt";
                name = "";
            }
            else if(parts.Length == 3)
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

            if(saveFileDialog.ShowDialog() == DialogResult.OK)
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
                using (FileStream stream = new FileStream(path,FileMode.Open))
                {
                    inputb = new byte[stream.Length];
                    stream.Read(inputb, 0, (int)stream.Length);
                }
            }
            string inputs = Convert.ToBase64String(inputb);
            input.Text = inputs;
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
            if (Procedure == Crypt.Procedure.Encrypt)
                UploadFile();
            else
                UploadEncryptedFile();
        }
        private void saveFileButton_Click(object sender, EventArgs e)
        {
            if (output.Text == "") return;
            if (Procedure == Crypt.Procedure.Decrypt)
                SaveFile();
            else
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
        #region Drag-Drop
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
            if(paths.Length != 1)
            {
                MessageBox.Show("Please drop only a single file.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            string path = paths[0];

            if (Procedure == Crypt.Procedure.Encrypt)
                UploadFile(path);
            else
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

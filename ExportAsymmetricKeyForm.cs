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
    public partial class ExportAsymmetricKeyForm : Form
    {
        private byte[] Key { get; set; }
        private string KeyContainerName { get; set; }
        public ExportAsymmetricKeyForm(string keyContainerName, bool includePrivate = false)
        {
            InitializeComponent();
            KeyContainerName = keyContainerName;
            Key = Crypt.Asymmetric.GetKeyXmlBlob(keyContainerName, includePrivate);

            key.Text = Convert.ToBase64String(Key);

            this.DialogResult = DialogResult.Cancel;
        }

        private void save_Click(object sender, EventArgs e)
        {
            saveFileDialog.FileName = KeyContainerName;
            if (saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                using (Stream fs = saveFileDialog.OpenFile())
                    fs.Write(Key, 0, Key.Length);

                this.DialogResult = DialogResult.OK;
                this.Close();
            }
        }
        private void copy_Click(object sender, EventArgs e)
        {
            Clipboard.SetText(Convert.ToBase64String(Key));

            this.DialogResult = DialogResult.OK;
            this.Close();
        }
    }
}

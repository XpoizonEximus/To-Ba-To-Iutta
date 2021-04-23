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
using System.Security.Cryptography;

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
            Aes aes = Aes.Create();

            SHA256 sha = SHA256.Create();
            using (MemoryStream keyStream = new MemoryStream())
            using (StreamWriter keystreamWriter = new StreamWriter(keyStream))
            {
                keystreamWriter.Write(key.Text);
                byte[] keyb = sha.ComputeHash(keyStream);
                aes.Key = keyb;
            }

            /*
            using (FileStream encryptfilestream = new FileStream("C:\\encr.txt", FileMode.Create))
            using (CryptoStream encryptstream = new CryptoStream(encryptfilestream, aes.CreateEncryptor(), CryptoStreamMode.Write))
            using (StreamWriter encryptstreamwriter = new StreamWriter(encryptstream))
            {
                encryptstreamwriter.Write(input.Text);
            }

            using (FileStream decryptfilestream = new FileStream("C:\\encr.txt", FileMode.Open))
            using (CryptoStream decryptstream = new CryptoStream(decryptfilestream, aes.CreateDecryptor(), CryptoStreamMode.Read))
            using (StreamReader encryptstreamreader = new StreamReader(decryptstream))
            {
                output.Text = encryptstreamreader.ReadToEnd();
            }
            */
            /*
            using (MemoryStream encryptmemorystream = new MemoryStream())
            {
                using (CryptoStream encryptstream = new CryptoStream(encryptmemorystream, aes.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    using (StreamWriter encryptstreamwriter = new StreamWriter(encryptstream))
                    {
                        encryptstreamwriter.Write(input.Text);
                    }
                    output.Text = Convert.ToBase64String(encryptmemorystream.ToArray());
                }
            }

            using (FileStream decryptfilestream = new FileStream(@"C:\encr.txt", FileMode.Create))
            {
                using (CryptoStream decryptstream = new CryptoStream(decryptfilestream, aes.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    byte[] inputbytes = Convert.FromBase64String(output.Text);
                    decryptstream.Write(inputbytes, 0, inputbytes.Length);
                }
            }
            */
        }
    }
}

using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;
using System;

namespace To_Ba_To_Iutta
{
    public static class Crypt
    {
        #region Data Types
        public enum Procedure { Encrypt = 0, Decrypt = 1 }
        public enum CryptoAlgorythm { Symmetric = 0, Asymmetric = 1}
        public enum ChatElementType { Sender = 0, Receiver = 1}
        public interface ISwapProcedure { void SwapProcedure(); }
        public class ColorTheme
        {
            public Color Primary;
            public Color Secondary;
            public Color Background;
            public Color ChatSender;
            public Color ChatReceiver;
            public ColorTheme(Color primary, Color secondary, Color background, Color chatSender, Color chatReceiver)
            {
                Primary = primary;
                Secondary = secondary;
                Background = background;
                ChatSender = chatSender;
                ChatReceiver = chatReceiver;
            }
        }

        private class ControlRoundBorderComponent
        {
            private Control Control;
            private Pen pen;
            private float CornerRadius;
            public ControlRoundBorderComponent(Control pa, Pen pe, float rad = Crypt.Constants.PanelBorderRadius)
            {
                Control = pa;
                pen = pe;
                CornerRadius = rad;
            }
            public void PanelRoundBorder_SetRegion()
            {
                float i = pen.Width/2;
                CornerRadius *= 2;
                Rectangle Bounds = new Rectangle(0, 0, (int)(Control.Width + pen.Width), (int)(Control.Height + pen.Width));
                System.Drawing.Drawing2D.GraphicsPath path = new System.Drawing.Drawing2D.GraphicsPath();
                path.AddArc(Bounds.X+i, Bounds.Y+i, CornerRadius, CornerRadius, 180, 90);
                path.AddArc(Bounds.X + Bounds.Width - CornerRadius-i, Bounds.Y+i, CornerRadius, CornerRadius, 270, 90);
                path.AddArc(Bounds.X + Bounds.Width - CornerRadius-i, Bounds.Y + Bounds.Height - CornerRadius-i, CornerRadius, CornerRadius, 0, 90);
                path.AddArc(Bounds.X+i, Bounds.Y + Bounds.Height - CornerRadius-i, CornerRadius, CornerRadius, 90, 90);
                path.CloseAllFigures();
                CornerRadius /= 2;

                Control.Region = new Region(path);
            }
            public void PanelRoundBorder_PaintHandler(object sender, PaintEventArgs e)
            {
                float i = pen.Width;

                e.Graphics.DrawLine(pen, i, i + CornerRadius, i, Control.Height - i - CornerRadius);
                e.Graphics.DrawLine(pen, i + CornerRadius, i, Control.Width - i - CornerRadius, i);
                e.Graphics.DrawLine(pen, Control.Width - CornerRadius, Control.Height - i, i + CornerRadius, Control.Height - i);
                e.Graphics.DrawLine(pen, Control.Width - i, Control.Height - CornerRadius, Control.Width - i, i + CornerRadius);

                e.Graphics.DrawArc(pen, i, i, 2 * CornerRadius, 2 * CornerRadius, 180, 90);
                e.Graphics.DrawArc(pen, Control.Width - i - 2 * CornerRadius, i, 2 * CornerRadius, 2 * CornerRadius, 270, 90);
                e.Graphics.DrawArc(pen, Control.Width - i - 2 * CornerRadius, Control.Height - i - 2 * CornerRadius, 2 * CornerRadius, 2 * CornerRadius, 0, 90);
                e.Graphics.DrawArc(pen, i, Control.Height - i - 2 * CornerRadius, 2 * CornerRadius, 2 * CornerRadius, 90, 90);
            }
        }
        #endregion

        public static class Constants
        {
            public static readonly string DefaultFont = "Helvetica";

            public const float FormBorderRadius = 20;
            public const float PanelBorderRadius = 10;

            public static readonly Image EncryptButtonImage = Image.FromFile("C:\\Users\\xpoiz\\Documents\\Visual Studio 2019\\Projects\\C#\\To-Ba-To-Iutta\\res\\padlock-3-24.png");
            public static readonly Image DecryptButtonImage = Image.FromFile("C:\\Users\\xpoiz\\Documents\\Visual Studio 2019\\Projects\\C#\\To-Ba-To-Iutta\\res\\key-24.png");

            public static readonly ColorTheme[] ColorThemeCollection =
            {
                new ColorTheme
                (
                    Color.FromArgb(0, 17, 32),
                    Color.FromArgb(0, 22, 42),
                    Color.FromArgb(1, 39, 74),
                    Color.FromArgb(44, 75, 105),
                    Color.FromArgb(44, 105, 75)
                ),
                new ColorTheme
                (
                    Color.FromArgb(49, 40, 35),
                    Color.FromArgb(65, 57, 52),
                    Color.FromArgb(90, 82, 78),
                    Color.FromArgb(0, 0, 0),
                    Color.FromArgb(0, 0, 0)
                )
            };
        }

        public static class Actions
        {
            public static void Initialize(MainForm form)
            {
                form.Procedure = Procedure.Encrypt;
                form.Algorythm = CryptoAlgorythm.Symmetric;
                form.Chat = false;

                Data.MainPanelForm = new ChatCryptForm();

                Symmetric.Algorythm = Aes.Create();
                byte[] SymmetricIV = { 0x34, 0xf0, 0x34, 0xf0, 0x34, 0xf0, 0x34, 0xf0, 0x34, 0xf0, 0x34, 0xf0, 0x34, 0xf0, 0x34, 0xf0 };
                Symmetric.Algorythm.IV = SymmetricIV;

                Asymmetric.keySize = 2048;
                Asymmetric.rsaEncryptionPadding = RSAEncryptionPadding.OaepSHA512;
            }
            public static void ControlRoundBorder(Control Control, Pen pen, DashStyle dashstyle = DashStyle.Solid)
            {
                pen.DashStyle = dashstyle;
                ControlRoundBorderComponent c = new ControlRoundBorderComponent(Control, pen);
                c.PanelRoundBorder_SetRegion();
                Control.Paint += c.PanelRoundBorder_PaintHandler;
            }
            public static void SetMainPanelForm(Procedure procedure, CryptoAlgorythm algorythm, bool chat)
            {
                if(chat==true)
                {
                    Data.MainPanelForm = new ChatCryptForm();
                    return;
                }
                if(algorythm == CryptoAlgorythm.Symmetric)
                {
                    Data.MainPanelForm = new SymmetricCryptForm(procedure);
                    return;
                }
                if (procedure == Procedure.Encrypt)
                    Data.MainPanelForm = new AsymmetricEncryptForm();
                else
                    Data.MainPanelForm = new AsymmetricDecryptForm();
            }
        }


        public static class Symmetric
        {
            public static SymmetricAlgorithm Algorythm { get; set; }
            public static byte[] KeyTransform(byte[] key)
            {
                SHA256 sha;
                using (sha = SHA256.Create())
                    return sha.ComputeHash(key);
            }
            public static byte[] PerformProcedure(Procedure p, byte[]input, byte[] key = null, bool keytransform = true)
            {
                byte[] output = null;
                try
                {
                    if (key != null) 
                    {
                        if (keytransform)
                            key = KeyTransform(key);
                        Algorythm.Key = key;
                    }
                    ICryptoTransform transform = (p == Procedure.Encrypt ? Algorythm.CreateEncryptor() : Algorythm.CreateDecryptor());
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, transform, CryptoStreamMode.Write))
                            cs.Write(input, 0, input.Length);
                        output = ms.ToArray();
                    }
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return output;
            }
        }
        public static class Asymmetric
        {
            public static RSACng rsa;
            public static CngKey cngKey;
            public static int keySize;
            public static RSAEncryptionPadding rsaEncryptionPadding;
            public static byte[] Decrypt(byte[] input, string keyContainerName)
            {
                byte[] output = null;
                try
                {
                    if (!CngKey.Exists(keyContainerName))
                        throw new CryptographicException($"The Key Service Provider does not contain a key with the name '{keyContainerName}'");

                    cngKey = CngKey.Open(keyContainerName);
                    rsa = new RSACng(cngKey) { KeySize = keySize };

                    if(input != null)
                        output = rsa.Decrypt(input, rsaEncryptionPadding);
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return output;
            }
            public static byte[] Encrypt(byte[] input, string publicKeyContainerName, bool setCngKey = true)
            {
                byte[] output = null;
                try
                {
                    if (setCngKey)
                    {
                        if (!CngKey.Exists(publicKeyContainerName))
                            throw new CryptographicException($"The Key Service Provider does not contain a key with the name: '{publicKeyContainerName}'");

                        cngKey = CngKey.Open(publicKeyContainerName);
                    }
                    rsa = new RSACng(cngKey) { KeySize = keySize };

                    if (input != null) 
                        output = rsa.Encrypt(input, rsaEncryptionPadding);
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return output;
            }
            public static byte[] Encrypt(byte[] input, byte[] key)
            {
                byte[] output = null;
                try
                {
                    cngKey = CngKey.Import(key, CngKeyBlobFormat.GenericPublicBlob);
                    output = Encrypt(input, "", false);
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return output;
            }
            public static byte[] GetPublicKeyBlob(string keyContainerName)
            {
                try 
                {
                    if (!CngKey.Exists(keyContainerName))
                        throw new CryptographicException($"The Key Service Provider does not contain a key with the name: '{keyContainerName}'");
                    cngKey = CngKey.Open(keyContainerName);
                    rsa = new RSACng(cngKey) { KeySize = keySize };
                    return rsa.Key.Export(CngKeyBlobFormat.GenericPublicBlob);
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return null;
                }
            }
        }
        public static class Chat
        {
            public static ECDiffieHellmanCng Algorythm { get; set; }
            public static void Connect()
            {

            }
        }
        public static class Signature
        {
            public static byte[] Sign(byte[] input, string keyContainerName)
            {
                return null;
            }
        }

        public static class Data
        {
            public static PanelForm MainPanelForm { get; set; }
        }
    }
}

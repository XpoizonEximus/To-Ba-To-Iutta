using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.IO;
using System.Linq;
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

        public static class Data
        {
            public static PanelForm MainPanelForm { get; set; }
            public static Procedure Procedure { get; set; }
            public static CryptoAlgorythm Algorythm { get; set; }
            public static bool Chat { get; set; }

            public static class Input
            {
                public static string SymmetricEncrypt { get; set; }
                public static string SymmetricDecrypt { get; set; }
                public static string AsymmetricEncrypt { get; set; }
                public static string AsymmetricDecrypt { get; set; }
            }
        }

        public static class Actions
        {
            public static class Settings
            {
                private static Properties.Settings settings = Properties.Settings.Default;
                // Load
                public static void LoadSettings()
                {
                    try
                    {
                        LoadForm();
                        LoadInput();
                        LoadAlgorythm();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "Settings Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        settings.Reset();
                    }
                }
                public static void LoadForm()
                {
                    Data.Procedure = settings.LastEncrypt ? Procedure.Encrypt : Procedure.Decrypt;
                    Data.Algorythm = settings.LastSymmetric ? CryptoAlgorythm.Symmetric : CryptoAlgorythm.Asymmetric;
                    Data.Chat = settings.LastChat;
                    SetMainPanelForm(Data.Procedure, Data.Algorythm, Data.Chat);
                }
                public static void LoadInput()
                {
                    Data.Input.SymmetricEncrypt = settings.LastSymmetricEncryptInput;
                    Data.Input.SymmetricDecrypt = settings.LastSymmetricDecryptInput;
                    Data.Input.AsymmetricEncrypt = settings.LastAsymmetricEncryptInput;
                    Data.Input.AsymmetricDecrypt = settings.LastAsymmetricDecryptInput;
                }
                public static void LoadAlgorythm()
                {
                    LoadSymmetricAlgorythm();
                    LoadSymmetricIV();
                    LoadSymmetricPadding();
                    LoadSymmetricMode();
                }
                public static void LoadSymmetricAlgorythm()
                {
                    switch (settings.SymmetricAlgorythm)
                    {
                        case "AES": { Symmetric.Algorythm = Aes.Create(); break; }
                        case "DES3": { Symmetric.Algorythm = TripleDES.Create(); break; }
                        case "RC2": { Symmetric.Algorythm = RC2.Create(); break; }
                        case "DES": { Symmetric.Algorythm = DES.Create(); break; }
                        default: { throw new Exception("Symmetric Algorythm Settings error. Resetting all settings."); }
                    }
                }
                public static void LoadSymmetricIV()
                {
                    if (!String.IsNullOrWhiteSpace(settings.SymmetricIV))
                    {
                        byte[] IV = Convert.FromBase64String(settings.SymmetricIV);
                        if (Symmetric.Algorythm.BlockSize != IV.Length * 8)
                        {
                            MessageBox.Show($"The size of the initialization vector must be {Symmetric.Algorythm.BlockSize} bits for the algorythm you selected.", "IV size error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            Symmetric.DeriveIVFromKey = true;
                        }
                        else
                        {
                            Symmetric.DeriveIVFromKey = false;
                            Symmetric.Algorythm.IV = IV;
                        }
                    }
                    else
                        Symmetric.DeriveIVFromKey = true;
                }
                public static void LoadSymmetricPadding()
                {
                    switch (settings.SymmetricPadding)
                    {
                        case "PKCS7": { Symmetric.Algorythm.Padding = PaddingMode.PKCS7; break; }
                        case "ANSIX923": { Symmetric.Algorythm.Padding = PaddingMode.ANSIX923; break; }
                        case "ISO10126": { Symmetric.Algorythm.Padding = PaddingMode.ISO10126; break; }
                        case "Zeros": { Symmetric.Algorythm.Padding = PaddingMode.Zeros; break; }
                        case "None": { Symmetric.Algorythm.Padding = PaddingMode.None; break; }
                        default: { throw new Exception("Symmetric Algorythm Padding Settings error. Resetting all settings."); }
                    }
                }
                public static void LoadSymmetricMode()
                {
                    switch (settings.SymmetricMode)
                    {
                        case "CBC": { Symmetric.Algorythm.Mode = CipherMode.CBC; break; }
                        case "ECB": { Symmetric.Algorythm.Mode = CipherMode.ECB; break; }
                        case "CFB": { Symmetric.Algorythm.Mode = CipherMode.CFB; break; }
                        case "CTS": { Symmetric.Algorythm.Mode = CipherMode.CTS; break; }
                        case "OFB": { Symmetric.Algorythm.Mode = CipherMode.OFB; break; }
                        default: { throw new Exception("Symmetric Mode Settings error. Resetting all settings."); }
                    }
                }
                // Save
                public static void Save()
                {
                    try
                    {
                        SaveForm();
                        SaveInput();
                        settings.Save();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "Settings Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        settings.Reset();
                    }
                }
                public static void SaveForm()
                {
                    settings.LastEncrypt = Data.Procedure == Procedure.Encrypt ? true : false;
                    settings.LastSymmetric = Data.Algorythm == CryptoAlgorythm.Symmetric ? true : false;
                    settings.LastChat = Data.Chat;
                    SetMainPanelForm(Data.Procedure, Data.Algorythm, Data.Chat);
                }
                public static void SaveInput()
                {
                    settings.LastSymmetricEncryptInput = Data.Input.SymmetricEncrypt;
                    settings.LastSymmetricDecryptInput = Data.Input.SymmetricDecrypt;
                    settings.LastAsymmetricEncryptInput = Data.Input.AsymmetricEncrypt;
                    settings.LastAsymmetricDecryptInput = Data.Input.AsymmetricDecrypt;
                }
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

        #region Algorythms
        public static class Symmetric
        {
            public static SymmetricAlgorithm Algorythm { get; set; }
            public static bool DeriveIVFromKey { get; set; }
            private static byte[] KeyTransform(byte[] key)
            {
                SHA256 sha;
                byte[] result;
                using (sha = SHA256.Create())
                    result = sha.ComputeHash(key);

                int keysizebytes = Algorythm.KeySize / 8;
                byte[] croppedResult = new byte[keysizebytes];
                Array.Copy(result, 0, croppedResult, 0, keysizebytes);
                return croppedResult;
            }
            private static byte[] HeaderBytes
            {
                get
                {

                    BitArray bits = new BitArray(8);

                    switch (Properties.Settings.Default.SymmetricAlgorythm)
                    {
                        case "AES": { bits[0] = false; bits[1] = false; break; }
                        case "DES3": { bits[0] = false; bits[1] = true; break; }
                        case "RC2": { bits[0] = true; bits[1] = false; break; }
                        case "DES": { bits[0] = true; bits[1] = true; break; }
                        default: { throw new Exception("Symmetric Algorythm Settings error."); }
                    }
                    switch (Properties.Settings.Default.SymmetricPadding)
                    {
                        case "PKCS7": { bits[2] = false; bits[3] = false; bits[4] = false; break; }
                        case "ANSIX923": { bits[2] = false; bits[3] = false; bits[4] = true; break; }
                        case "ISO10126": { bits[2] = false; bits[3] = true; bits[4] = false; break; }
                        case "Zeros": { bits[2] = false; bits[3] = true; bits[4] = true; break; }
                        case "None": { bits[2] = true; bits[3] = false; bits[4] = false; break; }
                        default: { throw new Exception("Symmetric Algorythm Padding Settings error."); }
                    }
                    switch (Properties.Settings.Default.SymmetricMode)
                    {
                        case "CBC": { bits[5] = false; bits[6] = false; bits[7] = false; break; }
                        case "ECB": { bits[5] = false; bits[6] = false; bits[7] = true; break; }
                        case "CFB": { bits[5] = false; bits[6] = true; bits[7] = false; break; }
                        case "CTS": { bits[5] = false; bits[6] = true; bits[7] = true; break; }
                        case "OFB": { bits[5] = true; bits[6] = false; bits[7] = false; break; }
                        default: { throw new Exception("Symmetric Mode Settings error."); }
                    }

                    byte[] bytes = new byte[1];
                    bits.CopyTo(bytes, 0);
                    return bytes;
                }
                set
                {
                    BitArray bits = new BitArray(value);
                    int[] ints = new int[]
                    {
                       bits[0] ? 1 : 0,
                       bits[1] ? 1 : 0,
                       bits[2] ? 1 : 0,
                       bits[3] ? 1 : 0,
                       bits[4] ? 1 : 0,
                       bits[5] ? 1 : 0,
                       bits[6] ? 1 : 0,
                       bits[7] ? 1 : 0
                    };
                    switch (ints[0] * 2 + ints[1])
                    {
                        case 0: { Algorythm = Aes.Create(); break; }
                        case 1: { Algorythm = TripleDES.Create(); break; }
                        case 2: { Algorythm = RC2.Create(); break; }
                        case 3: { Algorythm = DES.Create(); break; }
                    }
                    switch (ints[2] * 4 + ints[3] * 2 + ints[4])
                    {
                        case 0: { Algorythm.Padding = PaddingMode.PKCS7; break; }
                        case 1: { Algorythm.Padding = PaddingMode.ANSIX923; break; }
                        case 2: { Algorythm.Padding = PaddingMode.ISO10126; break; }
                        case 3: { Algorythm.Padding = PaddingMode.Zeros; break; }
                        case 4: { Algorythm.Padding = PaddingMode.None; break; }
                        default: { throw new Exception("Wrong input."); }
                    }
                    switch (ints[5] * 4 + ints[6] * 2 + ints[7])
                    {
                        case 0: { Algorythm.Mode = CipherMode.CBC; break; }
                        case 1: { Algorythm.Mode = CipherMode.ECB; break; }
                        case 2: { Algorythm.Mode = CipherMode.CFB; break; }
                        case 3: { Algorythm.Mode = CipherMode.CTS; break; }
                        case 4: { Algorythm.Mode = CipherMode.OFB; break; }
                        default: { throw new Exception("Wrong input."); }
                    }
                }
            }
            public static byte[] Encrypt(byte[] input, byte[] key = null, bool keytransform = true)
            {
                if (Algorythm == null) Actions.Settings.LoadAlgorythm();
                byte[] output = null;
                byte[] encryptedinput = null;
                try
                {
                    if (key != null) 
                    {
                        if (keytransform)
                            key = KeyTransform(key);
                        Algorythm.Key = key;
                    }
                    if (DeriveIVFromKey)
                        Array.Copy(Algorythm.Key, 0, Algorythm.IV, 0, Algorythm.BlockSize / 8);

                    byte[] header = HeaderBytes;
                    byte[] iv = Algorythm.IV;
                    byte[] lenIV = BitConverter.GetBytes(iv.Length);

                    ICryptoTransform transform = Algorythm.CreateEncryptor();
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, transform, CryptoStreamMode.Write))
                        { 
                            cs.Write(input, 0, input.Length); 
                        }
                        encryptedinput = ms.ToArray();
                    }

                    output = new byte[header.Length + lenIV.Length + iv.Length + encryptedinput.Length];
                    header.         CopyTo(output, 0);
                    lenIV.          CopyTo(output, header.Length);
                    iv.             CopyTo(output, header.Length + lenIV.Length);
                    encryptedinput. CopyTo(output, header.Length + lenIV.Length + iv.Length);
                }
                catch (System.Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return output;
            }
            public static byte[] Decrypt(byte[] input, byte[] key = null, bool keytransform = true)
            {
                byte[] output = null;
                byte[] encryptedinput = null;
                try
                {
                    byte[] header = new byte[1];
                    Array.Copy(input, 0, header, 0, 1);
                    
                    byte[] lenIV = new byte[4];
                    Array.Copy(input, 1, lenIV, 0, 4);

                    byte[] iv = new byte[BitConverter.ToInt32(lenIV, 0)];
                    Array.Copy(input, 5, iv, 0, iv.Length);

                    encryptedinput = new byte[input.Length - (5 + iv.Length)];
                    Array.Copy(input, 5 + iv.Length, encryptedinput, 0, encryptedinput.Length);

                    HeaderBytes = header;
                    Algorythm.IV = iv;


                    
                    if (key != null)
                    {
                        if (keytransform)
                            key = KeyTransform(key);
                        Algorythm.Key = key;
                    }

                    ICryptoTransform transform = Algorythm.CreateDecryptor();
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, transform, CryptoStreamMode.Write))
                        {
                            cs.Write(encryptedinput, 0, encryptedinput.Length);
                        }
                        output = ms.ToArray();
                    }

                    Actions.Settings.LoadAlgorythm();
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
            public const int keySize = 4096;
            public const bool fOAEP = true;

            public static RSACryptoServiceProvider rsa;
            public static CspParameters param;
            public static bool VerifyKeyContainerExistence(string keyContainerName)
            {
                CspParameters cspParams = new CspParameters
                {
                    Flags = CspProviderFlags.UseExistingKey,
                    KeyContainerName = keyContainerName
                };
                try
                {
                    using (var provider = new RSACryptoServiceProvider(cspParams)) { }
                }
                catch
                {
                    return false;
                }
                return true;
            }
            public static void CreateNewKeyContainer(string keyContainerName, bool isImported = false, byte[] key = null)
            {
                try
                {
                    if (VerifyKeyContainerExistence(keyContainerName))
                        throw new Exception("Key set already exists in CSP.");
                    param = new CspParameters {KeyContainerName = keyContainerName };
                    rsa = new RSACryptoServiceProvider(param);
                    if (isImported)
                    {
                        if (key == null)
                            throw new ArgumentNullException();
                        string xml = Encoding.UTF8.GetString(key);
                        rsa.FromXmlString(xml);
                    }
                    rsa.PersistKeyInCsp = true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            public static void DeleteKey(string keyContainerName)
            {
                try
                {
                    if (!VerifyKeyContainerExistence(keyContainerName))
                        throw new Exception("This Key does not exist in CSP.");
                    CspParameters cspParams = new CspParameters
                    {
                        Flags = CspProviderFlags.UseExistingKey,
                        KeyContainerName = keyContainerName
                    };
                    using (var provider = new RSACryptoServiceProvider(cspParams)) 
                    {
                        provider.PersistKeyInCsp = false;
                    }
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            public static byte[] Decrypt(byte[] input, string privateKeyContainerName)
            {
                try
                {
                    if (privateKeyContainerName == null) return null;
                    if (!VerifyKeyContainerExistence(privateKeyContainerName))
                        throw new Exception("This Key does not exist in CSP. Check Key Manager to see which are your saved keys.");
                    param = new CspParameters() { KeyContainerName = privateKeyContainerName, Flags = CspProviderFlags.UseExistingKey };
                    rsa = new RSACryptoServiceProvider(keySize, param);
                    if(rsa.PublicOnly)
                        throw new Exception("This Key is public. Choose a private key for decryption. Check Key Manager to see which are your saved keys.");

                    byte[] lenk = new byte[4];

                    byte[] encryptedKey = null;

                    byte[] encryptedOutput = null;

                    using(MemoryStream ms = new MemoryStream())
                    {
                        ms.Write(input, 0, input.Length);
                        ms.Flush();
                        ms.Position = 0;

                        ms.Read(lenk, 0, 4);

                        int lk = BitConverter.ToInt32(lenk, 0);

                        encryptedKey = new byte[lk];
                        encryptedOutput = new byte[input.Length - (4 + lk)];

                        ms.Read(encryptedKey, 0, lk);

                        ms.Read(encryptedOutput, 0, input.Length - (4 + lk));
                    }

                    byte[] key = rsa.Decrypt(encryptedKey, fOAEP);
                    byte[] output = Symmetric.Decrypt(encryptedOutput, key, false);

                    return output;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return null;
            }
            public static byte[] Encrypt(byte[] input, string publicKeyContainerName, bool setAlgorythm = true)
            {
                try
                {
                    if (publicKeyContainerName == null && setAlgorythm) return null;
                    if (!VerifyKeyContainerExistence(publicKeyContainerName))
                        throw new Exception("This Key does not exist in CSP. Check Key Manager to see which are your saved keys.");
                    Actions.Settings.LoadAlgorythm();
                    byte[] encryptedInput = Symmetric.Encrypt(input);

                    if (setAlgorythm)
                    {
                        param = new CspParameters() { KeyContainerName = publicKeyContainerName, Flags = CspProviderFlags.UseExistingKey };
                        rsa = new RSACryptoServiceProvider(keySize, param);
                    }
                    byte[] key = Symmetric.Algorythm.Key;
                    byte[] encryptedKey = rsa.Encrypt(key, fOAEP); Clipboard.SetText(Convert.ToBase64String(encryptedKey));

                    byte[] lenk = BitConverter.GetBytes(encryptedKey.Length);

                    List<byte> list = new List<byte>();
                    list.AddRange(lenk);
                    list.AddRange(encryptedKey);
                    list.AddRange(encryptedInput);

                    byte[] output = list.ToArray();
                    return output;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return null;
            }
            public static byte[] Encrypt(byte[] input, byte[] key)
            {
                string xml = Encoding.UTF8.GetString(key);
                param = new CspParameters { Flags = CspProviderFlags.CreateEphemeralKey };
                rsa = new RSACryptoServiceProvider(param);
                rsa.FromXmlString(xml);
                rsa.PersistKeyInCsp = false;
                return Encrypt(input, null, false);
            }
            public static byte[] GetKeyXmlBlob(string keyContainerName, bool includePrivate = false)
            {
                try
                {
                    if (!VerifyKeyContainerExistence(keyContainerName))
                        throw new Exception("This Key does not exist in CSP. Check Key Manager to see which are your saved keys.");
                    param = new CspParameters { KeyContainerName = keyContainerName, Flags = CspProviderFlags.UseExistingKey };
                    rsa = new RSACryptoServiceProvider(keySize, param);
                    string xml = rsa.ToXmlString(includePrivate);
                    return Encoding.UTF8.GetBytes(xml);
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return null;
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
        #endregion
    }
}

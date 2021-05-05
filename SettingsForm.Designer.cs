
namespace To_Ba_To_Iutta
{
    partial class SettingsForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SettingsForm));
            this.cancelButton = new System.Windows.Forms.Button();
            this.saveButton = new System.Windows.Forms.Button();
            this.tabControl = new System.Windows.Forms.TabControl();
            this.symmetricPage = new System.Windows.Forms.TabPage();
            this.symmetricModeGroupBox = new System.Windows.Forms.GroupBox();
            this.OFBRadioButton = new System.Windows.Forms.RadioButton();
            this.CTSRadioButton = new System.Windows.Forms.RadioButton();
            this.CFBRadioButton = new System.Windows.Forms.RadioButton();
            this.ECBRadioButton = new System.Windows.Forms.RadioButton();
            this.CBCRadioButton = new System.Windows.Forms.RadioButton();
            this.symmetricPaddingGroupBox = new System.Windows.Forms.GroupBox();
            this.symmetricNoneRadioButton = new System.Windows.Forms.RadioButton();
            this.symmetricZerosRadioButton = new System.Windows.Forms.RadioButton();
            this.symmetricISO10126RadioButton = new System.Windows.Forms.RadioButton();
            this.symmetricANSIX923RadioButton = new System.Windows.Forms.RadioButton();
            this.symmetricPKCS7RadioButton = new System.Windows.Forms.RadioButton();
            this.symmetricIVGroupBox = new System.Windows.Forms.GroupBox();
            this.customIVTextBox = new System.Windows.Forms.TextBox();
            this.customIVRadioButton = new System.Windows.Forms.RadioButton();
            this.deriveIVRadioButton = new System.Windows.Forms.RadioButton();
            this.symmetricAlgorythmGroupBox = new System.Windows.Forms.GroupBox();
            this.DESRadioButton = new System.Windows.Forms.RadioButton();
            this.RC2RadioButton = new System.Windows.Forms.RadioButton();
            this.DES3RadioButton = new System.Windows.Forms.RadioButton();
            this.AESRadioButton = new System.Windows.Forms.RadioButton();
            this.asymmetricPage = new System.Windows.Forms.TabPage();
            this.asymmetricPaddingGroupBox = new System.Windows.Forms.GroupBox();
            this.asymmetricSHA1RadioButton = new System.Windows.Forms.RadioButton();
            this.asymmetricSHA512RadioButton = new System.Windows.Forms.RadioButton();
            this.asymmetricSHA384RadioButton = new System.Windows.Forms.RadioButton();
            this.asymmetricSHA256RadioButton = new System.Windows.Forms.RadioButton();
            this.asymmetricPKCS1RadioButton = new System.Windows.Forms.RadioButton();
            this.keySizeGroupBox = new System.Windows.Forms.GroupBox();
            this.keySizeLabel = new System.Windows.Forms.Label();
            this.keySizeNumericUpDown = new System.Windows.Forms.NumericUpDown();
            this.asymmetricKeysGroupBox = new System.Windows.Forms.GroupBox();
            this.publicKeysGroupBox = new System.Windows.Forms.GroupBox();
            this.publicKeysListView = new System.Windows.Forms.ListView();
            this.publicListName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.deletePublicButton = new System.Windows.Forms.Button();
            this.newPublicKeyButton = new System.Windows.Forms.Button();
            this.privateKeysGroupBox = new System.Windows.Forms.GroupBox();
            this.deletePrivateKeyButton = new System.Windows.Forms.Button();
            this.privateKeysListView = new System.Windows.Forms.ListView();
            this.privateListName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.newPrivateKeyButton = new System.Windows.Forms.Button();
            this.asymmetricAlgorythmGroupBox = new System.Windows.Forms.GroupBox();
            this.RSAradioButton = new System.Windows.Forms.RadioButton();
            this.defaultsButton = new System.Windows.Forms.Button();
            this.customIVToolTip = new System.Windows.Forms.ToolTip(this.components);
            this.tabControl.SuspendLayout();
            this.symmetricPage.SuspendLayout();
            this.symmetricModeGroupBox.SuspendLayout();
            this.symmetricPaddingGroupBox.SuspendLayout();
            this.symmetricIVGroupBox.SuspendLayout();
            this.symmetricAlgorythmGroupBox.SuspendLayout();
            this.asymmetricPage.SuspendLayout();
            this.asymmetricPaddingGroupBox.SuspendLayout();
            this.keySizeGroupBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.keySizeNumericUpDown)).BeginInit();
            this.asymmetricKeysGroupBox.SuspendLayout();
            this.publicKeysGroupBox.SuspendLayout();
            this.privateKeysGroupBox.SuspendLayout();
            this.asymmetricAlgorythmGroupBox.SuspendLayout();
            this.SuspendLayout();
            // 
            // cancelButton
            // 
            this.cancelButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.cancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.cancelButton.Location = new System.Drawing.Point(595, 609);
            this.cancelButton.Margin = new System.Windows.Forms.Padding(4);
            this.cancelButton.Name = "cancelButton";
            this.cancelButton.Size = new System.Drawing.Size(112, 30);
            this.cancelButton.TabIndex = 0;
            this.cancelButton.Text = "Cancel";
            this.cancelButton.UseVisualStyleBackColor = true;
            this.cancelButton.Click += new System.EventHandler(this.cancelButton_Click);
            // 
            // saveButton
            // 
            this.saveButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.saveButton.Location = new System.Drawing.Point(475, 609);
            this.saveButton.Margin = new System.Windows.Forms.Padding(4);
            this.saveButton.Name = "saveButton";
            this.saveButton.Size = new System.Drawing.Size(112, 30);
            this.saveButton.TabIndex = 2;
            this.saveButton.Text = "Save";
            this.saveButton.UseVisualStyleBackColor = true;
            this.saveButton.Click += new System.EventHandler(this.saveButton_Click);
            // 
            // tabControl
            // 
            this.tabControl.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tabControl.Controls.Add(this.symmetricPage);
            this.tabControl.Controls.Add(this.asymmetricPage);
            this.tabControl.Location = new System.Drawing.Point(12, 12);
            this.tabControl.Name = "tabControl";
            this.tabControl.SelectedIndex = 0;
            this.tabControl.Size = new System.Drawing.Size(696, 590);
            this.tabControl.TabIndex = 3;
            // 
            // symmetricPage
            // 
            this.symmetricPage.AutoScroll = true;
            this.symmetricPage.Controls.Add(this.symmetricModeGroupBox);
            this.symmetricPage.Controls.Add(this.symmetricPaddingGroupBox);
            this.symmetricPage.Controls.Add(this.symmetricIVGroupBox);
            this.symmetricPage.Controls.Add(this.symmetricAlgorythmGroupBox);
            this.symmetricPage.Location = new System.Drawing.Point(4, 26);
            this.symmetricPage.Name = "symmetricPage";
            this.symmetricPage.Padding = new System.Windows.Forms.Padding(3);
            this.symmetricPage.Size = new System.Drawing.Size(688, 560);
            this.symmetricPage.TabIndex = 0;
            this.symmetricPage.Text = "Symmetric";
            this.symmetricPage.UseVisualStyleBackColor = true;
            // 
            // symmetricModeGroupBox
            // 
            this.symmetricModeGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.symmetricModeGroupBox.Controls.Add(this.OFBRadioButton);
            this.symmetricModeGroupBox.Controls.Add(this.CTSRadioButton);
            this.symmetricModeGroupBox.Controls.Add(this.CFBRadioButton);
            this.symmetricModeGroupBox.Controls.Add(this.ECBRadioButton);
            this.symmetricModeGroupBox.Controls.Add(this.CBCRadioButton);
            this.symmetricModeGroupBox.Location = new System.Drawing.Point(6, 396);
            this.symmetricModeGroupBox.Name = "symmetricModeGroupBox";
            this.symmetricModeGroupBox.Size = new System.Drawing.Size(676, 159);
            this.symmetricModeGroupBox.TabIndex = 5;
            this.symmetricModeGroupBox.TabStop = false;
            this.symmetricModeGroupBox.Text = "Mode of operation";
            // 
            // OFBRadioButton
            // 
            this.OFBRadioButton.AutoSize = true;
            this.OFBRadioButton.Location = new System.Drawing.Point(6, 132);
            this.OFBRadioButton.Name = "OFBRadioButton";
            this.OFBRadioButton.Size = new System.Drawing.Size(57, 21);
            this.OFBRadioButton.TabIndex = 4;
            this.OFBRadioButton.TabStop = true;
            this.OFBRadioButton.Text = "OFB";
            this.OFBRadioButton.UseVisualStyleBackColor = true;
            // 
            // CTSRadioButton
            // 
            this.CTSRadioButton.AutoSize = true;
            this.CTSRadioButton.Location = new System.Drawing.Point(6, 105);
            this.CTSRadioButton.Name = "CTSRadioButton";
            this.CTSRadioButton.Size = new System.Drawing.Size(56, 21);
            this.CTSRadioButton.TabIndex = 3;
            this.CTSRadioButton.TabStop = true;
            this.CTSRadioButton.Text = "CTS";
            this.CTSRadioButton.UseVisualStyleBackColor = true;
            // 
            // CFBRadioButton
            // 
            this.CFBRadioButton.AutoSize = true;
            this.CFBRadioButton.Location = new System.Drawing.Point(6, 78);
            this.CFBRadioButton.Name = "CFBRadioButton";
            this.CFBRadioButton.Size = new System.Drawing.Size(56, 21);
            this.CFBRadioButton.TabIndex = 2;
            this.CFBRadioButton.TabStop = true;
            this.CFBRadioButton.Text = "CFB";
            this.CFBRadioButton.UseVisualStyleBackColor = true;
            // 
            // ECBRadioButton
            // 
            this.ECBRadioButton.AutoSize = true;
            this.ECBRadioButton.Location = new System.Drawing.Point(6, 51);
            this.ECBRadioButton.Name = "ECBRadioButton";
            this.ECBRadioButton.Size = new System.Drawing.Size(57, 21);
            this.ECBRadioButton.TabIndex = 1;
            this.ECBRadioButton.TabStop = true;
            this.ECBRadioButton.Text = "ECB";
            this.ECBRadioButton.UseVisualStyleBackColor = true;
            // 
            // CBCRadioButton
            // 
            this.CBCRadioButton.AutoSize = true;
            this.CBCRadioButton.Location = new System.Drawing.Point(6, 24);
            this.CBCRadioButton.Name = "CBCRadioButton";
            this.CBCRadioButton.Size = new System.Drawing.Size(58, 21);
            this.CBCRadioButton.TabIndex = 0;
            this.CBCRadioButton.TabStop = true;
            this.CBCRadioButton.Text = "CBC";
            this.CBCRadioButton.UseVisualStyleBackColor = true;
            // 
            // symmetricPaddingGroupBox
            // 
            this.symmetricPaddingGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.symmetricPaddingGroupBox.Controls.Add(this.symmetricNoneRadioButton);
            this.symmetricPaddingGroupBox.Controls.Add(this.symmetricZerosRadioButton);
            this.symmetricPaddingGroupBox.Controls.Add(this.symmetricISO10126RadioButton);
            this.symmetricPaddingGroupBox.Controls.Add(this.symmetricANSIX923RadioButton);
            this.symmetricPaddingGroupBox.Controls.Add(this.symmetricPKCS7RadioButton);
            this.symmetricPaddingGroupBox.Location = new System.Drawing.Point(6, 231);
            this.symmetricPaddingGroupBox.Name = "symmetricPaddingGroupBox";
            this.symmetricPaddingGroupBox.Size = new System.Drawing.Size(676, 159);
            this.symmetricPaddingGroupBox.TabIndex = 4;
            this.symmetricPaddingGroupBox.TabStop = false;
            this.symmetricPaddingGroupBox.Text = "Padding";
            // 
            // symmetricNoneRadioButton
            // 
            this.symmetricNoneRadioButton.AutoSize = true;
            this.symmetricNoneRadioButton.Location = new System.Drawing.Point(6, 132);
            this.symmetricNoneRadioButton.Name = "symmetricNoneRadioButton";
            this.symmetricNoneRadioButton.Size = new System.Drawing.Size(181, 21);
            this.symmetricNoneRadioButton.TabIndex = 4;
            this.symmetricNoneRadioButton.TabStop = true;
            this.symmetricNoneRadioButton.Text = "None (not recomended)";
            this.symmetricNoneRadioButton.UseVisualStyleBackColor = true;
            // 
            // symmetricZerosRadioButton
            // 
            this.symmetricZerosRadioButton.AutoSize = true;
            this.symmetricZerosRadioButton.Location = new System.Drawing.Point(6, 105);
            this.symmetricZerosRadioButton.Name = "symmetricZerosRadioButton";
            this.symmetricZerosRadioButton.Size = new System.Drawing.Size(64, 21);
            this.symmetricZerosRadioButton.TabIndex = 3;
            this.symmetricZerosRadioButton.TabStop = true;
            this.symmetricZerosRadioButton.Text = "Zeros";
            this.symmetricZerosRadioButton.UseVisualStyleBackColor = true;
            // 
            // symmetricISO10126RadioButton
            // 
            this.symmetricISO10126RadioButton.AutoSize = true;
            this.symmetricISO10126RadioButton.Location = new System.Drawing.Point(6, 78);
            this.symmetricISO10126RadioButton.Name = "symmetricISO10126RadioButton";
            this.symmetricISO10126RadioButton.Size = new System.Drawing.Size(96, 21);
            this.symmetricISO10126RadioButton.TabIndex = 2;
            this.symmetricISO10126RadioButton.TabStop = true;
            this.symmetricISO10126RadioButton.Text = "ISO 10126";
            this.symmetricISO10126RadioButton.UseVisualStyleBackColor = true;
            // 
            // symmetricANSIX923RadioButton
            // 
            this.symmetricANSIX923RadioButton.AutoSize = true;
            this.symmetricANSIX923RadioButton.Location = new System.Drawing.Point(6, 51);
            this.symmetricANSIX923RadioButton.Name = "symmetricANSIX923RadioButton";
            this.symmetricANSIX923RadioButton.Size = new System.Drawing.Size(103, 21);
            this.symmetricANSIX923RadioButton.TabIndex = 1;
            this.symmetricANSIX923RadioButton.TabStop = true;
            this.symmetricANSIX923RadioButton.Text = "ANSI X.923";
            this.symmetricANSIX923RadioButton.UseVisualStyleBackColor = true;
            // 
            // symmetricPKCS7RadioButton
            // 
            this.symmetricPKCS7RadioButton.AutoSize = true;
            this.symmetricPKCS7RadioButton.Location = new System.Drawing.Point(6, 24);
            this.symmetricPKCS7RadioButton.Name = "symmetricPKCS7RadioButton";
            this.symmetricPKCS7RadioButton.Size = new System.Drawing.Size(75, 21);
            this.symmetricPKCS7RadioButton.TabIndex = 0;
            this.symmetricPKCS7RadioButton.TabStop = true;
            this.symmetricPKCS7RadioButton.Text = "PKCS7";
            this.symmetricPKCS7RadioButton.UseVisualStyleBackColor = true;
            // 
            // symmetricIVGroupBox
            // 
            this.symmetricIVGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.symmetricIVGroupBox.Controls.Add(this.customIVTextBox);
            this.symmetricIVGroupBox.Controls.Add(this.customIVRadioButton);
            this.symmetricIVGroupBox.Controls.Add(this.deriveIVRadioButton);
            this.symmetricIVGroupBox.Location = new System.Drawing.Point(6, 144);
            this.symmetricIVGroupBox.Name = "symmetricIVGroupBox";
            this.symmetricIVGroupBox.Size = new System.Drawing.Size(676, 81);
            this.symmetricIVGroupBox.TabIndex = 4;
            this.symmetricIVGroupBox.TabStop = false;
            this.symmetricIVGroupBox.Text = "Initialization Vector";
            // 
            // customIVTextBox
            // 
            this.customIVTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.customIVTextBox.Enabled = false;
            this.customIVTextBox.Location = new System.Drawing.Point(90, 50);
            this.customIVTextBox.Name = "customIVTextBox";
            this.customIVTextBox.Size = new System.Drawing.Size(580, 25);
            this.customIVTextBox.TabIndex = 2;
            this.customIVToolTip.SetToolTip(this.customIVTextBox, "The byte array representing the Initialization Vector encoded in Base64String.");
            // 
            // customIVRadioButton
            // 
            this.customIVRadioButton.AutoSize = true;
            this.customIVRadioButton.Location = new System.Drawing.Point(6, 51);
            this.customIVRadioButton.Name = "customIVRadioButton";
            this.customIVRadioButton.Size = new System.Drawing.Size(78, 21);
            this.customIVRadioButton.TabIndex = 1;
            this.customIVRadioButton.TabStop = true;
            this.customIVRadioButton.Text = "Custom";
            this.customIVRadioButton.UseVisualStyleBackColor = true;
            this.customIVRadioButton.CheckedChanged += new System.EventHandler(this.customIVRadioButton_CheckedChanged);
            // 
            // deriveIVRadioButton
            // 
            this.deriveIVRadioButton.AutoSize = true;
            this.deriveIVRadioButton.Location = new System.Drawing.Point(6, 24);
            this.deriveIVRadioButton.Name = "deriveIVRadioButton";
            this.deriveIVRadioButton.Size = new System.Drawing.Size(240, 21);
            this.deriveIVRadioButton.TabIndex = 0;
            this.deriveIVRadioButton.TabStop = true;
            this.deriveIVRadioButton.Text = "Derive from key (recommended)";
            this.deriveIVRadioButton.UseVisualStyleBackColor = true;
            // 
            // symmetricAlgorythmGroupBox
            // 
            this.symmetricAlgorythmGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.symmetricAlgorythmGroupBox.Controls.Add(this.DESRadioButton);
            this.symmetricAlgorythmGroupBox.Controls.Add(this.RC2RadioButton);
            this.symmetricAlgorythmGroupBox.Controls.Add(this.DES3RadioButton);
            this.symmetricAlgorythmGroupBox.Controls.Add(this.AESRadioButton);
            this.symmetricAlgorythmGroupBox.Location = new System.Drawing.Point(6, 6);
            this.symmetricAlgorythmGroupBox.Name = "symmetricAlgorythmGroupBox";
            this.symmetricAlgorythmGroupBox.Size = new System.Drawing.Size(676, 132);
            this.symmetricAlgorythmGroupBox.TabIndex = 0;
            this.symmetricAlgorythmGroupBox.TabStop = false;
            this.symmetricAlgorythmGroupBox.Text = "Algorythm";
            // 
            // DESRadioButton
            // 
            this.DESRadioButton.AutoSize = true;
            this.DESRadioButton.Location = new System.Drawing.Point(6, 105);
            this.DESRadioButton.Name = "DESRadioButton";
            this.DESRadioButton.Size = new System.Drawing.Size(190, 21);
            this.DESRadioButton.TabIndex = 3;
            this.DESRadioButton.TabStop = true;
            this.DESRadioButton.Text = "DES (not recommended)";
            this.DESRadioButton.UseVisualStyleBackColor = true;
            // 
            // RC2RadioButton
            // 
            this.RC2RadioButton.AutoSize = true;
            this.RC2RadioButton.Location = new System.Drawing.Point(6, 78);
            this.RC2RadioButton.Name = "RC2RadioButton";
            this.RC2RadioButton.Size = new System.Drawing.Size(194, 21);
            this.RC2RadioButton.TabIndex = 2;
            this.RC2RadioButton.TabStop = true;
            this.RC2RadioButton.Text = "RC-2 (not recommended)";
            this.RC2RadioButton.UseVisualStyleBackColor = true;
            // 
            // DES3RadioButton
            // 
            this.DES3RadioButton.AutoSize = true;
            this.DES3RadioButton.Location = new System.Drawing.Point(6, 51);
            this.DES3RadioButton.Name = "DES3RadioButton";
            this.DES3RadioButton.Size = new System.Drawing.Size(70, 21);
            this.DES3RadioButton.TabIndex = 1;
            this.DES3RadioButton.TabStop = true;
            this.DES3RadioButton.Text = "3-DES";
            this.DES3RadioButton.UseVisualStyleBackColor = true;
            // 
            // AESRadioButton
            // 
            this.AESRadioButton.AutoSize = true;
            this.AESRadioButton.Location = new System.Drawing.Point(6, 24);
            this.AESRadioButton.Name = "AESRadioButton";
            this.AESRadioButton.Size = new System.Drawing.Size(56, 21);
            this.AESRadioButton.TabIndex = 0;
            this.AESRadioButton.TabStop = true;
            this.AESRadioButton.Text = "AES";
            this.AESRadioButton.UseVisualStyleBackColor = true;
            // 
            // asymmetricPage
            // 
            this.asymmetricPage.AutoScroll = true;
            this.asymmetricPage.Controls.Add(this.asymmetricPaddingGroupBox);
            this.asymmetricPage.Controls.Add(this.keySizeGroupBox);
            this.asymmetricPage.Controls.Add(this.asymmetricKeysGroupBox);
            this.asymmetricPage.Controls.Add(this.asymmetricAlgorythmGroupBox);
            this.asymmetricPage.Location = new System.Drawing.Point(4, 26);
            this.asymmetricPage.Name = "asymmetricPage";
            this.asymmetricPage.Padding = new System.Windows.Forms.Padding(3);
            this.asymmetricPage.Size = new System.Drawing.Size(688, 560);
            this.asymmetricPage.TabIndex = 1;
            this.asymmetricPage.Text = "Asymmetric";
            this.asymmetricPage.UseVisualStyleBackColor = true;
            // 
            // asymmetricPaddingGroupBox
            // 
            this.asymmetricPaddingGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.asymmetricPaddingGroupBox.Controls.Add(this.asymmetricSHA1RadioButton);
            this.asymmetricPaddingGroupBox.Controls.Add(this.asymmetricSHA512RadioButton);
            this.asymmetricPaddingGroupBox.Controls.Add(this.asymmetricSHA384RadioButton);
            this.asymmetricPaddingGroupBox.Controls.Add(this.asymmetricSHA256RadioButton);
            this.asymmetricPaddingGroupBox.Controls.Add(this.asymmetricPKCS1RadioButton);
            this.asymmetricPaddingGroupBox.Location = new System.Drawing.Point(6, 124);
            this.asymmetricPaddingGroupBox.Name = "asymmetricPaddingGroupBox";
            this.asymmetricPaddingGroupBox.Size = new System.Drawing.Size(676, 159);
            this.asymmetricPaddingGroupBox.TabIndex = 5;
            this.asymmetricPaddingGroupBox.TabStop = false;
            this.asymmetricPaddingGroupBox.Text = "Padding";
            // 
            // asymmetricSHA1RadioButton
            // 
            this.asymmetricSHA1RadioButton.AutoSize = true;
            this.asymmetricSHA1RadioButton.Location = new System.Drawing.Point(6, 132);
            this.asymmetricSHA1RadioButton.Name = "asymmetricSHA1RadioButton";
            this.asymmetricSHA1RadioButton.Size = new System.Drawing.Size(116, 21);
            this.asymmetricSHA1RadioButton.TabIndex = 4;
            this.asymmetricSHA1RadioButton.TabStop = true;
            this.asymmetricSHA1RadioButton.Text = "OAEP SHA-1";
            this.asymmetricSHA1RadioButton.UseVisualStyleBackColor = true;
            // 
            // asymmetricSHA512RadioButton
            // 
            this.asymmetricSHA512RadioButton.AutoSize = true;
            this.asymmetricSHA512RadioButton.Location = new System.Drawing.Point(6, 105);
            this.asymmetricSHA512RadioButton.Name = "asymmetricSHA512RadioButton";
            this.asymmetricSHA512RadioButton.Size = new System.Drawing.Size(132, 21);
            this.asymmetricSHA512RadioButton.TabIndex = 3;
            this.asymmetricSHA512RadioButton.TabStop = true;
            this.asymmetricSHA512RadioButton.Text = "OAEP SHA-512";
            this.asymmetricSHA512RadioButton.UseVisualStyleBackColor = true;
            // 
            // asymmetricSHA384RadioButton
            // 
            this.asymmetricSHA384RadioButton.AutoSize = true;
            this.asymmetricSHA384RadioButton.Location = new System.Drawing.Point(6, 78);
            this.asymmetricSHA384RadioButton.Name = "asymmetricSHA384RadioButton";
            this.asymmetricSHA384RadioButton.Size = new System.Drawing.Size(132, 21);
            this.asymmetricSHA384RadioButton.TabIndex = 2;
            this.asymmetricSHA384RadioButton.TabStop = true;
            this.asymmetricSHA384RadioButton.Text = "OAEP SHA-384";
            this.asymmetricSHA384RadioButton.UseVisualStyleBackColor = true;
            // 
            // asymmetricSHA256RadioButton
            // 
            this.asymmetricSHA256RadioButton.AutoSize = true;
            this.asymmetricSHA256RadioButton.Location = new System.Drawing.Point(6, 51);
            this.asymmetricSHA256RadioButton.Name = "asymmetricSHA256RadioButton";
            this.asymmetricSHA256RadioButton.Size = new System.Drawing.Size(132, 21);
            this.asymmetricSHA256RadioButton.TabIndex = 1;
            this.asymmetricSHA256RadioButton.TabStop = true;
            this.asymmetricSHA256RadioButton.Text = "OAEP SHA-256";
            this.asymmetricSHA256RadioButton.UseVisualStyleBackColor = true;
            // 
            // asymmetricPKCS1RadioButton
            // 
            this.asymmetricPKCS1RadioButton.AutoSize = true;
            this.asymmetricPKCS1RadioButton.Location = new System.Drawing.Point(6, 24);
            this.asymmetricPKCS1RadioButton.Name = "asymmetricPKCS1RadioButton";
            this.asymmetricPKCS1RadioButton.Size = new System.Drawing.Size(75, 21);
            this.asymmetricPKCS1RadioButton.TabIndex = 0;
            this.asymmetricPKCS1RadioButton.TabStop = true;
            this.asymmetricPKCS1RadioButton.Text = "PKCS1";
            this.asymmetricPKCS1RadioButton.UseVisualStyleBackColor = true;
            // 
            // keySizeGroupBox
            // 
            this.keySizeGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.keySizeGroupBox.Controls.Add(this.keySizeLabel);
            this.keySizeGroupBox.Controls.Add(this.keySizeNumericUpDown);
            this.keySizeGroupBox.Location = new System.Drawing.Point(6, 63);
            this.keySizeGroupBox.Name = "keySizeGroupBox";
            this.keySizeGroupBox.Size = new System.Drawing.Size(676, 55);
            this.keySizeGroupBox.TabIndex = 2;
            this.keySizeGroupBox.TabStop = false;
            this.keySizeGroupBox.Text = "Key Size";
            // 
            // keySizeLabel
            // 
            this.keySizeLabel.AutoSize = true;
            this.keySizeLabel.Location = new System.Drawing.Point(137, 26);
            this.keySizeLabel.Name = "keySizeLabel";
            this.keySizeLabel.Size = new System.Drawing.Size(53, 17);
            this.keySizeLabel.TabIndex = 1;
            this.keySizeLabel.Text = "× 1024";
            // 
            // keySizeNumericUpDown
            // 
            this.keySizeNumericUpDown.Location = new System.Drawing.Point(6, 24);
            this.keySizeNumericUpDown.Maximum = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.keySizeNumericUpDown.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.keySizeNumericUpDown.Name = "keySizeNumericUpDown";
            this.keySizeNumericUpDown.Size = new System.Drawing.Size(125, 25);
            this.keySizeNumericUpDown.TabIndex = 0;
            this.keySizeNumericUpDown.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            // 
            // asymmetricKeysGroupBox
            // 
            this.asymmetricKeysGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.asymmetricKeysGroupBox.Controls.Add(this.publicKeysGroupBox);
            this.asymmetricKeysGroupBox.Controls.Add(this.privateKeysGroupBox);
            this.asymmetricKeysGroupBox.Location = new System.Drawing.Point(6, 289);
            this.asymmetricKeysGroupBox.Name = "asymmetricKeysGroupBox";
            this.asymmetricKeysGroupBox.Size = new System.Drawing.Size(676, 265);
            this.asymmetricKeysGroupBox.TabIndex = 2;
            this.asymmetricKeysGroupBox.TabStop = false;
            this.asymmetricKeysGroupBox.Text = "Keys";
            // 
            // publicKeysGroupBox
            // 
            this.publicKeysGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.publicKeysGroupBox.Controls.Add(this.publicKeysListView);
            this.publicKeysGroupBox.Controls.Add(this.deletePublicButton);
            this.publicKeysGroupBox.Controls.Add(this.newPublicKeyButton);
            this.publicKeysGroupBox.Location = new System.Drawing.Point(341, 24);
            this.publicKeysGroupBox.Name = "publicKeysGroupBox";
            this.publicKeysGroupBox.Size = new System.Drawing.Size(329, 235);
            this.publicKeysGroupBox.TabIndex = 6;
            this.publicKeysGroupBox.TabStop = false;
            this.publicKeysGroupBox.Text = "Public";
            // 
            // publicKeysListView
            // 
            this.publicKeysListView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.publicKeysListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.publicListName});
            this.publicKeysListView.HideSelection = false;
            this.publicKeysListView.Location = new System.Drawing.Point(8, 24);
            this.publicKeysListView.Name = "publicKeysListView";
            this.publicKeysListView.Size = new System.Drawing.Size(315, 167);
            this.publicKeysListView.TabIndex = 6;
            this.publicKeysListView.UseCompatibleStateImageBehavior = false;
            this.publicKeysListView.View = System.Windows.Forms.View.Details;
            // 
            // publicListName
            // 
            this.publicListName.Text = "Name";
            this.publicListName.Width = 311;
            // 
            // deletePublicButton
            // 
            this.deletePublicButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.deletePublicButton.Location = new System.Drawing.Point(211, 198);
            this.deletePublicButton.Margin = new System.Windows.Forms.Padding(4);
            this.deletePublicButton.Name = "deletePublicButton";
            this.deletePublicButton.Size = new System.Drawing.Size(112, 30);
            this.deletePublicButton.TabIndex = 5;
            this.deletePublicButton.Text = "Delete";
            this.deletePublicButton.UseVisualStyleBackColor = true;
            // 
            // newPublicKeyButton
            // 
            this.newPublicKeyButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.newPublicKeyButton.Location = new System.Drawing.Point(91, 198);
            this.newPublicKeyButton.Margin = new System.Windows.Forms.Padding(4);
            this.newPublicKeyButton.Name = "newPublicKeyButton";
            this.newPublicKeyButton.Size = new System.Drawing.Size(112, 30);
            this.newPublicKeyButton.TabIndex = 4;
            this.newPublicKeyButton.Text = "New";
            this.newPublicKeyButton.UseVisualStyleBackColor = true;
            // 
            // privateKeysGroupBox
            // 
            this.privateKeysGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.privateKeysGroupBox.Controls.Add(this.deletePrivateKeyButton);
            this.privateKeysGroupBox.Controls.Add(this.privateKeysListView);
            this.privateKeysGroupBox.Controls.Add(this.newPrivateKeyButton);
            this.privateKeysGroupBox.Location = new System.Drawing.Point(6, 24);
            this.privateKeysGroupBox.Name = "privateKeysGroupBox";
            this.privateKeysGroupBox.Size = new System.Drawing.Size(329, 235);
            this.privateKeysGroupBox.TabIndex = 5;
            this.privateKeysGroupBox.TabStop = false;
            this.privateKeysGroupBox.Text = "Private";
            // 
            // deletePrivateKeyButton
            // 
            this.deletePrivateKeyButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.deletePrivateKeyButton.Location = new System.Drawing.Point(126, 198);
            this.deletePrivateKeyButton.Margin = new System.Windows.Forms.Padding(4);
            this.deletePrivateKeyButton.Name = "deletePrivateKeyButton";
            this.deletePrivateKeyButton.Size = new System.Drawing.Size(112, 30);
            this.deletePrivateKeyButton.TabIndex = 5;
            this.deletePrivateKeyButton.Text = "Delete";
            this.deletePrivateKeyButton.UseVisualStyleBackColor = true;
            // 
            // privateKeysListView
            // 
            this.privateKeysListView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.privateKeysListView.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.privateListName});
            this.privateKeysListView.HideSelection = false;
            this.privateKeysListView.Location = new System.Drawing.Point(7, 24);
            this.privateKeysListView.Name = "privateKeysListView";
            this.privateKeysListView.Size = new System.Drawing.Size(315, 167);
            this.privateKeysListView.TabIndex = 0;
            this.privateKeysListView.UseCompatibleStateImageBehavior = false;
            this.privateKeysListView.View = System.Windows.Forms.View.Details;
            // 
            // privateListName
            // 
            this.privateListName.Text = "Name";
            this.privateListName.Width = 311;
            // 
            // newPrivateKeyButton
            // 
            this.newPrivateKeyButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.newPrivateKeyButton.Location = new System.Drawing.Point(6, 198);
            this.newPrivateKeyButton.Margin = new System.Windows.Forms.Padding(4);
            this.newPrivateKeyButton.Name = "newPrivateKeyButton";
            this.newPrivateKeyButton.Size = new System.Drawing.Size(112, 30);
            this.newPrivateKeyButton.TabIndex = 4;
            this.newPrivateKeyButton.Text = "New";
            this.newPrivateKeyButton.UseVisualStyleBackColor = true;
            // 
            // asymmetricAlgorythmGroupBox
            // 
            this.asymmetricAlgorythmGroupBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.asymmetricAlgorythmGroupBox.Controls.Add(this.RSAradioButton);
            this.asymmetricAlgorythmGroupBox.Location = new System.Drawing.Point(6, 6);
            this.asymmetricAlgorythmGroupBox.Name = "asymmetricAlgorythmGroupBox";
            this.asymmetricAlgorythmGroupBox.Size = new System.Drawing.Size(676, 51);
            this.asymmetricAlgorythmGroupBox.TabIndex = 1;
            this.asymmetricAlgorythmGroupBox.TabStop = false;
            this.asymmetricAlgorythmGroupBox.Text = "Algorythm";
            // 
            // RSAradioButton
            // 
            this.RSAradioButton.AutoSize = true;
            this.RSAradioButton.Checked = true;
            this.RSAradioButton.Location = new System.Drawing.Point(6, 24);
            this.RSAradioButton.Name = "RSAradioButton";
            this.RSAradioButton.Size = new System.Drawing.Size(57, 21);
            this.RSAradioButton.TabIndex = 0;
            this.RSAradioButton.TabStop = true;
            this.RSAradioButton.Text = "RSA";
            this.RSAradioButton.UseVisualStyleBackColor = true;
            // 
            // defaultsButton
            // 
            this.defaultsButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.defaultsButton.Location = new System.Drawing.Point(12, 609);
            this.defaultsButton.Margin = new System.Windows.Forms.Padding(4);
            this.defaultsButton.Name = "defaultsButton";
            this.defaultsButton.Size = new System.Drawing.Size(112, 30);
            this.defaultsButton.TabIndex = 4;
            this.defaultsButton.Text = "Defaults";
            this.defaultsButton.UseVisualStyleBackColor = true;
            // 
            // customIVToolTip
            // 
            this.customIVToolTip.AutomaticDelay = 5;
            this.customIVToolTip.AutoPopDelay = 20000;
            this.customIVToolTip.InitialDelay = 5;
            this.customIVToolTip.ReshowDelay = 1;
            // 
            // SettingsForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 17F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.cancelButton;
            this.ClientSize = new System.Drawing.Size(720, 652);
            this.Controls.Add(this.defaultsButton);
            this.Controls.Add(this.tabControl);
            this.Controls.Add(this.saveButton);
            this.Controls.Add(this.cancelButton);
            this.Font = new System.Drawing.Font("Helvetica", 11F);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(567, 600);
            this.Name = "SettingsForm";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Settings";
            this.Load += new System.EventHandler(this.SettingsForm_Load);
            this.Resize += new System.EventHandler(this.SettingsForm_Resize);
            this.tabControl.ResumeLayout(false);
            this.symmetricPage.ResumeLayout(false);
            this.symmetricModeGroupBox.ResumeLayout(false);
            this.symmetricModeGroupBox.PerformLayout();
            this.symmetricPaddingGroupBox.ResumeLayout(false);
            this.symmetricPaddingGroupBox.PerformLayout();
            this.symmetricIVGroupBox.ResumeLayout(false);
            this.symmetricIVGroupBox.PerformLayout();
            this.symmetricAlgorythmGroupBox.ResumeLayout(false);
            this.symmetricAlgorythmGroupBox.PerformLayout();
            this.asymmetricPage.ResumeLayout(false);
            this.asymmetricPaddingGroupBox.ResumeLayout(false);
            this.asymmetricPaddingGroupBox.PerformLayout();
            this.keySizeGroupBox.ResumeLayout(false);
            this.keySizeGroupBox.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.keySizeNumericUpDown)).EndInit();
            this.asymmetricKeysGroupBox.ResumeLayout(false);
            this.publicKeysGroupBox.ResumeLayout(false);
            this.privateKeysGroupBox.ResumeLayout(false);
            this.asymmetricAlgorythmGroupBox.ResumeLayout(false);
            this.asymmetricAlgorythmGroupBox.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button cancelButton;
        private System.Windows.Forms.Button saveButton;
        private System.Windows.Forms.TabControl tabControl;
        private System.Windows.Forms.TabPage symmetricPage;
        private System.Windows.Forms.TabPage asymmetricPage;
        private System.Windows.Forms.GroupBox symmetricAlgorythmGroupBox;
        private System.Windows.Forms.RadioButton AESRadioButton;
        private System.Windows.Forms.RadioButton DESRadioButton;
        private System.Windows.Forms.RadioButton RC2RadioButton;
        private System.Windows.Forms.RadioButton DES3RadioButton;
        private System.Windows.Forms.GroupBox symmetricIVGroupBox;
        private System.Windows.Forms.RadioButton customIVRadioButton;
        private System.Windows.Forms.RadioButton deriveIVRadioButton;
        private System.Windows.Forms.TextBox customIVTextBox;
        private System.Windows.Forms.GroupBox symmetricPaddingGroupBox;
        private System.Windows.Forms.RadioButton symmetricZerosRadioButton;
        private System.Windows.Forms.RadioButton symmetricISO10126RadioButton;
        private System.Windows.Forms.RadioButton symmetricANSIX923RadioButton;
        private System.Windows.Forms.RadioButton symmetricPKCS7RadioButton;
        private System.Windows.Forms.RadioButton symmetricNoneRadioButton;
        private System.Windows.Forms.GroupBox symmetricModeGroupBox;
        private System.Windows.Forms.RadioButton OFBRadioButton;
        private System.Windows.Forms.RadioButton CTSRadioButton;
        private System.Windows.Forms.RadioButton CFBRadioButton;
        private System.Windows.Forms.RadioButton ECBRadioButton;
        private System.Windows.Forms.RadioButton CBCRadioButton;
        private System.Windows.Forms.GroupBox asymmetricKeysGroupBox;
        private System.Windows.Forms.ListView privateKeysListView;
        private System.Windows.Forms.GroupBox asymmetricAlgorythmGroupBox;
        private System.Windows.Forms.RadioButton RSAradioButton;
        private System.Windows.Forms.GroupBox publicKeysGroupBox;
        private System.Windows.Forms.Button deletePublicButton;
        private System.Windows.Forms.Button newPublicKeyButton;
        private System.Windows.Forms.GroupBox privateKeysGroupBox;
        private System.Windows.Forms.Button deletePrivateKeyButton;
        private System.Windows.Forms.Button newPrivateKeyButton;
        private System.Windows.Forms.GroupBox keySizeGroupBox;
        private System.Windows.Forms.Label keySizeLabel;
        private System.Windows.Forms.NumericUpDown keySizeNumericUpDown;
        private System.Windows.Forms.GroupBox asymmetricPaddingGroupBox;
        private System.Windows.Forms.RadioButton asymmetricSHA1RadioButton;
        private System.Windows.Forms.RadioButton asymmetricSHA512RadioButton;
        private System.Windows.Forms.RadioButton asymmetricSHA384RadioButton;
        private System.Windows.Forms.RadioButton asymmetricSHA256RadioButton;
        private System.Windows.Forms.RadioButton asymmetricPKCS1RadioButton;
        private System.Windows.Forms.ListView publicKeysListView;
        private System.Windows.Forms.ColumnHeader publicListName;
        private System.Windows.Forms.ColumnHeader privateListName;
        private System.Windows.Forms.Button defaultsButton;
        private System.Windows.Forms.ToolTip customIVToolTip;
    }
}
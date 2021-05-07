
namespace To_Ba_To_Iutta
{
    partial class AsymmetricEncryptForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AsymmetricEncryptForm));
            this.inputLabel = new System.Windows.Forms.Label();
            this.button = new System.Windows.Forms.Button();
            this.outputLabel = new System.Windows.Forms.Label();
            this.keyNameLabel = new System.Windows.Forms.Label();
            this.input = new System.Windows.Forms.TextBox();
            this.inputPanel = new System.Windows.Forms.Panel();
            this.outputPanel = new System.Windows.Forms.Panel();
            this.output = new System.Windows.Forms.TextBox();
            this.manageKeysButton = new System.Windows.Forms.Button();
            this.keyNamePanel = new System.Windows.Forms.Panel();
            this.keyName = new System.Windows.Forms.TextBox();
            this.keyLabel = new System.Windows.Forms.Label();
            this.keyPanel = new System.Windows.Forms.Panel();
            this.key = new System.Windows.Forms.TextBox();
            this.keyNameRadio = new System.Windows.Forms.RadioButton();
            this.keyRadio = new System.Windows.Forms.RadioButton();
            this.uploadKeyButton = new System.Windows.Forms.Button();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.mainPanel.SuspendLayout();
            this.inputPanel.SuspendLayout();
            this.outputPanel.SuspendLayout();
            this.keyNamePanel.SuspendLayout();
            this.keyPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainPanel
            // 
            this.mainPanel.Controls.Add(this.uploadKeyButton);
            this.mainPanel.Controls.Add(this.keyRadio);
            this.mainPanel.Controls.Add(this.keyNameRadio);
            this.mainPanel.Controls.Add(this.keyPanel);
            this.mainPanel.Controls.Add(this.keyLabel);
            this.mainPanel.Controls.Add(this.manageKeysButton);
            this.mainPanel.Controls.Add(this.button);
            this.mainPanel.Controls.Add(this.keyNamePanel);
            this.mainPanel.Controls.Add(this.outputPanel);
            this.mainPanel.Controls.Add(this.inputPanel);
            this.mainPanel.Controls.Add(this.keyNameLabel);
            this.mainPanel.Controls.Add(this.outputLabel);
            this.mainPanel.Controls.Add(this.inputLabel);
            // 
            // inputLabel
            // 
            this.inputLabel.AutoSize = true;
            this.inputLabel.Font = new System.Drawing.Font("Helvetica", 13F);
            this.inputLabel.ForeColor = System.Drawing.Color.White;
            this.inputLabel.Location = new System.Drawing.Point(12, 12);
            this.inputLabel.Name = "inputLabel";
            this.inputLabel.Size = new System.Drawing.Size(55, 21);
            this.inputLabel.TabIndex = 1;
            this.inputLabel.Text = "Input:";
            // 
            // button
            // 
            this.button.Cursor = System.Windows.Forms.Cursors.Default;
            this.button.FlatAppearance.BorderSize = 0;
            this.button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button.Font = new System.Drawing.Font("Minecraftia", 12.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button.ForeColor = System.Drawing.Color.White;
            this.button.Image = ((System.Drawing.Image)(resources.GetObject("button.Image")));
            this.button.Location = new System.Drawing.Point(614, 236);
            this.button.Name = "button";
            this.button.Size = new System.Drawing.Size(167, 58);
            this.button.TabIndex = 2;
            this.button.Text = "Encrypt";
            this.button.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.button.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.button.UseVisualStyleBackColor = true;
            this.button.Click += new System.EventHandler(this.button_Click);
            // 
            // outputLabel
            // 
            this.outputLabel.AutoSize = true;
            this.outputLabel.Font = new System.Drawing.Font("Helvetica", 13F);
            this.outputLabel.ForeColor = System.Drawing.Color.White;
            this.outputLabel.Location = new System.Drawing.Point(12, 308);
            this.outputLabel.Name = "outputLabel";
            this.outputLabel.Size = new System.Drawing.Size(69, 21);
            this.outputLabel.TabIndex = 3;
            this.outputLabel.Text = "Output:";
            // 
            // keyNameLabel
            // 
            this.keyNameLabel.AutoSize = true;
            this.keyNameLabel.Font = new System.Drawing.Font("Helvetica", 13F);
            this.keyNameLabel.ForeColor = System.Drawing.Color.White;
            this.keyNameLabel.Location = new System.Drawing.Point(12, 238);
            this.keyNameLabel.Name = "keyNameLabel";
            this.keyNameLabel.Size = new System.Drawing.Size(96, 21);
            this.keyNameLabel.TabIndex = 6;
            this.keyNameLabel.Text = "Key name:";
            // 
            // input
            // 
            this.input.AcceptsTab = true;
            this.input.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.input.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.input.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.input.Font = new System.Drawing.Font("Helvetica", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.input.ForeColor = System.Drawing.Color.White;
            this.input.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.input.Location = new System.Drawing.Point(6, 6);
            this.input.MaxLength = 0;
            this.input.Multiline = true;
            this.input.Name = "input";
            this.input.Size = new System.Drawing.Size(655, 204);
            this.input.TabIndex = 0;
            this.input.KeyDown += new System.Windows.Forms.KeyEventHandler(this.input_KeyDown);
            // 
            // inputPanel
            // 
            this.inputPanel.Controls.Add(this.input);
            this.inputPanel.Location = new System.Drawing.Point(114, 12);
            this.inputPanel.Name = "inputPanel";
            this.inputPanel.Size = new System.Drawing.Size(667, 216);
            this.inputPanel.TabIndex = 7;
            // 
            // outputPanel
            // 
            this.outputPanel.Controls.Add(this.output);
            this.outputPanel.Location = new System.Drawing.Point(114, 302);
            this.outputPanel.Name = "outputPanel";
            this.outputPanel.Size = new System.Drawing.Size(667, 216);
            this.outputPanel.TabIndex = 8;
            // 
            // output
            // 
            this.output.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.output.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.output.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.output.Font = new System.Drawing.Font("Helvetica", 11F);
            this.output.ForeColor = System.Drawing.Color.White;
            this.output.Location = new System.Drawing.Point(6, 6);
            this.output.MaxLength = 0;
            this.output.Multiline = true;
            this.output.Name = "output";
            this.output.ReadOnly = true;
            this.output.Size = new System.Drawing.Size(655, 204);
            this.output.TabIndex = 0;
            this.output.TabStop = false;
            // 
            // manageKeysButton
            // 
            this.manageKeysButton.Cursor = System.Windows.Forms.Cursors.Default;
            this.manageKeysButton.FlatAppearance.BorderSize = 0;
            this.manageKeysButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.manageKeysButton.Font = new System.Drawing.Font("Helvetica", 11F);
            this.manageKeysButton.ForeColor = System.Drawing.Color.White;
            this.manageKeysButton.Location = new System.Drawing.Point(441, 236);
            this.manageKeysButton.Name = "manageKeysButton";
            this.manageKeysButton.Size = new System.Drawing.Size(167, 25);
            this.manageKeysButton.TabIndex = 11;
            this.manageKeysButton.Text = "Manage Keys";
            this.manageKeysButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.manageKeysButton.UseVisualStyleBackColor = true;
            this.manageKeysButton.Click += new System.EventHandler(this.manageKeysButton_Click);
            // 
            // keyNamePanel
            // 
            this.keyNamePanel.BackColor = System.Drawing.Color.Transparent;
            this.keyNamePanel.Controls.Add(this.keyName);
            this.keyNamePanel.ForeColor = System.Drawing.Color.White;
            this.keyNamePanel.Location = new System.Drawing.Point(134, 236);
            this.keyNamePanel.Name = "keyNamePanel";
            this.keyNamePanel.Size = new System.Drawing.Size(301, 25);
            this.keyNamePanel.TabIndex = 9;
            // 
            // keyName
            // 
            this.keyName.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.keyName.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.keyName.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.keyName.Font = new System.Drawing.Font("Helvetica", 11F);
            this.keyName.ForeColor = System.Drawing.Color.White;
            this.keyName.Location = new System.Drawing.Point(8, 4);
            this.keyName.Name = "keyName";
            this.keyName.Size = new System.Drawing.Size(288, 18);
            this.keyName.TabIndex = 0;
            this.keyName.TextChanged += new System.EventHandler(this.keyName_TextChanged);
            this.keyName.KeyDown += new System.Windows.Forms.KeyEventHandler(this.keyName_KeyDown);
            // 
            // keyLabel
            // 
            this.keyLabel.AutoSize = true;
            this.keyLabel.Font = new System.Drawing.Font("Helvetica", 13F);
            this.keyLabel.ForeColor = System.Drawing.Color.White;
            this.keyLabel.Location = new System.Drawing.Point(12, 271);
            this.keyLabel.Name = "keyLabel";
            this.keyLabel.Size = new System.Drawing.Size(46, 21);
            this.keyLabel.TabIndex = 12;
            this.keyLabel.Text = "Key:";
            // 
            // keyPanel
            // 
            this.keyPanel.BackColor = System.Drawing.Color.Transparent;
            this.keyPanel.Controls.Add(this.key);
            this.keyPanel.ForeColor = System.Drawing.Color.White;
            this.keyPanel.Location = new System.Drawing.Point(134, 269);
            this.keyPanel.Name = "keyPanel";
            this.keyPanel.Size = new System.Drawing.Size(301, 25);
            this.keyPanel.TabIndex = 10;
            // 
            // key
            // 
            this.key.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.key.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.key.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.key.Font = new System.Drawing.Font("Helvetica", 11F);
            this.key.ForeColor = System.Drawing.Color.White;
            this.key.Location = new System.Drawing.Point(8, 4);
            this.key.Name = "key";
            this.key.Size = new System.Drawing.Size(288, 18);
            this.key.TabIndex = 0;
            this.key.TextChanged += new System.EventHandler(this.key_TextChanged);
            this.key.KeyDown += new System.Windows.Forms.KeyEventHandler(this.key_KeyDown);
            // 
            // keyNameRadio
            // 
            this.keyNameRadio.AutoSize = true;
            this.keyNameRadio.Location = new System.Drawing.Point(114, 243);
            this.keyNameRadio.Name = "keyNameRadio";
            this.keyNameRadio.Size = new System.Drawing.Size(14, 13);
            this.keyNameRadio.TabIndex = 13;
            this.keyNameRadio.TabStop = true;
            this.keyNameRadio.UseVisualStyleBackColor = true;
            // 
            // keyRadio
            // 
            this.keyRadio.AutoSize = true;
            this.keyRadio.Location = new System.Drawing.Point(114, 276);
            this.keyRadio.Name = "keyRadio";
            this.keyRadio.Size = new System.Drawing.Size(14, 13);
            this.keyRadio.TabIndex = 14;
            this.keyRadio.TabStop = true;
            this.keyRadio.UseVisualStyleBackColor = true;
            // 
            // uploadKeyButton
            // 
            this.uploadKeyButton.Cursor = System.Windows.Forms.Cursors.Default;
            this.uploadKeyButton.FlatAppearance.BorderSize = 0;
            this.uploadKeyButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.uploadKeyButton.Font = new System.Drawing.Font("Helvetica", 11F);
            this.uploadKeyButton.ForeColor = System.Drawing.Color.White;
            this.uploadKeyButton.Location = new System.Drawing.Point(441, 269);
            this.uploadKeyButton.Name = "uploadKeyButton";
            this.uploadKeyButton.Size = new System.Drawing.Size(167, 25);
            this.uploadKeyButton.TabIndex = 15;
            this.uploadKeyButton.Text = "Upload Key";
            this.uploadKeyButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.uploadKeyButton.UseVisualStyleBackColor = true;
            this.uploadKeyButton.Click += new System.EventHandler(this.uploadKeyButton_Click);
            // 
            // openFileDialog
            // 
            this.openFileDialog.Filter = "CryptoKey files|*.ck|All files|*.*";
            // 
            // AsymmetricEncryptForm
            // 
            this.AcceptButton = this.button;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.ClientSize = new System.Drawing.Size(794, 530);
            this.Name = "AsymmetricEncryptForm";
            this.mainPanel.ResumeLayout(false);
            this.mainPanel.PerformLayout();
            this.inputPanel.ResumeLayout(false);
            this.inputPanel.PerformLayout();
            this.outputPanel.ResumeLayout(false);
            this.outputPanel.PerformLayout();
            this.keyNamePanel.ResumeLayout(false);
            this.keyNamePanel.PerformLayout();
            this.keyPanel.ResumeLayout(false);
            this.keyPanel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label inputLabel;
        private System.Windows.Forms.Button button;
        private System.Windows.Forms.Label outputLabel;
        private System.Windows.Forms.Label keyNameLabel;
        private System.Windows.Forms.Panel inputPanel;
        private System.Windows.Forms.TextBox input;
        private System.Windows.Forms.Panel outputPanel;
        private System.Windows.Forms.TextBox output;
        private System.Windows.Forms.Button manageKeysButton;
        private System.Windows.Forms.Panel keyNamePanel;
        private System.Windows.Forms.TextBox keyName;
        private System.Windows.Forms.Panel keyPanel;
        private System.Windows.Forms.TextBox key;
        private System.Windows.Forms.Label keyLabel;
        private System.Windows.Forms.RadioButton keyRadio;
        private System.Windows.Forms.RadioButton keyNameRadio;
        private System.Windows.Forms.Button uploadKeyButton;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
    }
}
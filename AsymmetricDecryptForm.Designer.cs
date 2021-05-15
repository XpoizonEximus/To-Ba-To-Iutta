
namespace To_Ba_To_Iutta
{
    partial class AsymmetricDecryptForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AsymmetricDecryptForm));
            this.inputLabel = new System.Windows.Forms.Label();
            this.button = new System.Windows.Forms.Button();
            this.outputLabel = new System.Windows.Forms.Label();
            this.keyNameLabel = new System.Windows.Forms.Label();
            this.input = new System.Windows.Forms.TextBox();
            this.inputPanel = new System.Windows.Forms.Panel();
            this.outputPanel = new System.Windows.Forms.Panel();
            this.output = new System.Windows.Forms.TextBox();
            this.getPublicKeyButton = new System.Windows.Forms.Button();
            this.manageKeysButton = new System.Windows.Forms.Button();
            this.keyPanel = new System.Windows.Forms.Panel();
            this.keyName = new System.Windows.Forms.TextBox();
            this.inputBottomPanel = new System.Windows.Forms.Panel();
            this.clearInputButton = new System.Windows.Forms.Button();
            this.uploadFileButton = new System.Windows.Forms.Button();
            this.outputBottomPanel = new System.Windows.Forms.Panel();
            this.copyButton = new System.Windows.Forms.Button();
            this.saveFileButton = new System.Windows.Forms.Button();
            this.saveFileDialog = new System.Windows.Forms.SaveFileDialog();
            this.openEncryptedFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.mainPanel.SuspendLayout();
            this.inputPanel.SuspendLayout();
            this.outputPanel.SuspendLayout();
            this.keyPanel.SuspendLayout();
            this.inputBottomPanel.SuspendLayout();
            this.outputBottomPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainPanel
            // 
            this.mainPanel.Controls.Add(this.manageKeysButton);
            this.mainPanel.Controls.Add(this.getPublicKeyButton);
            this.mainPanel.Controls.Add(this.button);
            this.mainPanel.Controls.Add(this.keyPanel);
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
            this.button.Text = "Decrypt";
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
            this.input.AllowDrop = true;
            this.input.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.input.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.input.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.input.DataBindings.Add(new System.Windows.Forms.Binding("Text", global::To_Ba_To_Iutta.Properties.Settings.Default, "LastAsymmetricDecryptInput", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.input.Font = new System.Drawing.Font("Helvetica", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.input.ForeColor = System.Drawing.Color.White;
            this.input.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.input.Location = new System.Drawing.Point(6, 6);
            this.input.MaxLength = 0;
            this.input.Multiline = true;
            this.input.Name = "input";
            this.input.Size = new System.Drawing.Size(655, 204);
            this.input.TabIndex = 0;
            this.input.Text = global::To_Ba_To_Iutta.Properties.Settings.Default.LastAsymmetricDecryptInput;
            this.input.DragDrop += new System.Windows.Forms.DragEventHandler(this.input_DragDrop);
            this.input.DragEnter += new System.Windows.Forms.DragEventHandler(this.input_DragEnter);
            this.input.DragLeave += new System.EventHandler(this.input_DragLeave);
            this.input.KeyUp += new System.Windows.Forms.KeyEventHandler(this.input_KeyUp);
            this.input.MouseMove += new System.Windows.Forms.MouseEventHandler(this.inputPanel_MouseMove);
            // 
            // inputPanel
            // 
            this.inputPanel.AllowDrop = true;
            this.inputPanel.Controls.Add(this.inputBottomPanel);
            this.inputPanel.Controls.Add(this.input);
            this.inputPanel.Location = new System.Drawing.Point(114, 12);
            this.inputPanel.Name = "inputPanel";
            this.inputPanel.Size = new System.Drawing.Size(667, 216);
            this.inputPanel.TabIndex = 7;
            this.inputPanel.DragDrop += new System.Windows.Forms.DragEventHandler(this.input_DragDrop);
            this.inputPanel.DragEnter += new System.Windows.Forms.DragEventHandler(this.input_DragEnter);
            this.inputPanel.DragLeave += new System.EventHandler(this.input_DragLeave);
            this.inputPanel.MouseMove += new System.Windows.Forms.MouseEventHandler(this.inputPanel_MouseMove);
            // 
            // outputPanel
            // 
            this.outputPanel.Controls.Add(this.outputBottomPanel);
            this.outputPanel.Controls.Add(this.output);
            this.outputPanel.Location = new System.Drawing.Point(114, 302);
            this.outputPanel.Name = "outputPanel";
            this.outputPanel.Size = new System.Drawing.Size(667, 216);
            this.outputPanel.TabIndex = 8;
            this.outputPanel.MouseMove += new System.Windows.Forms.MouseEventHandler(this.outputPanel_MouseMove);
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
            this.output.MouseMove += new System.Windows.Forms.MouseEventHandler(this.outputPanel_MouseMove);
            // 
            // getPublicKeyButton
            // 
            this.getPublicKeyButton.Cursor = System.Windows.Forms.Cursors.Default;
            this.getPublicKeyButton.FlatAppearance.BorderSize = 0;
            this.getPublicKeyButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.getPublicKeyButton.Font = new System.Drawing.Font("Helvetica", 11F);
            this.getPublicKeyButton.ForeColor = System.Drawing.Color.White;
            this.getPublicKeyButton.Location = new System.Drawing.Point(114, 269);
            this.getPublicKeyButton.Name = "getPublicKeyButton";
            this.getPublicKeyButton.Size = new System.Drawing.Size(167, 25);
            this.getPublicKeyButton.TabIndex = 10;
            this.getPublicKeyButton.Text = "Get Public Key";
            this.getPublicKeyButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.getPublicKeyButton.UseVisualStyleBackColor = true;
            this.getPublicKeyButton.Click += new System.EventHandler(this.getPublicKeyButton_Click);
            // 
            // manageKeysButton
            // 
            this.manageKeysButton.Cursor = System.Windows.Forms.Cursors.Default;
            this.manageKeysButton.FlatAppearance.BorderSize = 0;
            this.manageKeysButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.manageKeysButton.Font = new System.Drawing.Font("Helvetica", 11F);
            this.manageKeysButton.ForeColor = System.Drawing.Color.White;
            this.manageKeysButton.Location = new System.Drawing.Point(289, 269);
            this.manageKeysButton.Name = "manageKeysButton";
            this.manageKeysButton.Size = new System.Drawing.Size(167, 25);
            this.manageKeysButton.TabIndex = 11;
            this.manageKeysButton.Text = "Manage Keys";
            this.manageKeysButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.manageKeysButton.UseVisualStyleBackColor = true;
            this.manageKeysButton.Click += new System.EventHandler(this.manageKeysButton_Click);
            // 
            // keyPanel
            // 
            this.keyPanel.BackColor = System.Drawing.Color.Transparent;
            this.keyPanel.Controls.Add(this.keyName);
            this.keyPanel.ForeColor = System.Drawing.Color.White;
            this.keyPanel.Location = new System.Drawing.Point(114, 236);
            this.keyPanel.Name = "keyPanel";
            this.keyPanel.Size = new System.Drawing.Size(494, 25);
            this.keyPanel.TabIndex = 9;
            // 
            // keyName
            // 
            this.keyName.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.keyName.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.keyName.Font = new System.Drawing.Font("Helvetica", 11F);
            this.keyName.ForeColor = System.Drawing.Color.White;
            this.keyName.Location = new System.Drawing.Point(8, 4);
            this.keyName.Name = "keyName";
            this.keyName.Size = new System.Drawing.Size(481, 18);
            this.keyName.TabIndex = 0;
            this.keyName.KeyUp += new System.Windows.Forms.KeyEventHandler(this.keyName_KeyUp);
            // 
            // inputBottomPanel
            // 
            this.inputBottomPanel.Controls.Add(this.clearInputButton);
            this.inputBottomPanel.Controls.Add(this.uploadFileButton);
            this.inputBottomPanel.Location = new System.Drawing.Point(0, 175);
            this.inputBottomPanel.Name = "inputBottomPanel";
            this.inputBottomPanel.Size = new System.Drawing.Size(667, 41);
            this.inputBottomPanel.TabIndex = 2;
            this.inputBottomPanel.Visible = false;
            this.inputBottomPanel.MouseLeave += new System.EventHandler(this.inputBottomPanel_MouseLeave);
            // 
            // clearInputButton
            // 
            this.clearInputButton.Cursor = System.Windows.Forms.Cursors.Default;
            this.clearInputButton.FlatAppearance.BorderSize = 0;
            this.clearInputButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.clearInputButton.Font = new System.Drawing.Font("Helvetica", 11F);
            this.clearInputButton.ForeColor = System.Drawing.Color.White;
            this.clearInputButton.Location = new System.Drawing.Point(494, 8);
            this.clearInputButton.Name = "clearInputButton";
            this.clearInputButton.Size = new System.Drawing.Size(167, 25);
            this.clearInputButton.TabIndex = 13;
            this.clearInputButton.Text = "Clear";
            this.clearInputButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.clearInputButton.UseVisualStyleBackColor = true;
            this.clearInputButton.Click += new System.EventHandler(this.clearInputButton_Click);
            // 
            // uploadFileButton
            // 
            this.uploadFileButton.Cursor = System.Windows.Forms.Cursors.Default;
            this.uploadFileButton.FlatAppearance.BorderSize = 0;
            this.uploadFileButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.uploadFileButton.Font = new System.Drawing.Font("Helvetica", 11F);
            this.uploadFileButton.ForeColor = System.Drawing.Color.White;
            this.uploadFileButton.Location = new System.Drawing.Point(8, 8);
            this.uploadFileButton.Name = "uploadFileButton";
            this.uploadFileButton.Size = new System.Drawing.Size(167, 25);
            this.uploadFileButton.TabIndex = 12;
            this.uploadFileButton.Text = "Upload file...";
            this.uploadFileButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.uploadFileButton.UseVisualStyleBackColor = true;
            this.uploadFileButton.Click += new System.EventHandler(this.uploadFileButton_Click);
            // 
            // outputBottomPanel
            // 
            this.outputBottomPanel.Controls.Add(this.copyButton);
            this.outputBottomPanel.Controls.Add(this.saveFileButton);
            this.outputBottomPanel.Location = new System.Drawing.Point(0, 175);
            this.outputBottomPanel.Name = "outputBottomPanel";
            this.outputBottomPanel.Size = new System.Drawing.Size(667, 41);
            this.outputBottomPanel.TabIndex = 14;
            this.outputBottomPanel.Visible = false;
            this.outputBottomPanel.MouseLeave += new System.EventHandler(this.outputBottomPanel_MouseLeave);
            // 
            // copyButton
            // 
            this.copyButton.Cursor = System.Windows.Forms.Cursors.Default;
            this.copyButton.FlatAppearance.BorderSize = 0;
            this.copyButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.copyButton.Font = new System.Drawing.Font("Helvetica", 11F);
            this.copyButton.ForeColor = System.Drawing.Color.White;
            this.copyButton.Location = new System.Drawing.Point(181, 8);
            this.copyButton.Name = "copyButton";
            this.copyButton.Size = new System.Drawing.Size(167, 25);
            this.copyButton.TabIndex = 13;
            this.copyButton.Text = "Copy";
            this.copyButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.copyButton.UseVisualStyleBackColor = true;
            this.copyButton.Click += new System.EventHandler(this.copyButton_Click);
            // 
            // saveFileButton
            // 
            this.saveFileButton.Cursor = System.Windows.Forms.Cursors.Default;
            this.saveFileButton.FlatAppearance.BorderSize = 0;
            this.saveFileButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.saveFileButton.Font = new System.Drawing.Font("Helvetica", 11F);
            this.saveFileButton.ForeColor = System.Drawing.Color.White;
            this.saveFileButton.Location = new System.Drawing.Point(8, 8);
            this.saveFileButton.Name = "saveFileButton";
            this.saveFileButton.Size = new System.Drawing.Size(167, 25);
            this.saveFileButton.TabIndex = 12;
            this.saveFileButton.Text = "Save file...";
            this.saveFileButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.saveFileButton.UseVisualStyleBackColor = true;
            this.saveFileButton.Click += new System.EventHandler(this.saveFileButton_Click);
            // 
            // openEncryptedFileDialog
            // 
            this.openEncryptedFileDialog.DefaultExt = "crypt";
            this.openEncryptedFileDialog.Filter = "Encrypted files (*.crypt)|*.crypt|All files (*.*)|*.*";
            // 
            // AsymmetricDecryptForm
            // 
            this.AcceptButton = this.button;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.ClientSize = new System.Drawing.Size(794, 530);
            this.Name = "AsymmetricDecryptForm";
            this.mainPanel.ResumeLayout(false);
            this.mainPanel.PerformLayout();
            this.inputPanel.ResumeLayout(false);
            this.inputPanel.PerformLayout();
            this.outputPanel.ResumeLayout(false);
            this.outputPanel.PerformLayout();
            this.keyPanel.ResumeLayout(false);
            this.keyPanel.PerformLayout();
            this.inputBottomPanel.ResumeLayout(false);
            this.outputBottomPanel.ResumeLayout(false);
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
        private System.Windows.Forms.Button getPublicKeyButton;
        private System.Windows.Forms.Button manageKeysButton;
        private System.Windows.Forms.Panel keyPanel;
        private System.Windows.Forms.TextBox keyName;
        private System.Windows.Forms.Panel inputBottomPanel;
        private System.Windows.Forms.Button clearInputButton;
        private System.Windows.Forms.Button uploadFileButton;
        private System.Windows.Forms.Panel outputBottomPanel;
        private System.Windows.Forms.Button copyButton;
        private System.Windows.Forms.Button saveFileButton;
        private System.Windows.Forms.SaveFileDialog saveFileDialog;
        private System.Windows.Forms.OpenFileDialog openEncryptedFileDialog;
    }
}
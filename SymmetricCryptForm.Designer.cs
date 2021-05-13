
namespace To_Ba_To_Iutta
{
    partial class SymmetricCryptForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SymmetricCryptForm));
            this.inputLabel = new System.Windows.Forms.Label();
            this.button = new System.Windows.Forms.Button();
            this.outputLabel = new System.Windows.Forms.Label();
            this.key = new System.Windows.Forms.TextBox();
            this.keyLabel = new System.Windows.Forms.Label();
            this.input = new System.Windows.Forms.TextBox();
            this.inputPanel = new System.Windows.Forms.Panel();
            this.outputPanel = new System.Windows.Forms.Panel();
            this.outputBottomPanel = new System.Windows.Forms.Panel();
            this.copyButton = new System.Windows.Forms.Button();
            this.saveFileButton = new System.Windows.Forms.Button();
            this.output = new System.Windows.Forms.TextBox();
            this.keyPanel = new System.Windows.Forms.Panel();
            this.inputBottomPanel = new System.Windows.Forms.Panel();
            this.uploadFileButton = new System.Windows.Forms.Button();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.saveFileDialog = new System.Windows.Forms.SaveFileDialog();
            this.openEncryptedFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.saveEncryptedFileDialog = new System.Windows.Forms.SaveFileDialog();
            this.clearInputButton = new System.Windows.Forms.Button();
            this.mainPanel.SuspendLayout();
            this.inputPanel.SuspendLayout();
            this.outputPanel.SuspendLayout();
            this.outputBottomPanel.SuspendLayout();
            this.keyPanel.SuspendLayout();
            this.inputBottomPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainPanel
            // 
            this.mainPanel.Controls.Add(this.inputBottomPanel);
            this.mainPanel.Controls.Add(this.button);
            this.mainPanel.Controls.Add(this.keyPanel);
            this.mainPanel.Controls.Add(this.outputPanel);
            this.mainPanel.Controls.Add(this.inputPanel);
            this.mainPanel.Controls.Add(this.keyLabel);
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
            this.button.Location = new System.Drawing.Point(614, 239);
            this.button.Name = "button";
            this.button.Size = new System.Drawing.Size(167, 52);
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
            // key
            // 
            this.key.AcceptsTab = true;
            this.key.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.key.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.key.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.key.Font = new System.Drawing.Font("Helvetica", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.key.ForeColor = System.Drawing.Color.White;
            this.key.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.key.Location = new System.Drawing.Point(6, 6);
            this.key.MaxLength = 0;
            this.key.Multiline = true;
            this.key.Name = "key";
            this.key.Size = new System.Drawing.Size(482, 40);
            this.key.TabIndex = 5;
            this.key.KeyUp += new System.Windows.Forms.KeyEventHandler(this.key_KeyUp);
            // 
            // keyLabel
            // 
            this.keyLabel.AutoSize = true;
            this.keyLabel.Font = new System.Drawing.Font("Helvetica", 13F);
            this.keyLabel.ForeColor = System.Drawing.Color.White;
            this.keyLabel.Location = new System.Drawing.Point(12, 239);
            this.keyLabel.Name = "keyLabel";
            this.keyLabel.Size = new System.Drawing.Size(46, 21);
            this.keyLabel.TabIndex = 6;
            this.keyLabel.Text = "Key:";
            // 
            // input
            // 
            this.input.AcceptsTab = true;
            this.input.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
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
            this.input.Size = new System.Drawing.Size(655, 208);
            this.input.TabIndex = 0;
            this.input.TextChanged += new System.EventHandler(this.input_TextChanged);
            this.input.KeyUp += new System.Windows.Forms.KeyEventHandler(this.input_KeyUp);
            this.input.MouseMove += new System.Windows.Forms.MouseEventHandler(this.inputPanel_MouseMove);
            // 
            // inputPanel
            // 
            this.inputPanel.Controls.Add(this.input);
            this.inputPanel.Location = new System.Drawing.Point(114, 12);
            this.inputPanel.Name = "inputPanel";
            this.inputPanel.Size = new System.Drawing.Size(667, 220);
            this.inputPanel.TabIndex = 7;
            this.inputPanel.MouseMove += new System.Windows.Forms.MouseEventHandler(this.inputPanel_MouseMove);
            // 
            // outputPanel
            // 
            this.outputPanel.Controls.Add(this.outputBottomPanel);
            this.outputPanel.Controls.Add(this.output);
            this.outputPanel.Location = new System.Drawing.Point(114, 298);
            this.outputPanel.Name = "outputPanel";
            this.outputPanel.Size = new System.Drawing.Size(667, 220);
            this.outputPanel.TabIndex = 8;
            this.outputPanel.MouseMove += new System.Windows.Forms.MouseEventHandler(this.outputPanel_MouseMove);
            // 
            // outputBottomPanel
            // 
            this.outputBottomPanel.Controls.Add(this.copyButton);
            this.outputBottomPanel.Controls.Add(this.saveFileButton);
            this.outputBottomPanel.Location = new System.Drawing.Point(0, 179);
            this.outputBottomPanel.Name = "outputBottomPanel";
            this.outputBottomPanel.Size = new System.Drawing.Size(667, 41);
            this.outputBottomPanel.TabIndex = 13;
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
            // output
            // 
            this.output.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.output.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.output.Font = new System.Drawing.Font("Helvetica", 11F);
            this.output.ForeColor = System.Drawing.Color.White;
            this.output.Location = new System.Drawing.Point(6, 6);
            this.output.MaxLength = 0;
            this.output.Multiline = true;
            this.output.Name = "output";
            this.output.ReadOnly = true;
            this.output.Size = new System.Drawing.Size(655, 208);
            this.output.TabIndex = 0;
            this.output.TabStop = false;
            this.output.MouseMove += new System.Windows.Forms.MouseEventHandler(this.outputPanel_MouseMove);
            // 
            // keyPanel
            // 
            this.keyPanel.Controls.Add(this.key);
            this.keyPanel.Location = new System.Drawing.Point(114, 239);
            this.keyPanel.Name = "keyPanel";
            this.keyPanel.Size = new System.Drawing.Size(494, 52);
            this.keyPanel.TabIndex = 9;
            // 
            // inputBottomPanel
            // 
            this.inputBottomPanel.Controls.Add(this.clearInputButton);
            this.inputBottomPanel.Controls.Add(this.uploadFileButton);
            this.inputBottomPanel.Location = new System.Drawing.Point(114, 191);
            this.inputBottomPanel.Name = "inputBottomPanel";
            this.inputBottomPanel.Size = new System.Drawing.Size(667, 41);
            this.inputBottomPanel.TabIndex = 1;
            this.inputBottomPanel.Visible = false;
            this.inputBottomPanel.MouseLeave += new System.EventHandler(this.inputBottomPanel_MouseLeave);
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
            // openFileDialog
            // 
            this.openFileDialog.Filter = "All files (*.*)|*.*";
            // 
            // openEncryptedFileDialog
            // 
            this.openEncryptedFileDialog.DefaultExt = "crypt";
            this.openEncryptedFileDialog.Filter = "Encrypted files (*.crypt)|*.crypt|All files (*.*)|*.*";
            // 
            // saveEncryptedFileDialog
            // 
            this.saveEncryptedFileDialog.DefaultExt = "crypt";
            this.saveEncryptedFileDialog.Filter = "Encrypted files (*.crypt)|*.crypt|All files (*.*)|*.*";
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
            // SymmetricCryptForm
            // 
            this.AcceptButton = this.button;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.ClientSize = new System.Drawing.Size(794, 530);
            this.Name = "SymmetricCryptForm";
            this.mainPanel.ResumeLayout(false);
            this.mainPanel.PerformLayout();
            this.inputPanel.ResumeLayout(false);
            this.inputPanel.PerformLayout();
            this.outputPanel.ResumeLayout(false);
            this.outputPanel.PerformLayout();
            this.outputBottomPanel.ResumeLayout(false);
            this.keyPanel.ResumeLayout(false);
            this.keyPanel.PerformLayout();
            this.inputBottomPanel.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label inputLabel;
        private System.Windows.Forms.Button button;
        private System.Windows.Forms.Label outputLabel;
        private System.Windows.Forms.Label keyLabel;
        private System.Windows.Forms.TextBox key;
        private System.Windows.Forms.Panel inputPanel;
        private System.Windows.Forms.TextBox input;
        private System.Windows.Forms.Panel outputPanel;
        private System.Windows.Forms.Panel keyPanel;
        private System.Windows.Forms.TextBox output;
        private System.Windows.Forms.Panel inputBottomPanel;
        private System.Windows.Forms.Button uploadFileButton;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
        private System.Windows.Forms.Panel outputBottomPanel;
        private System.Windows.Forms.Button saveFileButton;
        private System.Windows.Forms.Button copyButton;
        private System.Windows.Forms.SaveFileDialog saveFileDialog;
        private System.Windows.Forms.OpenFileDialog openEncryptedFileDialog;
        private System.Windows.Forms.SaveFileDialog saveEncryptedFileDialog;
        private System.Windows.Forms.Button clearInputButton;
    }
}

namespace To_Ba_To_Iutta
{
    partial class ChatConnectForm
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
            this.keyToSendLabel = new System.Windows.Forms.Label();
            this.copy = new System.Windows.Forms.Button();
            this.save = new System.Windows.Forms.Button();
            this.saveFileDialog = new System.Windows.Forms.SaveFileDialog();
            this.sendKey = new System.Windows.Forms.TextBox();
            this.recivedKeyLabel = new System.Windows.Forms.Label();
            this.reciveKey = new System.Windows.Forms.TextBox();
            this.connect = new System.Windows.Forms.Button();
            this.import = new System.Windows.Forms.Button();
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.SuspendLayout();
            // 
            // keyToSendLabel
            // 
            this.keyToSendLabel.AutoSize = true;
            this.keyToSendLabel.Location = new System.Drawing.Point(12, 15);
            this.keyToSendLabel.Name = "keyToSendLabel";
            this.keyToSendLabel.Size = new System.Drawing.Size(94, 17);
            this.keyToSendLabel.TabIndex = 0;
            this.keyToSendLabel.Text = "Key to send: ";
            // 
            // copy
            // 
            this.copy.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.copy.Location = new System.Drawing.Point(587, 111);
            this.copy.Name = "copy";
            this.copy.Size = new System.Drawing.Size(101, 29);
            this.copy.TabIndex = 2;
            this.copy.Text = "Copy";
            this.copy.UseVisualStyleBackColor = true;
            this.copy.Click += new System.EventHandler(this.copy_Click);
            // 
            // save
            // 
            this.save.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.save.Location = new System.Drawing.Point(480, 111);
            this.save.Name = "save";
            this.save.Size = new System.Drawing.Size(101, 29);
            this.save.TabIndex = 3;
            this.save.Text = "Save";
            this.save.UseVisualStyleBackColor = true;
            this.save.Click += new System.EventHandler(this.save_Click);
            // 
            // saveFileDialog
            // 
            this.saveFileDialog.DefaultExt = "ck";
            this.saveFileDialog.Filter = "CryptoKey files (*.ck)|*.ck|All files (*.*)|*.*";
            // 
            // sendKey
            // 
            this.sendKey.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.sendKey.Location = new System.Drawing.Point(114, 12);
            this.sendKey.MinimumSize = new System.Drawing.Size(4, 25);
            this.sendKey.Multiline = true;
            this.sendKey.Name = "sendKey";
            this.sendKey.ReadOnly = true;
            this.sendKey.Size = new System.Drawing.Size(573, 93);
            this.sendKey.TabIndex = 4;
            this.sendKey.Text = "key";
            // 
            // recivedKeyLabel
            // 
            this.recivedKeyLabel.AutoSize = true;
            this.recivedKeyLabel.Location = new System.Drawing.Point(14, 149);
            this.recivedKeyLabel.Name = "recivedKeyLabel";
            this.recivedKeyLabel.Size = new System.Drawing.Size(94, 17);
            this.recivedKeyLabel.TabIndex = 5;
            this.recivedKeyLabel.Text = "Recived key:";
            // 
            // reciveKey
            // 
            this.reciveKey.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.reciveKey.Location = new System.Drawing.Point(114, 146);
            this.reciveKey.MinimumSize = new System.Drawing.Size(4, 25);
            this.reciveKey.Multiline = true;
            this.reciveKey.Name = "reciveKey";
            this.reciveKey.Size = new System.Drawing.Size(573, 112);
            this.reciveKey.TabIndex = 6;
            // 
            // connect
            // 
            this.connect.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.connect.Location = new System.Drawing.Point(587, 306);
            this.connect.Name = "connect";
            this.connect.Size = new System.Drawing.Size(101, 29);
            this.connect.TabIndex = 7;
            this.connect.Text = "Connect";
            this.connect.UseVisualStyleBackColor = true;
            this.connect.Click += new System.EventHandler(this.connect_Click);
            // 
            // import
            // 
            this.import.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.import.Location = new System.Drawing.Point(587, 271);
            this.import.Name = "import";
            this.import.Size = new System.Drawing.Size(101, 29);
            this.import.TabIndex = 8;
            this.import.Text = "Import";
            this.import.UseVisualStyleBackColor = true;
            this.import.Click += new System.EventHandler(this.import_Click);
            // 
            // openFileDialog
            // 
            this.openFileDialog.DefaultExt = "ck";
            this.openFileDialog.Filter = "CryptoKey files (*.ck)|*.ck|All files (*.*)|*.*";
            // 
            // ChatConnectForm
            // 
            this.AcceptButton = this.connect;
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 17F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.ClientSize = new System.Drawing.Size(699, 347);
            this.Controls.Add(this.import);
            this.Controls.Add(this.connect);
            this.Controls.Add(this.reciveKey);
            this.Controls.Add(this.recivedKeyLabel);
            this.Controls.Add(this.sendKey);
            this.Controls.Add(this.save);
            this.Controls.Add(this.copy);
            this.Controls.Add(this.keyToSendLabel);
            this.Font = new System.Drawing.Font("Helvetica", 11F);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(348, 235);
            this.Name = "ChatConnectForm";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Connect chat";
            this.Resize += new System.EventHandler(this.ChatConnectForm_Resize);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label keyToSendLabel;
        private System.Windows.Forms.Button copy;
        private System.Windows.Forms.Button save;
        private System.Windows.Forms.SaveFileDialog saveFileDialog;
        private System.Windows.Forms.TextBox sendKey;
        private System.Windows.Forms.Label recivedKeyLabel;
        private System.Windows.Forms.TextBox reciveKey;
        private System.Windows.Forms.Button connect;
        private System.Windows.Forms.Button import;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
    }
}
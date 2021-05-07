
namespace To_Ba_To_Iutta
{
    partial class ChatElement
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ChatElement));
            this.copyCipherButton = new System.Windows.Forms.Button();
            this.senderDelete = new System.Windows.Forms.Button();
            this.recieverDelete = new System.Windows.Forms.Button();
            this.contextMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.copyTextToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.copyCipherToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.deleteToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.saveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.textLabel = new System.Windows.Forms.Label();
            this.separatorPanel = new System.Windows.Forms.Panel();
            this.cipherLabel = new System.Windows.Forms.Label();
            this.saveFileDialog = new System.Windows.Forms.SaveFileDialog();
            this.contextMenuStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // copyCipherButton
            // 
            this.copyCipherButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.copyCipherButton.Cursor = System.Windows.Forms.Cursors.Default;
            this.copyCipherButton.FlatAppearance.BorderSize = 0;
            this.copyCipherButton.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.copyCipherButton.Font = new System.Drawing.Font("Helvetica", 11F);
            this.copyCipherButton.ForeColor = System.Drawing.Color.White;
            this.copyCipherButton.Location = new System.Drawing.Point(437, 130);
            this.copyCipherButton.Name = "copyCipherButton";
            this.copyCipherButton.Size = new System.Drawing.Size(167, 25);
            this.copyCipherButton.TabIndex = 12;
            this.copyCipherButton.Text = "Copy Cipher";
            this.copyCipherButton.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.copyCipherButton.UseVisualStyleBackColor = true;
            this.copyCipherButton.Click += new System.EventHandler(this.DeleteHandler);
            // 
            // senderDelete
            // 
            this.senderDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.senderDelete.Cursor = System.Windows.Forms.Cursors.Default;
            this.senderDelete.FlatAppearance.BorderSize = 0;
            this.senderDelete.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.senderDelete.Font = new System.Drawing.Font("Helvetica", 11F);
            this.senderDelete.ForeColor = System.Drawing.Color.White;
            this.senderDelete.Location = new System.Drawing.Point(264, 130);
            this.senderDelete.Name = "senderDelete";
            this.senderDelete.Size = new System.Drawing.Size(167, 25);
            this.senderDelete.TabIndex = 13;
            this.senderDelete.Text = "Delete";
            this.senderDelete.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.senderDelete.UseVisualStyleBackColor = true;
            this.senderDelete.Click += new System.EventHandler(this.DeleteHandler);
            // 
            // recieverDelete
            // 
            this.recieverDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.recieverDelete.Cursor = System.Windows.Forms.Cursors.Default;
            this.recieverDelete.FlatAppearance.BorderSize = 0;
            this.recieverDelete.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.recieverDelete.Font = new System.Drawing.Font("Helvetica", 11F);
            this.recieverDelete.ForeColor = System.Drawing.Color.White;
            this.recieverDelete.Location = new System.Drawing.Point(6, 130);
            this.recieverDelete.Name = "recieverDelete";
            this.recieverDelete.Size = new System.Drawing.Size(167, 25);
            this.recieverDelete.TabIndex = 14;
            this.recieverDelete.Text = "Delete";
            this.recieverDelete.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.recieverDelete.UseVisualStyleBackColor = true;
            this.recieverDelete.Click += new System.EventHandler(this.DeleteHandler);
            // 
            // contextMenuStrip
            // 
            this.contextMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.copyTextToolStripMenuItem,
            this.copyCipherToolStripMenuItem,
            this.deleteToolStripMenuItem,
            this.saveToolStripMenuItem});
            this.contextMenuStrip.Name = "contextMenuStrip";
            this.contextMenuStrip.Size = new System.Drawing.Size(141, 92);
            // 
            // copyTextToolStripMenuItem
            // 
            this.copyTextToolStripMenuItem.Name = "copyTextToolStripMenuItem";
            this.copyTextToolStripMenuItem.Size = new System.Drawing.Size(140, 22);
            this.copyTextToolStripMenuItem.Text = "Copy Text";
            this.copyTextToolStripMenuItem.Click += new System.EventHandler(this.CopyTextHandler);
            // 
            // copyCipherToolStripMenuItem
            // 
            this.copyCipherToolStripMenuItem.Name = "copyCipherToolStripMenuItem";
            this.copyCipherToolStripMenuItem.Size = new System.Drawing.Size(140, 22);
            this.copyCipherToolStripMenuItem.Text = "Copy Cipher";
            this.copyCipherToolStripMenuItem.Click += new System.EventHandler(this.CopyCipherHandler);
            // 
            // deleteToolStripMenuItem
            // 
            this.deleteToolStripMenuItem.Name = "deleteToolStripMenuItem";
            this.deleteToolStripMenuItem.Size = new System.Drawing.Size(140, 22);
            this.deleteToolStripMenuItem.Text = "Delete";
            this.deleteToolStripMenuItem.Click += new System.EventHandler(this.DeleteHandler);
            // 
            // saveToolStripMenuItem
            // 
            this.saveToolStripMenuItem.Name = "saveToolStripMenuItem";
            this.saveToolStripMenuItem.Size = new System.Drawing.Size(140, 22);
            this.saveToolStripMenuItem.Text = "Save";
            this.saveToolStripMenuItem.Click += new System.EventHandler(this.SaveHandler);
            // 
            // textLabel
            // 
            this.textLabel.AutoSize = true;
            this.textLabel.ForeColor = System.Drawing.Color.White;
            this.textLabel.Location = new System.Drawing.Point(8, 4);
            this.textLabel.MaximumSize = new System.Drawing.Size(594, 0);
            this.textLabel.Name = "textLabel";
            this.textLabel.Size = new System.Drawing.Size(32, 17);
            this.textLabel.TabIndex = 16;
            this.textLabel.Text = "text";
            this.textLabel.TextChanged += new System.EventHandler(this.textLabel_TextChanged);
            // 
            // separatorPanel
            // 
            this.separatorPanel.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("separatorPanel.BackgroundImage")));
            this.separatorPanel.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.separatorPanel.Location = new System.Drawing.Point(0, 24);
            this.separatorPanel.Name = "separatorPanel";
            this.separatorPanel.Padding = new System.Windows.Forms.Padding(3, 0, 3, 0);
            this.separatorPanel.Size = new System.Drawing.Size(610, 3);
            this.separatorPanel.TabIndex = 17;
            // 
            // cipherLabel
            // 
            this.cipherLabel.AutoEllipsis = true;
            this.cipherLabel.AutoSize = true;
            this.cipherLabel.ForeColor = System.Drawing.Color.White;
            this.cipherLabel.Location = new System.Drawing.Point(8, 30);
            this.cipherLabel.MaximumSize = new System.Drawing.Size(594, 17);
            this.cipherLabel.MinimumSize = new System.Drawing.Size(0, 17);
            this.cipherLabel.Name = "cipherLabel";
            this.cipherLabel.Size = new System.Drawing.Size(48, 17);
            this.cipherLabel.TabIndex = 18;
            this.cipherLabel.Text = "cipher";
            // 
            // saveFileDialog
            // 
            this.saveFileDialog.Filter = "Text files|*.txt|All files|*.*";
            // 
            // ChatElement
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 17F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.ContextMenuStrip = this.contextMenuStrip;
            this.Controls.Add(this.cipherLabel);
            this.Controls.Add(this.separatorPanel);
            this.Controls.Add(this.textLabel);
            this.Controls.Add(this.recieverDelete);
            this.Controls.Add(this.senderDelete);
            this.Controls.Add(this.copyCipherButton);
            this.Font = new System.Drawing.Font("Helvetica", 11F);
            this.MaximumSize = new System.Drawing.Size(610, 0);
            this.MinimumSize = new System.Drawing.Size(610, 161);
            this.Name = "ChatElement";
            this.Size = new System.Drawing.Size(610, 161);
            this.Load += new System.EventHandler(this.ChatElement_Load);
            this.contextMenuStrip.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button copyCipherButton;
        private System.Windows.Forms.Button senderDelete;
        private System.Windows.Forms.Button recieverDelete;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip;
        private System.Windows.Forms.ToolStripMenuItem copyTextToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem copyCipherToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem deleteToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem;
        private System.Windows.Forms.Label textLabel;
        private System.Windows.Forms.Panel separatorPanel;
        private System.Windows.Forms.Label cipherLabel;
        private System.Windows.Forms.SaveFileDialog saveFileDialog;
    }
}

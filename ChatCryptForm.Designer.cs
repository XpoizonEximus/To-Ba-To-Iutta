
namespace To_Ba_To_Iutta
{
    partial class ChatCryptForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(ChatCryptForm));
            this.statusStrip = new System.Windows.Forms.StatusStrip();
            this.ipLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusConstantTextLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.statusLabel = new System.Windows.Forms.ToolStripStatusLabel();
            this.connect = new System.Windows.Forms.Button();
            this.containerPanel = new System.Windows.Forms.Panel();
            this.chatElementContainerContainerPanel = new System.Windows.Forms.Panel();
            this.chatElementContainerPanel = new System.Windows.Forms.Panel();
            this.baseContainerPanel = new System.Windows.Forms.Panel();
            this.rightContainerPanel = new System.Windows.Forms.Panel();
            this.sendTextBoxPanel = new System.Windows.Forms.Panel();
            this.sendTextBox = new System.Windows.Forms.TextBox();
            this.send = new System.Windows.Forms.Button();
            this.leftContainerPanel = new System.Windows.Forms.Panel();
            this.reciveTextBoxPanel = new System.Windows.Forms.Panel();
            this.reciveTextBox = new System.Windows.Forms.TextBox();
            this.recive = new System.Windows.Forms.Button();
            this.disconnect = new System.Windows.Forms.Button();
            this.mainPanel.SuspendLayout();
            this.statusStrip.SuspendLayout();
            this.containerPanel.SuspendLayout();
            this.chatElementContainerContainerPanel.SuspendLayout();
            this.baseContainerPanel.SuspendLayout();
            this.rightContainerPanel.SuspendLayout();
            this.sendTextBoxPanel.SuspendLayout();
            this.leftContainerPanel.SuspendLayout();
            this.reciveTextBoxPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainPanel
            // 
            this.mainPanel.Controls.Add(this.disconnect);
            this.mainPanel.Controls.Add(this.containerPanel);
            this.mainPanel.Controls.Add(this.connect);
            this.mainPanel.Controls.Add(this.statusStrip);
            this.mainPanel.Font = new System.Drawing.Font("Helvetica", 11F);
            // 
            // statusStrip
            // 
            this.statusStrip.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.statusStrip.Font = new System.Drawing.Font("Helvetica", 9F);
            this.statusStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ipLabel,
            this.statusConstantTextLabel,
            this.statusLabel});
            this.statusStrip.Location = new System.Drawing.Point(0, 508);
            this.statusStrip.Name = "statusStrip";
            this.statusStrip.Size = new System.Drawing.Size(794, 22);
            this.statusStrip.SizingGrip = false;
            this.statusStrip.TabIndex = 0;
            this.statusStrip.Text = "statusStrip1";
            // 
            // ipLabel
            // 
            this.ipLabel.BackColor = System.Drawing.Color.Transparent;
            this.ipLabel.BorderStyle = System.Windows.Forms.Border3DStyle.Etched;
            this.ipLabel.Name = "ipLabel";
            this.ipLabel.Size = new System.Drawing.Size(124, 17);
            this.ipLabel.Text = "toolStripStatusLabel2";
            // 
            // statusConstantTextLabel
            // 
            this.statusConstantTextLabel.BackColor = System.Drawing.Color.Transparent;
            this.statusConstantTextLabel.Name = "statusConstantTextLabel";
            this.statusConstantTextLabel.Size = new System.Drawing.Size(44, 17);
            this.statusConstantTextLabel.Text = "Status:";
            // 
            // statusLabel
            // 
            this.statusLabel.BackColor = System.Drawing.Color.Transparent;
            this.statusLabel.BorderStyle = System.Windows.Forms.Border3DStyle.Sunken;
            this.statusLabel.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.statusLabel.ForeColor = System.Drawing.Color.Red;
            this.statusLabel.Name = "statusLabel";
            this.statusLabel.Size = new System.Drawing.Size(86, 17);
            this.statusLabel.Text = "Not connected";
            // 
            // connect
            // 
            this.connect.FlatAppearance.BorderSize = 0;
            this.connect.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.connect.Font = new System.Drawing.Font("Minecraftia", 12.75F);
            this.connect.ForeColor = System.Drawing.Color.White;
            this.connect.Image = ((System.Drawing.Image)(resources.GetObject("connect.Image")));
            this.connect.Location = new System.Drawing.Point(211, 438);
            this.connect.Name = "connect";
            this.connect.Size = new System.Drawing.Size(180, 58);
            this.connect.TabIndex = 1;
            this.connect.Text = "Connnect";
            this.connect.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.connect.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.connect.UseVisualStyleBackColor = true;
            this.connect.Click += new System.EventHandler(this.connect_Click);
            // 
            // containerPanel
            // 
            this.containerPanel.Controls.Add(this.chatElementContainerContainerPanel);
            this.containerPanel.Controls.Add(this.baseContainerPanel);
            this.containerPanel.Location = new System.Drawing.Point(12, 12);
            this.containerPanel.Name = "containerPanel";
            this.containerPanel.Size = new System.Drawing.Size(770, 420);
            this.containerPanel.TabIndex = 2;
            // 
            // chatElementContainerContainerPanel
            // 
            this.chatElementContainerContainerPanel.Controls.Add(this.chatElementContainerPanel);
            this.chatElementContainerContainerPanel.Location = new System.Drawing.Point(8, 8);
            this.chatElementContainerContainerPanel.Name = "chatElementContainerContainerPanel";
            this.chatElementContainerContainerPanel.Size = new System.Drawing.Size(754, 342);
            this.chatElementContainerContainerPanel.TabIndex = 2;
            // 
            // chatElementContainerPanel
            // 
            this.chatElementContainerPanel.AutoScroll = true;
            this.chatElementContainerPanel.Location = new System.Drawing.Point(2, 2);
            this.chatElementContainerPanel.Name = "chatElementContainerPanel";
            this.chatElementContainerPanel.Size = new System.Drawing.Size(750, 338);
            this.chatElementContainerPanel.TabIndex = 1;
            // 
            // baseContainerPanel
            // 
            this.baseContainerPanel.BackColor = System.Drawing.Color.Transparent;
            this.baseContainerPanel.Controls.Add(this.rightContainerPanel);
            this.baseContainerPanel.Controls.Add(this.leftContainerPanel);
            this.baseContainerPanel.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.baseContainerPanel.Location = new System.Drawing.Point(0, 358);
            this.baseContainerPanel.Name = "baseContainerPanel";
            this.baseContainerPanel.Size = new System.Drawing.Size(770, 62);
            this.baseContainerPanel.TabIndex = 0;
            // 
            // rightContainerPanel
            // 
            this.rightContainerPanel.Controls.Add(this.sendTextBoxPanel);
            this.rightContainerPanel.Controls.Add(this.send);
            this.rightContainerPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.rightContainerPanel.Location = new System.Drawing.Point(385, 0);
            this.rightContainerPanel.Name = "rightContainerPanel";
            this.rightContainerPanel.Size = new System.Drawing.Size(385, 62);
            this.rightContainerPanel.TabIndex = 1;
            this.rightContainerPanel.Paint += new System.Windows.Forms.PaintEventHandler(this.rightContainerPanel_Paint);
            // 
            // sendTextBoxPanel
            // 
            this.sendTextBoxPanel.BackColor = System.Drawing.Color.Transparent;
            this.sendTextBoxPanel.Controls.Add(this.sendTextBox);
            this.sendTextBoxPanel.ForeColor = System.Drawing.Color.White;
            this.sendTextBoxPanel.Location = new System.Drawing.Point(6, 6);
            this.sendTextBoxPanel.Name = "sendTextBoxPanel";
            this.sendTextBoxPanel.Size = new System.Drawing.Size(309, 50);
            this.sendTextBoxPanel.TabIndex = 11;
            // 
            // sendTextBox
            // 
            this.sendTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.sendTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.sendTextBox.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.sendTextBox.Font = new System.Drawing.Font("Helvetica", 11F);
            this.sendTextBox.ForeColor = System.Drawing.Color.White;
            this.sendTextBox.Location = new System.Drawing.Point(8, 4);
            this.sendTextBox.Multiline = true;
            this.sendTextBox.Name = "sendTextBox";
            this.sendTextBox.Size = new System.Drawing.Size(293, 45);
            this.sendTextBox.TabIndex = 0;
            this.sendTextBox.KeyUp += new System.Windows.Forms.KeyEventHandler(this.sendTextBox_KeyUp);
            // 
            // send
            // 
            this.send.Dock = System.Windows.Forms.DockStyle.Right;
            this.send.FlatAppearance.BorderSize = 0;
            this.send.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.send.Font = new System.Drawing.Font("Minecraftia", 12.75F);
            this.send.ForeColor = System.Drawing.Color.White;
            this.send.Image = ((System.Drawing.Image)(resources.GetObject("send.Image")));
            this.send.Location = new System.Drawing.Point(321, 0);
            this.send.Name = "send";
            this.send.Size = new System.Drawing.Size(64, 62);
            this.send.TabIndex = 3;
            this.send.UseVisualStyleBackColor = true;
            this.send.Click += new System.EventHandler(this.send_Click);
            // 
            // leftContainerPanel
            // 
            this.leftContainerPanel.Controls.Add(this.reciveTextBoxPanel);
            this.leftContainerPanel.Controls.Add(this.recive);
            this.leftContainerPanel.Dock = System.Windows.Forms.DockStyle.Left;
            this.leftContainerPanel.Location = new System.Drawing.Point(0, 0);
            this.leftContainerPanel.Name = "leftContainerPanel";
            this.leftContainerPanel.Size = new System.Drawing.Size(385, 62);
            this.leftContainerPanel.TabIndex = 0;
            // 
            // reciveTextBoxPanel
            // 
            this.reciveTextBoxPanel.BackColor = System.Drawing.Color.Transparent;
            this.reciveTextBoxPanel.Controls.Add(this.reciveTextBox);
            this.reciveTextBoxPanel.ForeColor = System.Drawing.Color.White;
            this.reciveTextBoxPanel.Location = new System.Drawing.Point(70, 6);
            this.reciveTextBoxPanel.Name = "reciveTextBoxPanel";
            this.reciveTextBoxPanel.Size = new System.Drawing.Size(309, 50);
            this.reciveTextBoxPanel.TabIndex = 10;
            // 
            // reciveTextBox
            // 
            this.reciveTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.reciveTextBox.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.reciveTextBox.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.reciveTextBox.Font = new System.Drawing.Font("Helvetica", 11F);
            this.reciveTextBox.ForeColor = System.Drawing.Color.White;
            this.reciveTextBox.Location = new System.Drawing.Point(8, 4);
            this.reciveTextBox.Multiline = true;
            this.reciveTextBox.Name = "reciveTextBox";
            this.reciveTextBox.Size = new System.Drawing.Size(293, 45);
            this.reciveTextBox.TabIndex = 0;
            this.reciveTextBox.KeyUp += new System.Windows.Forms.KeyEventHandler(this.ReciveTextBox_KeyUp);
            // 
            // recive
            // 
            this.recive.Dock = System.Windows.Forms.DockStyle.Left;
            this.recive.FlatAppearance.BorderSize = 0;
            this.recive.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.recive.Font = new System.Drawing.Font("Minecraftia", 12.75F);
            this.recive.ForeColor = System.Drawing.Color.White;
            this.recive.Image = ((System.Drawing.Image)(resources.GetObject("recive.Image")));
            this.recive.Location = new System.Drawing.Point(0, 0);
            this.recive.Name = "recive";
            this.recive.Size = new System.Drawing.Size(64, 62);
            this.recive.TabIndex = 4;
            this.recive.UseVisualStyleBackColor = true;
            this.recive.Click += new System.EventHandler(this.recive_Click);
            // 
            // disconnect
            // 
            this.disconnect.FlatAppearance.BorderSize = 0;
            this.disconnect.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.disconnect.Font = new System.Drawing.Font("Minecraftia", 12.75F);
            this.disconnect.ForeColor = System.Drawing.Color.White;
            this.disconnect.Image = ((System.Drawing.Image)(resources.GetObject("disconnect.Image")));
            this.disconnect.Location = new System.Drawing.Point(403, 438);
            this.disconnect.Name = "disconnect";
            this.disconnect.Size = new System.Drawing.Size(180, 58);
            this.disconnect.TabIndex = 3;
            this.disconnect.Text = "Disconnnect";
            this.disconnect.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.disconnect.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.disconnect.UseVisualStyleBackColor = true;
            this.disconnect.Click += new System.EventHandler(this.disconnect_Click);
            // 
            // ChatCryptForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.ClientSize = new System.Drawing.Size(794, 530);
            this.Name = "ChatCryptForm";
            this.mainPanel.ResumeLayout(false);
            this.mainPanel.PerformLayout();
            this.statusStrip.ResumeLayout(false);
            this.statusStrip.PerformLayout();
            this.containerPanel.ResumeLayout(false);
            this.chatElementContainerContainerPanel.ResumeLayout(false);
            this.baseContainerPanel.ResumeLayout(false);
            this.rightContainerPanel.ResumeLayout(false);
            this.sendTextBoxPanel.ResumeLayout(false);
            this.sendTextBoxPanel.PerformLayout();
            this.leftContainerPanel.ResumeLayout(false);
            this.reciveTextBoxPanel.ResumeLayout(false);
            this.reciveTextBoxPanel.PerformLayout();
            this.ResumeLayout(false);

        }
        #endregion

        private System.Windows.Forms.StatusStrip statusStrip;
        private System.Windows.Forms.ToolStripStatusLabel statusLabel;
        private System.Windows.Forms.Button connect;
        private System.Windows.Forms.Panel containerPanel;
        private System.Windows.Forms.Panel baseContainerPanel;
        private System.Windows.Forms.Panel rightContainerPanel;
        private System.Windows.Forms.Panel leftContainerPanel;
        private System.Windows.Forms.Button send;
        private System.Windows.Forms.Button recive;
        private System.Windows.Forms.Panel sendTextBoxPanel;
        private System.Windows.Forms.TextBox sendTextBox;
        private System.Windows.Forms.Panel reciveTextBoxPanel;
        private System.Windows.Forms.TextBox reciveTextBox;
        private System.Windows.Forms.ToolStripStatusLabel ipLabel;
        private System.Windows.Forms.Button disconnect;
        private System.Windows.Forms.ToolStripStatusLabel statusConstantTextLabel;
        public System.Windows.Forms.Panel chatElementContainerPanel;
        private System.Windows.Forms.Panel chatElementContainerContainerPanel;
    }
}
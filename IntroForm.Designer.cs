namespace To_Ba_To_Iutta
{
    partial class IntroForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(IntroForm));
            this.encryptPanel = new System.Windows.Forms.Panel();
            this.decryptPanel = new System.Windows.Forms.Panel();
            this.errorTimer = new System.Windows.Forms.Timer(this.components);
            this.SuspendLayout();
            // 
            // encryptPanel
            // 
            this.encryptPanel.BackColor = System.Drawing.Color.Transparent;
            this.encryptPanel.Location = new System.Drawing.Point(85, 341);
            this.encryptPanel.Name = "encryptPanel";
            this.encryptPanel.Size = new System.Drawing.Size(196, 32);
            this.encryptPanel.TabIndex = 0;
            this.encryptPanel.MouseEnter += new System.EventHandler(this.encryptPanel_MouseEnter);
            this.encryptPanel.MouseLeave += new System.EventHandler(this.ResetThis);
            // 
            // decryptPanel
            // 
            this.decryptPanel.BackColor = System.Drawing.Color.Transparent;
            this.decryptPanel.Location = new System.Drawing.Point(680, 347);
            this.decryptPanel.Name = "decryptPanel";
            this.decryptPanel.Size = new System.Drawing.Size(196, 32);
            this.decryptPanel.TabIndex = 1;
            this.decryptPanel.MouseEnter += new System.EventHandler(this.decryptPanel_MouseEnter);
            this.decryptPanel.MouseLeave += new System.EventHandler(this.ResetThis);
            // 
            // errorTimer
            // 
            this.errorTimer.Interval = 10;
            this.errorTimer.Tick += new System.EventHandler(this.errorTimer_Tick);
            // 
            // IntroForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(954, 567);
            this.Controls.Add(this.decryptPanel);
            this.Controls.Add(this.encryptPanel);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "IntroForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "To ba to iutta";
            this.ResumeLayout(false);

        }

        private System.Windows.Forms.Panel encryptPanel;
        private System.Windows.Forms.Panel decryptPanel;
        private System.Windows.Forms.Timer errorTimer;
        #endregion
    }
}
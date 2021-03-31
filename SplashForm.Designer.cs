
namespace To_Ba_To_Iutta
{
    partial class SplashForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SplashForm));
            this.loadingImage = new System.Windows.Forms.PictureBox();
            this.titleLabel = new System.Windows.Forms.Label();
            this.hideTimer = new System.Windows.Forms.Timer(this.components);
            this.startTimer = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.loadingImage)).BeginInit();
            this.SuspendLayout();
            // 
            // loadingImage
            // 
            this.loadingImage.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.loadingImage.Dock = System.Windows.Forms.DockStyle.Fill;
            this.loadingImage.Image = ((System.Drawing.Image)(resources.GetObject("loadingImage.Image")));
            this.loadingImage.Location = new System.Drawing.Point(0, 0);
            this.loadingImage.Name = "loadingImage";
            this.loadingImage.Size = new System.Drawing.Size(430, 240);
            this.loadingImage.TabIndex = 0;
            this.loadingImage.TabStop = false;
            // 
            // titleLabel
            // 
            this.titleLabel.AutoSize = true;
            this.titleLabel.BackColor = System.Drawing.Color.Transparent;
            this.titleLabel.Font = new System.Drawing.Font("Minecraftia", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.titleLabel.ForeColor = System.Drawing.Color.White;
            this.titleLabel.Location = new System.Drawing.Point(138, 149);
            this.titleLabel.Name = "titleLabel";
            this.titleLabel.Size = new System.Drawing.Size(154, 22);
            this.titleLabel.TabIndex = 1;
            this.titleLabel.Text = "TO BA TO IUTTA";
            // 
            // hideTimer
            // 
            this.hideTimer.Interval = 7800;
            this.hideTimer.Tick += new System.EventHandler(this.hideTimer_Tick);
            // 
            // startTimer
            // 
            this.startTimer.Interval = 9000;
            this.startTimer.Tick += new System.EventHandler(this.startTimer_Tick);
            // 
            // SplashForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(430, 240);
            this.Controls.Add(this.titleLabel);
            this.Controls.Add(this.loadingImage);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "SplashForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SplashForm";
            ((System.ComponentModel.ISupportInitialize)(this.loadingImage)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox loadingImage;
        private System.Windows.Forms.Label titleLabel;
        private System.Windows.Forms.Timer hideTimer;
        private System.Windows.Forms.Timer startTimer;
    }
}
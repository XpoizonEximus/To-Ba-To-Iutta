
namespace To_Ba_To_Iutta
{
    partial class TextCryptForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(TextCryptForm));
            this.inputLabel = new System.Windows.Forms.Label();
            this.button = new System.Windows.Forms.Button();
            this.outputLabel = new System.Windows.Forms.Label();
            this.key = new System.Windows.Forms.TextBox();
            this.keyLabel = new System.Windows.Forms.Label();
            this.input = new System.Windows.Forms.TextBox();
            this.inputPanel = new System.Windows.Forms.Panel();
            this.outputPanel = new System.Windows.Forms.Panel();
            this.output = new System.Windows.Forms.TextBox();
            this.keyPanel = new System.Windows.Forms.Panel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.mainPanel.SuspendLayout();
            this.inputPanel.SuspendLayout();
            this.outputPanel.SuspendLayout();
            this.keyPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainPanel
            // 
            this.mainPanel.Controls.Add(this.panel1);
            this.mainPanel.Controls.Add(this.panel2);
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
            this.key.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
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
            this.key.Size = new System.Drawing.Size(509, 40);
            this.key.TabIndex = 5;
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
            this.input.Size = new System.Drawing.Size(682, 208);
            this.input.TabIndex = 0;
            // 
            // inputPanel
            // 
            this.inputPanel.Controls.Add(this.input);
            this.inputPanel.Location = new System.Drawing.Point(87, 12);
            this.inputPanel.Name = "inputPanel";
            this.inputPanel.Size = new System.Drawing.Size(694, 220);
            this.inputPanel.TabIndex = 7;
            // 
            // outputPanel
            // 
            this.outputPanel.Controls.Add(this.output);
            this.outputPanel.Location = new System.Drawing.Point(87, 298);
            this.outputPanel.Name = "outputPanel";
            this.outputPanel.Size = new System.Drawing.Size(694, 220);
            this.outputPanel.TabIndex = 8;
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
            this.output.Size = new System.Drawing.Size(682, 208);
            this.output.TabIndex = 0;
            this.output.TabStop = false;
            // 
            // keyPanel
            // 
            this.keyPanel.Controls.Add(this.key);
            this.keyPanel.Location = new System.Drawing.Point(87, 239);
            this.keyPanel.Name = "keyPanel";
            this.keyPanel.Size = new System.Drawing.Size(521, 52);
            this.keyPanel.TabIndex = 9;
            // 
            // panel1
            // 
            this.panel1.Location = new System.Drawing.Point(87, 239);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(200, 66);
            this.panel1.TabIndex = 10;
            this.panel1.Visible = false;
            // 
            // panel2
            // 
            this.panel2.Location = new System.Drawing.Point(87, 262);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(6, 81);
            this.panel2.TabIndex = 11;
            this.panel2.Visible = false;
            // 
            // TextCryptForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.ClientSize = new System.Drawing.Size(794, 530);
            this.Name = "TextCryptForm";
            this.mainPanel.ResumeLayout(false);
            this.mainPanel.PerformLayout();
            this.inputPanel.ResumeLayout(false);
            this.inputPanel.PerformLayout();
            this.outputPanel.ResumeLayout(false);
            this.outputPanel.PerformLayout();
            this.keyPanel.ResumeLayout(false);
            this.keyPanel.PerformLayout();
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
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
    }
}
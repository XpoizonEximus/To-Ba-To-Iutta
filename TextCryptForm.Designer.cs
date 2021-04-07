
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
            this.input = new System.Windows.Forms.TextBox();
            this.inputLabel = new System.Windows.Forms.Label();
            this.button = new System.Windows.Forms.Button();
            this.outputLabel = new System.Windows.Forms.Label();
            this.output = new System.Windows.Forms.Label();
            this.key = new System.Windows.Forms.TextBox();
            this.keyLabel = new System.Windows.Forms.Label();
            this.mainPanel.SuspendLayout();
            this.SuspendLayout();
            // 
            // mainPanel
            // 
            this.mainPanel.Controls.Add(this.keyLabel);
            this.mainPanel.Controls.Add(this.key);
            this.mainPanel.Controls.Add(this.output);
            this.mainPanel.Controls.Add(this.outputLabel);
            this.mainPanel.Controls.Add(this.button);
            this.mainPanel.Controls.Add(this.inputLabel);
            this.mainPanel.Controls.Add(this.input);
            // 
            // input
            // 
            this.input.AcceptsTab = true;
            this.input.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.input.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.input.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.input.Font = new System.Drawing.Font("Helvetica", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.input.ForeColor = System.Drawing.Color.White;
            this.input.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.input.Location = new System.Drawing.Point(87, 12);
            this.input.Multiline = true;
            this.input.Name = "input";
            this.input.Size = new System.Drawing.Size(694, 220);
            this.input.TabIndex = 0;
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
            this.button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.button.Font = new System.Drawing.Font("Helvetica", 13F);
            this.button.ForeColor = System.Drawing.Color.White;
            this.button.Image = ((System.Drawing.Image)(resources.GetObject("button.Image")));
            this.button.Location = new System.Drawing.Point(643, 239);
            this.button.Name = "button";
            this.button.Size = new System.Drawing.Size(138, 52);
            this.button.TabIndex = 2;
            this.button.Text = "Encrypt";
            this.button.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.button.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.button.UseVisualStyleBackColor = true;
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
            // output
            // 
            this.output.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.output.Font = new System.Drawing.Font("Helvetica", 13F);
            this.output.ForeColor = System.Drawing.Color.White;
            this.output.Location = new System.Drawing.Point(87, 298);
            this.output.Name = "output";
            this.output.Size = new System.Drawing.Size(694, 220);
            this.output.TabIndex = 4;
            // 
            // key
            // 
            this.key.AcceptsTab = true;
            this.key.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.key.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(1)))), ((int)(((byte)(39)))), ((int)(((byte)(74)))));
            this.key.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.key.Font = new System.Drawing.Font("Helvetica", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.key.ForeColor = System.Drawing.Color.White;
            this.key.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.key.Location = new System.Drawing.Point(87, 239);
            this.key.Multiline = true;
            this.key.Name = "key";
            this.key.Size = new System.Drawing.Size(549, 52);
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
            // TextCryptForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.ClientSize = new System.Drawing.Size(794, 530);
            this.Name = "TextCryptForm";
            this.mainPanel.ResumeLayout(false);
            this.mainPanel.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TextBox input;
        private System.Windows.Forms.Label inputLabel;
        private System.Windows.Forms.Button button;
        private System.Windows.Forms.Label outputLabel;
        private System.Windows.Forms.Label output;
        private System.Windows.Forms.Label keyLabel;
        private System.Windows.Forms.TextBox key;
    }
}
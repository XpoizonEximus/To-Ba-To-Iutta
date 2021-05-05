﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace To_Ba_To_Iutta
{
    public partial class SymmetricCryptForm : PanelForm, Crypt.ISwapProcedure
    {
        private Crypt.Procedure procedure;
        public SymmetricCryptForm(Crypt.Procedure proc = Crypt.Procedure.Encrypt)
        {
            InitializeComponent();
            Procedure = proc;
            Crypt.Actions.ControlRoundBorder(inputPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(outputPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(keyPanel, new Pen(Color.Silver, 1.0f));
            Crypt.Actions.ControlRoundBorder(button, new Pen(Color.White, 2f));
        }
        public Crypt.Procedure Procedure
        {
            get => procedure;
            set
            {
                procedure = value;
                if (value == Crypt.Procedure.Encrypt)
                {
                    this.button.Text = " " + "Encrypt";
                    this.button.Image = Crypt.Constants.EncryptButtonImage;
                }
                else
                {
                    this.button.Text = " " + "Decrypt";
                    this.button.Image = Crypt.Constants.DecryptButtonImage;
                }
            }
        }
        public void SwapProcedure() => Procedure = Procedure == Crypt.Procedure.Encrypt ? Crypt.Procedure.Decrypt : Crypt.Procedure.Encrypt;
        private void button_Click(object sender, EventArgs e)
        {
            try
            {
                if (String.IsNullOrWhiteSpace(key.Text)) return;
                byte[] inputb = (procedure == Crypt.Procedure.Encrypt ? Encoding.UTF8.GetBytes(input.Text) : Convert.FromBase64String(input.Text));
                byte[] keyb = Encoding.UTF8.GetBytes(key.Text);

                byte[] outputb = Crypt.Symmetric.PerformProcedure(Procedure, inputb, keyb);
                if (outputb != null) 
                    output.Text = (procedure == Crypt.Procedure.Encrypt ? Convert.ToBase64String(outputb) : Encoding.UTF8.GetString(outputb));
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
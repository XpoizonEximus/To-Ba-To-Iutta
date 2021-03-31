using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace To_Ba_To_Iutta
{
    public partial class SplashForm : Form
    {
        public SplashForm()
        {
            InitializeComponent();

            titleLabel.Parent = loadingImage;

            hideTimer.Start();
            startTimer.Start();
        }
        private void hideTimer_Tick(object sender, EventArgs e)
        {
            hideTimer.Stop();
            titleLabel.Hide();
        }

        private void startTimer_Tick(object sender, EventArgs e)
        {
            startTimer.Stop();
            this.Close();
        }
    }
}

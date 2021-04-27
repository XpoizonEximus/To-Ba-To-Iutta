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
    public partial class MainForm : Form
    {
        public Crypt.Procedure Procedure { get; set; }
        public Crypt.CryptoAlgorythm Algorythm { get; set; }
        public bool Chat { get; set; }


        public MainForm(bool splash = true)
        {
            if (splash) ShowSplashForm();
            InitializeComponent();
            Crypt.Actions.Initialize(this);
            RoundCorners();
            LoadMainPanel();

            titleLabel.Text = System.Reflection.Assembly.GetEntryAssembly().Location;
        }
        private void ShowSplashForm()
        {
            SplashForm f = new SplashForm();
            f.ShowDialog();
        }
        private void RoundCorners()
        {
            Rectangle Bounds = new Rectangle(0, 0, Width, Height);
            float CornerRadius = Crypt.Constants.FormBorderRadius;
            System.Drawing.Drawing2D.GraphicsPath path = new System.Drawing.Drawing2D.GraphicsPath();
            path.AddArc(Bounds.X, Bounds.Y, 2 * CornerRadius, 2 * CornerRadius, 180, 90);
            path.AddArc(Bounds.X + Bounds.Width - 2 * CornerRadius, Bounds.Y, 2 * CornerRadius, 2 * CornerRadius, 270, 90);
            path.AddArc(Bounds.X + Bounds.Width - 2 * CornerRadius, Bounds.Y + Bounds.Height - 2 * CornerRadius, 2 * CornerRadius, 2 * CornerRadius, 0, 90);
            path.AddArc(Bounds.X, Bounds.Y + Bounds.Height - 2 * CornerRadius, 2 * CornerRadius, 2 * CornerRadius, 90, 90);
            path.CloseAllFigures();

            this.Region = new Region(path);
        }
        #region Move Form Panel
        private bool logoPanelClicked = false;
        private Point logoPanelClickedStartPoint;
        private void movePanel_MouseDown(object sender, MouseEventArgs e)
        {
            logoPanelClicked = true;
            logoPanelClickedStartPoint = e.Location;
        }

        private void movePanel_MouseUp(object sender, MouseEventArgs e)
        {
            logoPanelClicked = false;
        }

        private void movePanel_MouseMove(object sender, MouseEventArgs e)
        {
            if(logoPanelClicked)
            {
                Point p = PointToScreen(e.Location);
                this.Location = new Point(p.X - logoPanelClickedStartPoint.X, p.Y - logoPanelClickedStartPoint.Y);
            }
        }
        #endregion
        private void LoadMainPanel()
        {
            mainPanel.SuspendLayout();
            this.mainPanel.Controls.Clear();
            this.mainPanel.Controls.AddRange(Crypt.Data.MainPanelForm.ControlsArray);
            mainPanel.ResumeLayout();
        }
        private void ChangeControls(Crypt.Procedure procedure, Crypt.CryptoAlgorythm algorythm, bool chat)
        {/*
            Procedure = procedure;
            Algorythm = algorythm;
            Chat = chat;
            Crypt.Actions.SetMainPanelForm(procedure, algorythm, chat);
            LoadMainPanel();*/
        }

        #region Minimize-Close Buttons
        private void closeFormHandler(object sender, EventArgs e) 
        {
            this.FormBorderStyle = FormBorderStyle.Sizable;
            this.Close(); 
        }
        private void minimizeFormHandler(object sender, EventArgs e) 
        {
            this.FormBorderStyle = FormBorderStyle.Sizable;
            this.WindowState = FormWindowState.Minimized;
            this.FormBorderStyle = FormBorderStyle.None;
        }
        #endregion

        private void symmetricButton_Click(object sender, EventArgs e) => ChangeControls(Procedure, Crypt.CryptoAlgorythm.Symmetric, false);
        private void asymmetricButton_Click(object sender, EventArgs e) => ChangeControls(Procedure, Crypt.CryptoAlgorythm.Asymmetric, false);
        private void encryptButton_Click(object sender, EventArgs e) => ChangeControls(Crypt.Procedure.Encrypt, Algorythm, false);
        private void decryptButton_Click(object sender, EventArgs e) => ChangeControls(Crypt.Procedure.Decrypt, Algorythm, false);
        private void chatButton_Click(object sender, EventArgs e) => ChangeControls(Procedure, Algorythm, true);
    }
}

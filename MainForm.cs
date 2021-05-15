using System;
using System.Diagnostics;
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
        public MainForm(bool splash = true)
        {
            if (splash) ShowSplashForm();
            InitializeComponent();
            Crypt.Actions.Settings.LoadSettings();
            RoundCorners();
            LoadMainPanel();
            SetButtonColors();

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

        #region Move Form
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
        private void SetButtonColors()
        {
            if(Crypt.Data.Chat)
            {
                symmetricButton.BackColor = Crypt.Constants.ColorThemeCollection[0].Primary;
                decryptButton.BackColor = Crypt.Constants.ColorThemeCollection[0].Primary;
                encryptButton.BackColor = Crypt.Constants.ColorThemeCollection[0].Primary;
                decryptButton.BackColor = Crypt.Constants.ColorThemeCollection[0].Primary;

                chatButton.BackColor = Crypt.Constants.ColorThemeCollection[0].PrimaryClicked;
            }
            else
            {
                chatButton.BackColor = Crypt.Constants.ColorThemeCollection[0].Primary;

                if(Crypt.Data.Procedure == Crypt.Procedure.Encrypt)
                {
                    encryptButton.BackColor = Crypt.Constants.ColorThemeCollection[0].PrimaryClicked;
                    decryptButton.BackColor = Crypt.Constants.ColorThemeCollection[0].Primary;
                }
                else
                {
                    encryptButton.BackColor = Crypt.Constants.ColorThemeCollection[0].Primary;
                    decryptButton.BackColor = Crypt.Constants.ColorThemeCollection[0].PrimaryClicked;
                }

                if(Crypt.Data.Algorythm == Crypt.CryptoAlgorythm.Symmetric)
                {
                    symmetricButton.BackColor = Crypt.Constants.ColorThemeCollection[0].PrimaryClicked;
                    asymmetricButton.BackColor = Crypt.Constants.ColorThemeCollection[0].Primary;
                }
                else
                {
                    symmetricButton.BackColor = Crypt.Constants.ColorThemeCollection[0].Primary;
                    asymmetricButton.BackColor = Crypt.Constants.ColorThemeCollection[0].PrimaryClicked;
                }
            }
        }
        private void ChangeControls(Crypt.Procedure procedure, Crypt.CryptoAlgorythm algorythm, bool chat)
        {
            Crypt.Data.Procedure = procedure;
            Crypt.Data.Algorythm = algorythm;
            Crypt.Data.Chat = chat;
            Crypt.Actions.SetMainPanelForm();
            LoadMainPanel();
            SetButtonColors();
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

        private void symmetricButton_Click(object sender, EventArgs e) => ChangeControls(Crypt.Data.Procedure, Crypt.CryptoAlgorythm.Symmetric, false);
        private void asymmetricButton_Click(object sender, EventArgs e) => ChangeControls(Crypt.Data.Procedure, Crypt.CryptoAlgorythm.Asymmetric, false);
        private void encryptButton_Click(object sender, EventArgs e) => ChangeControls(Crypt.Procedure.Encrypt, Crypt.Data.Algorythm, false);
        private void decryptButton_Click(object sender, EventArgs e) => ChangeControls(Crypt.Procedure.Decrypt, Crypt.Data.Algorythm, false);
        private void chatButton_Click(object sender, EventArgs e) => ChangeControls(Crypt.Data.Procedure, Crypt.Data.Algorythm, !Crypt.Data.Chat);

        private void settingsButton_Click(object sender, EventArgs e)
        {
            SettingsForm f = new SettingsForm();
            f.ShowDialog();
        }

        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Crypt.Actions.Settings.Save();
        }

        private void helpButton_Click(object sender, EventArgs e)
        {
            ProcessStartInfo pInfo = new ProcessStartInfo("https://github.com/XpoizonEximus/To-Ba-To-Iutta");
            Process.Start(pInfo);
        }

        private void symmetricButton_BackColorChanged(object sender, EventArgs e)
        {
            if (symmetricButton.BackColor == Crypt.Constants.ColorThemeCollection[0].PrimaryClicked)
                symmetricRedPanel.Visible = true;
            else
                symmetricRedPanel.Visible = false;
        }
        private void asymmetricButton_BackColorChanged(object sender, EventArgs e)
        {
            if (asymmetricButton.BackColor == Crypt.Constants.ColorThemeCollection[0].PrimaryClicked)
                asymmetricRedPanel.Visible = true;
            else
                asymmetricRedPanel.Visible = false;
        }
        private void encryptButton_BackColorChanged(object sender, EventArgs e)
        {
            if (encryptButton.BackColor == Crypt.Constants.ColorThemeCollection[0].PrimaryClicked)
                encryptRedPanel.Visible = true;
            else
                encryptRedPanel.Visible = false;
        }
        private void decryptButton_BackColorChanged(object sender, EventArgs e)
        {
            if (decryptButton.BackColor == Crypt.Constants.ColorThemeCollection[0].PrimaryClicked)
                decryptRedPanel.Visible = true;
            else
                decryptRedPanel.Visible = false;
        }
        private void chatButton_BackColorChanged(object sender, EventArgs e)
        {
            if (chatButton.BackColor == Crypt.Constants.ColorThemeCollection[0].PrimaryClicked)
                chatRedPanel.Visible = true;
            else
                chatRedPanel.Visible = false;
        }
    }
}

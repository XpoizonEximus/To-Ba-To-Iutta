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
    public partial class PanelForm : Form
    {
        public PanelForm()
        {
            InitializeComponent();
            this.mainPanel.BackColor = Crypt.Constants.ColorThemeCollection[0].Background;
        }
        public List<Control> ControlsList
        {
            get
            {
                List<Control> v = new List<Control>();
                foreach (Control c in mainPanel.Controls)
                    v.Add(c);
                return v;
            }
        }
        public Control[] ControlsArray { get { return ControlsList.ToArray(); } }
    }
}

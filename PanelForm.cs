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
        }
        public Panel ContainerPanel { get { return mainPanel; } }
    }
}

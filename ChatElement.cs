using System;
using System.Windows.Forms;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace To_Ba_To_Iutta
{
    public class ChatElement : Panel
    {
        public Crypt.ChatElementType Type { get; set; }

        private string Text { get; set; }
        private Label Label { get; set; }

        public ChatElement(string text, Crypt.ChatElementType type)
        {
            Text = text;
            Type = type;
            InitializeComponent();
        }
        private void InitializeComponent()
        {
            this.BackColor = (Type == Crypt.ChatElementType.Sender ? Crypt.Constants.ColorThemeCollection[0].ChatSender : Crypt.Constants.ColorThemeCollection[0].ChatReceiver);

            Label.Text = Text;
            //Label.Location = new System.Drawing.Point()

        }
    }
}

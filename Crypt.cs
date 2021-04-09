using System.Windows.Forms;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace To_Ba_To_Iutta
{
    public static class Crypt
    {
        #region Data Types
        public enum Procedure { encrypt = 0, decrypt = 1 }
        public interface ISwapProcedure
        {
            void SwapProcedure();
        }
        public class ColorTheme
        {
            public Color Primary;
            public Color Secondary;
            public Color Background;
            public Color TextBackground;
            public ColorTheme(Color primary, Color secondary, Color background, Color textbackground)
            {
                Primary = primary;
                Secondary = secondary;
                Background = background;
                TextBackground = textbackground;
            }
        }
        #endregion

        public static class Constants
        {
            public static readonly string DefaultFont = "Helvetica";

            public const float FormBorderRadius = 20;
            public const float PanelBorderRadius = 15;

            public static readonly Image EncryptButtonImage = Image.FromFile("C:\\Users\\xpoiz\\Documents\\Visual Studio 2019\\Projects\\C#\\To-Ba-To-Iutta\\res\\padlock-3-24.png");
            public static readonly Image DecryptButtonImage = Image.FromFile("C:\\Users\\xpoiz\\Documents\\Visual Studio 2019\\Projects\\C#\\To-Ba-To-Iutta\\res\\key-24.png");

            public static readonly ColorTheme[] ColorThemeCollection =
            {
                new ColorTheme
                (
                    Color.FromArgb(0, 17, 32),
                    Color.FromArgb(0, 22, 42),
                    Color.FromArgb(1, 39, 74),
                    Color.FromArgb(255, 255, 255)
                ),
                new ColorTheme
                (
                    Color.FromArgb(49, 40, 35),
                    Color.FromArgb(65, 57, 52),
                    Color.FromArgb(90, 82, 78),
                    Color.FromArgb(0, 0, 0)
                )
            };
        }

        public static class Actions
        {

            private class ControlRoundBorderComponent
            {
                private Control Control;
                private Pen pen;
                private float CornerRadius;
                public ControlRoundBorderComponent(Control pa, Pen pe, float rad = Crypt.Constants.PanelBorderRadius)
                {
                    Control = pa;
                    pen = pe;
                    CornerRadius = rad;
                }
                public void PanelRoundBorder_SetRegion()
                {
                    CornerRadius *= 2;
                    Rectangle Bounds = new Rectangle(0, 0, (int)(Control.Width + pen.Width), (int)(Control.Height + pen.Width));
                    System.Drawing.Drawing2D.GraphicsPath path = new System.Drawing.Drawing2D.GraphicsPath();
                    path.AddArc(Bounds.X, Bounds.Y, CornerRadius, CornerRadius, 180, 90);
                    path.AddArc(Bounds.X + Bounds.Width - CornerRadius, Bounds.Y, CornerRadius, CornerRadius, 270, 90);
                    path.AddArc(Bounds.X + Bounds.Width - CornerRadius, Bounds.Y + Bounds.Height - CornerRadius, CornerRadius, CornerRadius, 0, 90);
                    path.AddArc(Bounds.X, Bounds.Y + Bounds.Height - CornerRadius, CornerRadius, CornerRadius, 90, 90);
                    path.CloseAllFigures();
                    CornerRadius /= 2;

                    Control.Region = new Region(path);
                }
                public void PanelRoundBorder_PaintHandler(object sender, PaintEventArgs e)
                {
                    float i = pen.Width / 2;

                    e.Graphics.DrawLine(pen, i, i + CornerRadius, i, Control.Height - i - CornerRadius);
                    e.Graphics.DrawLine(pen, i + CornerRadius, i, Control.Width - i - CornerRadius, i);
                    e.Graphics.DrawLine(pen, Control.Width - i - CornerRadius, Control.Height - i, i + CornerRadius, Control.Height - i);
                    e.Graphics.DrawLine(pen, Control.Width - i, Control.Height - i - CornerRadius, Control.Width - i, i + CornerRadius);

                    e.Graphics.DrawArc(pen, i, i, 2 * CornerRadius, 2 * CornerRadius, 180, 90);
                    e.Graphics.DrawArc(pen, Control.Width - i - 2 * CornerRadius, i, 2 * CornerRadius, 2 * CornerRadius, 270, 90);
                    e.Graphics.DrawArc(pen, Control.Width - i - 2 * CornerRadius, Control.Height - i - 2 * CornerRadius, 2 * CornerRadius, 2 * CornerRadius, 0, 90);
                    e.Graphics.DrawArc(pen, i, Control.Height - i - 2 * CornerRadius, 2 * CornerRadius, 2 * CornerRadius, 90, 90);
                }
            }
            public static void ControlRoundBorder(Control Control, Pen pen, DashStyle dashstyle = DashStyle.Solid)
            {
                pen.DashStyle = dashstyle;
                ControlRoundBorderComponent c = new ControlRoundBorderComponent(Control, pen);
                c.PanelRoundBorder_SetRegion();
                Control.Paint += c.PanelRoundBorder_PaintHandler;
            }
        }

        public static class Data
        {
            public static PanelForm MainPanelForm { get; set; }
        }
    }
}

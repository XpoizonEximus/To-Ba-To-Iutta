using System.Windows.Forms;
using System.Drawing;
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

            public const int FormBorderRadius = 15;

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


        public static PanelForm MainPanelForm { get; set; }
    }
}

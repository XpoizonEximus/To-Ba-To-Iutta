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
        public static class Constants
        {
            public static readonly string DefaultFont = "Microsoft Sans Serif";

            public const int FormBorderRadius = 15;

            public static readonly ColorTheme[] ColorThemeCollection= 
            {
                new ColorTheme
                (
                    Color.FromArgb(0, 17, 32),
                    Color.FromArgb(0, 22, 42),
                    Color.FromArgb(1, 39, 74)
                ),
                new ColorTheme
                (
                    Color.FromArgb(49, 40, 35),
                    Color.FromArgb(65, 57, 52),
                    Color.FromArgb(90, 82, 78)
                )
            };
        }
    }
    public enum Procedure { encrypt, decrypt };
    public class ColorTheme
    {
        public Color Primary;
        public Color Secondary;
        public Color Background;
        public ColorTheme(Color primary, Color secondary, Color background)
        {
            Primary = primary;
            Secondary = secondary;
            Background = background;
        }
    }
}

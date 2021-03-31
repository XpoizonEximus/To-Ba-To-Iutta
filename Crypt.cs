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
        }
        public enum Procedure { encrypt, decrypt };
    }
}

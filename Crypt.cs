using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace To_Ba_To_Iutta
{
    public static class Crypt
    {
        public enum Procedure { encrypt, decrypt };

        public static Font TextboxFont(bool focused)
        {
            return new Font("Microsoft Sans Serif", (focused ? (11f) : (21f)));
        }
    }
}

using System;
using System.Drawing;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace To_ba_to_iutta
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

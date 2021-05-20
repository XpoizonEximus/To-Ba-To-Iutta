using System;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Text;
using System.IO;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace To_Ba_To_Iutta
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            if(InstallFonts())
                MessageBox.Show("Please restart the application.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
                Application.Run(new MainForm(false));
        }
        static bool InstallFonts()
        {
            bool k = InstallFont(Properties.Resources.Minecraftia, "Minecraftia");
            if ( k = k || InstallFont(Properties.Resources.Helvetica, "Helvetica"))
                InstallFont(Properties.Resources.Helvetica_Bold, "Helvetica_bold");
            return k;
        }
        static bool InstallFont(byte[] file, string name)
        {
            if (CheckForFont(name))
                return false;
            MessageBox.Show("You need to install the following font for the application to work properly.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);

            string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), $"{name}.ttf");
            using (FileStream s = new FileStream(path, FileMode.Create))
                s.Write(file, 0, file.Length);
            Process process = Process.Start(path);
            process.WaitForExit();
            return true;
        }
        static bool CheckForFont(string name)
        {
            InstalledFontCollection fontsCollection = new InstalledFontCollection();
            foreach (FontFamily fontFamily in fontsCollection.Families)
                if (fontFamily.Name == name)
                    return true;
            return false;
        }
    }
}

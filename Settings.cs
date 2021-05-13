using System.Windows.Forms;

namespace To_Ba_To_Iutta.Properties {
    
    
    // This class allows you to handle specific events on the settings class:
    //  The SettingChanging event is raised before a setting's value is changed.
    //  The PropertyChanged event is raised after a setting's value is changed.
    //  The SettingsLoaded event is raised after the setting values are loaded.
    //  The SettingsSaving event is raised before the setting values are saved.
    internal sealed partial class Settings {
        
        public Settings() {
            // // To add event handlers for saving and changing settings, uncomment the lines below:
            //
            // this.SettingChanging += this.SettingChangingEventHandler;
            //
            // this.SettingsSaving += this.SettingsSavingEventHandler;
            //
        }
        
        private void SettingChangingEventHandler(object sender, System.Configuration.SettingChangingEventArgs e) {
            // Add code to handle the SettingChangingEvent event here.
        }
        
        private void SettingsSavingEventHandler(object sender, System.ComponentModel.CancelEventArgs e) {
            // Add code to handle the SettingsSaving event here.
        }

        public new void Reset()
        {
            string privateString = this.PrivateKeyPairs;
            string publicString = this.PublicKeyPairs;
            base.Reset();
            this.PrivateKeyPairs = privateString;
            this.PublicKeyPairs = publicString;
        }
        public new void Save()
        {
            VerifyInputs();
            base.Save();
            Crypt.Actions.Settings.LoadSettings();
        }
        private void VerifyInputs()
        {
            if (VerifyInput(this.LastAsymmetricDecryptInput)) LastAsymmetricDecryptInput = "";
            if (VerifyInput(this.LastAsymmetricEncryptInput)) LastAsymmetricEncryptInput = "";
            if (VerifyInput(this.LastSymmetricDecryptInput )) LastSymmetricDecryptInput  = "";
            if (VerifyInput(this.LastSymmetricEncryptInput )) LastSymmetricEncryptInput  = "";
        }
        private bool VerifyInput(string input)
        {
            if (input.Length>5000)
                return true;
            return false;
        }
    }
}

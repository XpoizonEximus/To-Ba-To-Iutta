//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace To_Ba_To_Iutta.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "16.8.1.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("AES")]
        public string SymmetricAlgorythm {
            get {
                return ((string)(this["SymmetricAlgorythm"]));
            }
            set {
                this["SymmetricAlgorythm"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string SymmetricIV {
            get {
                return ((string)(this["SymmetricIV"]));
            }
            set {
                this["SymmetricIV"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("PKCS7")]
        public string SymmetricPadding {
            get {
                return ((string)(this["SymmetricPadding"]));
            }
            set {
                this["SymmetricPadding"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("CBC")]
        public string SymmetricMode {
            get {
                return ((string)(this["SymmetricMode"]));
            }
            set {
                this["SymmetricMode"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("RSA")]
        public string AsymmetricAlgorythm {
            get {
                return ((string)(this["AsymmetricAlgorythm"]));
            }
            set {
                this["AsymmetricAlgorythm"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string PrivateKeyPairs {
            get {
                return ((string)(this["PrivateKeyPairs"]));
            }
            set {
                this["PrivateKeyPairs"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string PublicKeyPairs {
            get {
                return ((string)(this["PublicKeyPairs"]));
            }
            set {
                this["PublicKeyPairs"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("True")]
        public bool LastEncrypt {
            get {
                return ((bool)(this["LastEncrypt"]));
            }
            set {
                this["LastEncrypt"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("True")]
        public bool LastSymmetric {
            get {
                return ((bool)(this["LastSymmetric"]));
            }
            set {
                this["LastSymmetric"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("False")]
        public bool LastChat {
            get {
                return ((bool)(this["LastChat"]));
            }
            set {
                this["LastChat"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string LastSymmetricEncryptInput {
            get {
                return ((string)(this["LastSymmetricEncryptInput"]));
            }
            set {
                this["LastSymmetricEncryptInput"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string LastAsymmetricEncryptInput {
            get {
                return ((string)(this["LastAsymmetricEncryptInput"]));
            }
            set {
                this["LastAsymmetricEncryptInput"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string LastSymmetricDecryptInput {
            get {
                return ((string)(this["LastSymmetricDecryptInput"]));
            }
            set {
                this["LastSymmetricDecryptInput"] = value;
            }
        }
        
        [global::System.Configuration.UserScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.DefaultSettingValueAttribute("")]
        public string LastAsymmetricDecryptInput {
            get {
                return ((string)(this["LastAsymmetricDecryptInput"]));
            }
            set {
                this["LastAsymmetricDecryptInput"] = value;
            }
        }
    }
}

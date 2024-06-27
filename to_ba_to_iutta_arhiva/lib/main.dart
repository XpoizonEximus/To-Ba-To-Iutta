import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/view/pages/transform/asymmetric_decrypt_page.dart';
import 'package:to_ba_to_iutta/view/pages/transform/asymmetric_encrypt_page.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;
import 'package:to_ba_to_iutta/view/pages/home_page/index.dart';
import 'package:to_ba_to_iutta/view/pages/settings_page.dart';
import 'package:to_ba_to_iutta/view/pages/transform/symmetric_decrypt_page.dart';
import 'package:to_ba_to_iutta/view/pages/transform/symmetric_encrypt_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Ba To Iutta',
      theme: ThemeData.from(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.indigo, brightness: Brightness.dark
              // brightness: MediaQuery.platformBrightnessOf(context)
              ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontFamily: 'Minecraftia'),
          )).copyWith(
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)))),
      ),
      home: const PagesManager(),
    );
  }
}

class PagesManager extends StatefulWidget {
  const PagesManager({super.key});

  @override
  State<PagesManager> createState() => _PagesManagerState();
}

class _PagesManagerState extends State<PagesManager> {
  static final List<local.Page> _pages = [
    const SymmetricEncryptPage(),
    const SymmetricDecryptPage(),
    const AsymmetricEncryptPage(),
    const AsymmetricDecryptPage(),
    const SettingsPage()
  ];

  int? _selectedIndex;
  local.Page get _currentPage {
    return _selectedIndex == null ||
            _selectedIndex! < 0 ||
            _selectedIndex! >= _pages.length
        ? HomePage(
            selectSymmetricEncryption: () => _selectPage(0),
            selectSymmetricDecryption: () => _selectPage(1),
            selectAsymmetricEncryption: () => _selectPage(2),
            selectAsymmetricDecryption: () => _selectPage(3))
        : _pages[_selectedIndex!];
  }

  void _selectPage(int? index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const tilesIndent = 16.0;

    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // elevation: 0,
          // foregroundColor: theme.colorScheme.onPrimary,
          // title: Text(_currentPage.title),
        ),
        body: _currentPage,
        drawer: Drawer(
          child: Theme(
            data: theme.copyWith(dividerColor: Colors.transparent),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: theme.colorScheme.primary),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("TO BA\nTO IUTTA",
                        style: theme.textTheme.displayLarge!.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontSize: theme.textTheme.displayMedium!.fontSize)),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 16.0 + tilesIndent, right: 16.0),
                  title: const Text('Home'),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    _selectPage(null);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(
                      left: 16.0 + tilesIndent, right: 16.0),
                  title: const Text('Settings'),
                  leading: const Icon(Icons.settings),
                  onTap: () {
                    _selectPage(4);
                    Navigator.pop(context);
                  },
                ),
                ExpansionTile(
                  title: const Text('Symmetric cryptography'),
                  subtitle: const Text('Single private key'),
                  initiallyExpanded: true,
                  children: <Widget>[
                    ListTile(
                      contentPadding: const EdgeInsets.only(
                          left: 16.0 + tilesIndent, right: 16.0),
                      title: const Text('Encrypt'),
                      leading: const Icon(Icons.lock),
                      onTap: () {
                        _selectPage(0);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.only(
                          left: 16.0 + tilesIndent, right: 16.0),
                      title: const Text('Decrypt'),
                      leading: const Icon(Icons.lock_open),
                      onTap: () {
                        _selectPage(1);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Asymmetric cryptography'),
                  subtitle: const Text('Distinct private and public keys'),
                  initiallyExpanded: true,
                  children: <Widget>[
                    ListTile(
                      contentPadding: const EdgeInsets.only(
                          left: 16.0 + tilesIndent, right: 16.0),
                      title: const Text('Encrypt'),
                      leading: const Icon(Icons.lock),
                      onTap: () {
                        _selectPage(2);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.only(
                          left: 16.0 + tilesIndent, right: 16.0),
                      title: const Text('Decrypt'),
                      leading: const Icon(Icons.lock_open),
                      onTap: () {
                        _selectPage(3);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

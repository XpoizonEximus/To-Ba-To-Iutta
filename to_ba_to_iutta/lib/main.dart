import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/view/asymmetric_decrypt_page.dart';
import 'package:to_ba_to_iutta/view/asymmetric_encrypt_page.dart';
import 'package:to_ba_to_iutta/view/generic_page.dart';
import 'package:to_ba_to_iutta/view/home_page.dart';
import 'package:to_ba_to_iutta/view/symmetric_decrypt_page.dart';
import 'package:to_ba_to_iutta/view/symmetric_encrypt_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Ba To Iutta',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  int? _selectedIndex;

  static final List<GenericPage> _pages = [
    const SymmetricEncryptPage(),
    const SymmetricDecryptPage(),
    const AsymmetricEncryptPage(),
    const AsymmetricDecryptPage()
  ];

  BuildContext? _currentContext;

  void _onDrawerItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_currentContext != null) Navigator.pop(_currentContext!);
  }

  @override
  Widget build(BuildContext context) {
    _currentContext = context;

    final theme = Theme.of(context);
    const tilesIndent = 16.0;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.inversePrimary,
          title: const Text("ffd"),
        ),
        body: _selectedIndex == null ||
                _selectedIndex! < 0 ||
                _selectedIndex! >= _pages.length
            ? const HomePage()
            : _pages[_selectedIndex!],
        drawer: Drawer(
          child: Theme(
            data: theme.copyWith(dividerColor: Colors.transparent),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: theme.colorScheme.primary),
                  child: Text("TO BA\nTO IUTTA",
                      style: TextStyle(
                          fontFamily: 'Minecraftia',
                          fontSize: 40,
                          color: theme.colorScheme.onPrimary)),
                ),
                ExpansionTile(
                  title: const Text('Symmetric cryptography'),
                  subtitle: const Text('Single private key'),
                  initiallyExpanded: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: tilesIndent),
                      child: ListTile(
                        title: const Text('Encrypt'),
                        leading: const Icon(Icons.lock),
                        onTap: () {
                          _onDrawerItemTapped(0);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: tilesIndent),
                      child: ListTile(
                        title: const Text('Decrypt'),
                        leading: const Icon(Icons.lock_open),
                        onTap: () {
                          _onDrawerItemTapped(1);
                        },
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Asymmetric cryptography'),
                  subtitle: const Text('Distinct private and public keys'),
                  initiallyExpanded: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: tilesIndent),
                      child: ListTile(
                        title: const Text('Encrypt'),
                        leading: const Icon(Icons.lock),
                        onTap: () {
                          _onDrawerItemTapped(2);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: tilesIndent),
                      child: ListTile(
                        title: const Text('Decrypt'),
                        leading: const Icon(Icons.lock_open),
                        onTap: () {
                          _onDrawerItemTapped(3);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

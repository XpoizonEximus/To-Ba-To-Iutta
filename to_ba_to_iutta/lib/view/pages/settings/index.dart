import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:to_ba_to_iutta/cryptography/asymmetric/index.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/cryptography/kdf/index.dart';
import 'package:to_ba_to_iutta/persistent/provider/asymmetric.dart';
import 'package:to_ba_to_iutta/persistent/provider/symmetric.dart';
import 'package:to_ba_to_iutta/service/algorithm/asymmetric.dart';
import 'package:to_ba_to_iutta/service/algorithm/symmetric.dart';
import "../page.dart" as local;

class SettingsPage extends local.Page {
  const SettingsPage({super.key}) : super(title: "Settings");

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _cipherKey = CipherDataInteractorKey();
  final _kdfKey = KdfDataInteractorKey();
  final _asymmetricKey = AsymmetricCipherDataInteractorKey();
  final _asymmetricHelperKey = CipherDataInteractorKey();

  final _symmetricProvider = SymmetricAlgorithmProvider();
  final _asymmetricProvider = AsymmetricAlgorithmProvider();

  CipherData _initialCipher = CipherData.defaults;
  KdfData _initialKdf = KdfData.defaults;
  AsymmetricCipherData _initialAsymmetric = AsymmetricCipherData.defaults;
  CipherData _initialAsymmetricHelper = CipherData.defaults;

  @override
  void initState() {
    super.initState();
    _retrieveSettings();
  }

  Future _retrieveSettings() async {
    setState(() {
      _loading = true;
    });

    final symmetric = await _symmetricProvider.algorithm;
    setState(() {
      _initialCipher = symmetric.cipher.data;
      _initialKdf = symmetric.kdf.data;
    });
    final asymmetric = await _asymmetricProvider.algorithm;
    setState(() {
      _initialAsymmetric = asymmetric.asymmetric.data;
      _initialAsymmetricHelper = asymmetric.symmetric.data;
    });

    setState(() {
      _loading = false;
    });
  }

  bool _loading = false;
  bool _doNotDisplaySuccess = true;

  Future _save(BuildContext context) async {
    setState(() {
      _loading = true;
    });

    try {
      await _symmetricProvider.setAlgorithm(SymmetricAlgorithm(
          (_cipherKey.currentState?.current ?? _initialCipher).newMean,
          (_kdfKey.currentState?.current ?? _initialKdf).newMean));
      await _asymmetricProvider.setAlgorithm(AsymmetricAlgorithm(
          (_asymmetricKey.currentState?.current ?? _initialAsymmetric).newMean,
          (_asymmetricHelperKey.currentState?.current ??
                  _initialAsymmetricHelper)
              .newMean));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }

    await _retrieveSettings();

    setState(() {
      _loading = false;
      _doNotDisplaySuccess = false;
    });
  }

  bool _pageSymmetric = true;

  bool get pageSymmetric => _pageSymmetric;
  set pageSymmetric(bool value) {
    setState(() {
      _pageSymmetric = value;
    });
  }

  Future<bool> showDiscardWarningDialog(BuildContext context) async =>
      (await showDialog<bool>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text("Warning"),
                    content:
                        const Text("This action will discard all changes."),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("Continue")),
                      TextButton(
                          style: Theme.of(context)
                              .textButtonTheme
                              .style
                              ?.copyWith(
                                  foregroundColor: MaterialStateProperty.all(
                                      Theme.of(context).colorScheme.error)),
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("Cancel"))
                    ],
                  )) ??
          false);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title,
                                style: theme.textTheme.displayMedium),
                            Text(
                                "Modify you preferences related to algorithms used for encryption.",
                                style: theme.textTheme.bodyLarge),
                            const SizedBox(height: 16.0),
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                SizedBox(
                                  height: 56,
                                  child: ElevatedButton.icon(
                                      onPressed: () => _save(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            theme.colorScheme.primary,
                                        foregroundColor:
                                            theme.colorScheme.onPrimary,
                                      ),
                                      label: const Text("Save settings"),
                                      icon: const Icon(Symbols.save, fill: 1)),
                                ),
                                // SizedBox(
                                //     height: 56,
                                //     child: TextButton.icon(
                                //         onPressed: () async {
                                //           if (await _showDiscardWarningDialog(
                                //               context)) {
                                //             setState(() {
                                //               _kdfKey.currentState?.initial =
                                //                   KdfData.defaults;
                                //               _cipherKey.currentState?.initial =
                                //                   CipherData.defaults;
                                //               _asymmetricKey
                                //                       .currentState?.initial =
                                //                   AsymmetricCipherData.defaults;
                                //               _asymmetricHelperKey
                                //                       .currentState?.initial =
                                //                   CipherData.defaults;
                                //             });
                                //           }
                                //         },
                                //         icon: const Icon(Symbols.refresh,
                                //             fill: 1),
                                //         label: const Text("Load defaults"))),
                                // SizedBox(
                                //     height: 56,
                                //     child: TextButton.icon(
                                //         onPressed: () async {
                                //           if (await _showDiscardWarningDialog(
                                //               context)) {
                                //             await _retrieveSettings();
                                //           }
                                //         },
                                //         icon: const Icon(
                                //             Symbols.do_not_disturb_on),
                                //         label: const Text("Discard changes"))),
                                (_loading
                                    ? const CircularProgressIndicator()
                                    : const SizedBox.shrink()),
                                (!_loading && !_doNotDisplaySuccess
                                    ? Text("Settings saved succesfully",
                                        style: theme.textTheme.labelMedium!
                                            .copyWith(
                                                color: Colors.lightGreenAccent))
                                    : const SizedBox.shrink()),
                                const Row(children: [])
                              ],
                            )
                          ],
                        ))),
                (pageSymmetric
                    ? (Column(
                        children: [
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CipherDataInteractor(
                                initial: _initialCipher, key: _cipherKey),
                          )),
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: KdfDataInteractor(
                                initial: _initialKdf, key: _kdfKey),
                          ))
                        ],
                      ))
                    : (Column(
                        children: [
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AsymmetricCipherDataInteractor(
                                initial: _initialAsymmetric,
                                key: _asymmetricKey),
                          )),
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CipherDataInteractor(
                                initial: _initialAsymmetricHelper,
                                key: _asymmetricHelperKey),
                          ))
                        ],
                      )))
              ],
            ),
          ),
        ),
        NavigationBar(
            onDestinationSelected: (int index) {
              pageSymmetric = index == 0;
            },
            indicatorColor: theme.primaryColor,
            selectedIndex: pageSymmetric ? 0 : 1,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.lock), label: "Symmetric"),
              NavigationDestination(
                  icon: Icon(Icons.lock_open), label: "Asymmetric"),
            ])
      ],
    );
  }
}

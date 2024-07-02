import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:to_ba_to_iutta/view/pages/key_manager/dialog.dart';

class NameKeyPair {
  final String first;
  final String? second;

  NameKeyPair(this.first, this.second);
}

class KeysManager extends StatefulWidget {
  const KeysManager(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.newKey,
      required this.values,
      required this.deleteKey,
      required this.getPublicKey});

  final Future<String> Function(String)? getPublicKey;

  final String title;
  final String subtitle;
  final Future Function(String name, String? value) newKey;
  final Future<bool> Function(String) deleteKey;
  final Future<Iterable<String>> Function() values;

  @override
  State<KeysManager> createState() => _KeysManagerState();
}

class _KeysManagerState extends State<KeysManager> {
  Iterable<String> _values = [];
  String? _current;

  @override
  void initState() {
    super.initState();
    _retrieveValues();
  }

  bool loading = false;

  Future _retrieveValues() async {
    setState(() {
      loading = true;
    });
    final v = await widget.values();
    setState(() {
      _values = v;
      _current = null;
      loading = false;
    });
  }

  NewKeyDialog? _newKeyDialog;
  GlobalKey<NewKeyDialogState>? _newKeyDialogKey;

  Future<NameKeyPair?> _getNewKey(BuildContext context) =>
      showDialog<NameKeyPair>(
          context: context,
          builder: (context) {
            _newKeyDialogKey = GlobalKey<NewKeyDialogState>();
            _newKeyDialog = NewKeyDialog(
                requiresKey: widget.getPublicKey == null,
                key: _newKeyDialogKey);

            return AlertDialog(
              title: const Text("New key"),
              content: _newKeyDialog,
              actions: [
                TextButton(
                    style: Theme.of(context).textButtonTheme.style?.copyWith(
                        foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.error)),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(NameKeyPair(
                        _newKeyDialogKey!.currentState!.nameController.text,
                        widget.getPublicKey == null
                            ? _newKeyDialogKey!.currentState!.keyController.text
                            : null)),
                    child: const Text("Save")),
              ],
            );
          });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: theme.textTheme.headlineMedium),
          Text(widget.subtitle, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8.0),
          Wrap(spacing: 8.0, runSpacing: 8.0, children: [
            SizedBox(
              height: 56,
              child: ElevatedButton.icon(
                  onPressed: () async {
                    final pair = await _getNewKey(context);
                    if (pair == null) return;
                    if (_values.contains(pair.first)) {
                      throw ArgumentError("Key ${pair.first} already exists");
                    }
                    await widget.newKey(pair.first, pair.second);
                    await _retrieveValues();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                  ),
                  label: const Text("New"),
                  icon: const Icon(Symbols.add, fill: 1)),
            ),
            (widget.getPublicKey != null
                ? SizedBox(
                    height: 56,
                    child: TextButton.icon(
                        onPressed: _current == null
                            ? null
                            : () async {
                                final publicKey =
                                    await widget.getPublicKey!(_current!);

                                return await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: const Text("Public key"),
                                          content: TextField(
                                            controller: TextEditingController(
                                                text: publicKey),
                                            readOnly: true,
                                            maxLines: null,
                                            keyboardType:
                                                TextInputType.multiline,
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed:
                                                    Navigator.of(context).pop,
                                                child: const Text("Done"))
                                          ],
                                        ));
                              },
                        icon: const Icon(Symbols.upload),
                        label: const Text("Extract public key")))
                : const SizedBox.shrink()),
            SizedBox(
                height: 56,
                child: TextButton.icon(
                    style: theme.textButtonTheme.style?.copyWith(
                        foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => states.contains(MaterialState.disabled)
                                ? null
                                : theme.colorScheme.error)),
                    onPressed: _current == null
                        ? null
                        : () async {
                            await widget.deleteKey(_current!);
                            await _retrieveValues();
                          },
                    icon: const Icon(Symbols.delete),
                    label: const Text("Delete"))),
            (loading
                ? const CircularProgressIndicator()
                : const SizedBox.shrink()),
            const Row(children: [])
          ]),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _values.isEmpty
                  ? [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 8.0, bottom: 8.0),
                        child: Text(
                          "No keys to display. Add a new key by pressing New.",
                          style: theme.textTheme.bodySmall!
                              .copyWith(color: theme.disabledColor),
                        ),
                      )
                    ]
                  : _values
                      .map((e) => RadioListTile<String>(
                          title: Text(e),
                          value: e,
                          groupValue: _current,
                          onChanged: (value) => setState(() {
                                _current = value;
                              })))
                      .toList())
        ],
      ),
    ));
  }
}

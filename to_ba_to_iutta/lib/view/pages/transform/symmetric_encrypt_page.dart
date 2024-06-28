import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:to_ba_to_iutta/service/index/symmetric/encrypt.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;

class SymmetricEncryptPage extends local.Page {
  const SymmetricEncryptPage({super.key})
      : super(title: 'Symmetric Encryption');

  @override
  State<StatefulWidget> createState() => _SymmetricEncryptPageState();
}

class _SymmetricEncryptPageState extends State<SymmetricEncryptPage> {
  @override
  void dispose() {
    service.dispose();
    super.dispose();
  }

  final service = SymmetricEncryptService();

  void onSubmit() async {
    await service.serve(() => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: theme.textTheme.displayMedium),
                Text(
                    "Encrypt your data using a key. The cipher generated can be decrypted using the same key.",
                    style: theme.textTheme.bodyLarge),
              ],
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: service.inputController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Type something to encrypt",
                      labelText: "Input text",
                      // prefixIcon: Icon(Icons.input_rounded),
                      helperText:
                          "*Type your message here or select a file to upload",
                      // filled: true
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.file_upload, fill: 1),
                            label: const Text("Encrypt a file")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: (screenSize.width > 400
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: TextField(
                          controller: service.keyManager.keyController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter your encryption key",
                              labelText: "Key",
                              helperText: "*Encryption key"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        )),
                        const SizedBox(width: 16.0),
                        SizedBox(
                          height: 56,
                          child: ElevatedButton.icon(
                              onPressed: onSubmit,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.primary,
                                  foregroundColor: theme.colorScheme.onPrimary,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0)),
                              label: const Text("Encrypt"),
                              icon: const Icon(Symbols.lock, fill: 1)),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                          TextField(
                            controller: service.keyManager.keyController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter your encryption key",
                                labelText: "Key",
                                helperText: "*Encryption key"),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                          const SizedBox(height: 16.0),
                          SizedBox(
                            height: 56,
                            child: ElevatedButton.icon(
                                onPressed: onSubmit,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: theme.colorScheme.primary,
                                    foregroundColor:
                                        theme.colorScheme.onPrimary,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32.0)),
                                label: const Text("Encrypt"),
                                icon: const Icon(Symbols.lock, fill: 1)),
                          )
                        ])),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: service.outputController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Output",
                      helperText:
                          "*This is the cipher representing your encrypted data",
                    ),
                    readOnly: true,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.file_download, fill: 1),
                            label: const Text("Save cipher to a file")),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

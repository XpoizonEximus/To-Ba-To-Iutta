import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:to_ba_to_iutta/service/symmetric_decrypt_service.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;

class AsymmetricDecryptPage extends local.Page {
  const AsymmetricDecryptPage({super.key})
      : super(title: 'Asymmetric Decryption');

  @override
  State<StatefulWidget> createState() => _SymmetricEncryptPageState();
}

class _SymmetricEncryptPageState extends State<AsymmetricDecryptPage> {
  final inputController = TextEditingController();
  final keyController = TextEditingController();
  final outputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    keyController.dispose();

    super.dispose();
  }

  final service = SymmetricDecryptService();

  void onSubmit() async {
    service.key = keyController.text;
    await service.processText(inputController.text);
    final (text, _) = await service.getResultText();
    outputController.text = text;
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
                    "Decrypt your symmetricaly encrypted cipher. You need to use the same key used for encryption.",
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
                    controller: inputController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Type your cipher to decrypt",
                      labelText: "Input cipher",
                      // prefixIcon: Icon(Icons.input_rounded),
                      helperText:
                          "*Type your cipher here or select a cipher file to upload",
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
                            label: const Text("Decrypt a file")),
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
                          controller: keyController,
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
                              label: const Text("Decrypt"),
                              icon: const Icon(Symbols.lock_open, fill: 1)),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                          TextField(
                            controller: keyController,
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
                                label: const Text("Decrypt"),
                                icon: const Icon(Symbols.lock_open, fill: 1)),
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
                    controller: outputController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Output",
                      helperText: "*This is the decpripted cipher",
                    ),
                    readOnly: true,
                    enableInteractiveSelection: false,
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
                            label: const Text("Save output to a file")),
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

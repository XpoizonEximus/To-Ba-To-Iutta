import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:to_ba_to_iutta/service/index/index.dart';

abstract class Page extends StatefulWidget {
  const Page({required this.title, super.key});
  final String title;

  Future<bool> showAutomaticDownloadDialog(BuildContext context) async {
    final result = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text("Download file"),
              content: const Text(
                  "The input you provided appears to be quite large. It is recommended to save the output directly to an encrypted file to avoid application crash."),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("Save")),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("Display")),
                TextButton(
                    style: Theme.of(context).textButtonTheme.style?.copyWith(
                        foregroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.error)),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel")),
              ],
            ));
    if (result != null) return result;
    throw Exception("Operation cancelled by user");
  }
}

abstract class PageState<T extends Page> extends State<T> {
  abstract final Service service;

  @override
  void dispose() {
    service.dispose();
    super.dispose();
  }

  bool isWorking = false;
  bool isDownloading = false;

  bool get isInputFileChosen => service.inputFilePath != null;

  void onSubmit(BuildContext context) {
    setState(() {
      isWorking = true;
    });
    service
        .serve(() => widget.showAutomaticDownloadDialog(context))
        .onError((error, stackTrace) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString()))))
        .whenComplete(() => setState(() {
              isWorking = false;
            }));
  }

  String get headerSubtitle;

  String? get inputHintText;
  String? get inputLabelText;
  String? get inputHelperText;
  String get inputFileButtonText;

  String? get outputHintText;
  String? get outputLabelText;
  String? get outputHelperText;
  String get outputFileButtonText;

  String get mainButtonText;
  IconData get mainButtonIcon;

  Widget buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: theme.textTheme.displayMedium),
          Text(headerSubtitle, style: theme.textTheme.bodyLarge),
          const Row(children: [])
        ],
      ),
    );
  }

  Widget buildInputFileButton(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton.icon(
              onPressed: () async {
                if (isInputFileChosen) {
                  setState(() {
                    service.revokeInputFile();
                    service.inputController.text = "";
                  });
                } else {
                  if (await service.chooseInputFile()) {
                    setState(() {
                      service.inputController.text =
                          "File: ${service.inputFilePath!}";
                    });
                  }
                }
              },
              icon: Icon(isInputFileChosen ? Symbols.close : Icons.file_upload,
                  fill: 1),
              label: Text(
                  isInputFileChosen ? "Revoke file" : inputFileButtonText)),
        ],
      ),
    );
  }

  Widget buildInputCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildInputFileButton(context),
            const SizedBox(height: 16),
            TextField(
              controller: service.inputController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: inputHintText,
                labelText: inputLabelText,
                // prefixIcon: Icon(Icons.input_rounded),
                helperText: "*$inputHelperText",
                // filled: true
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              readOnly: isInputFileChosen,
            ),
            const SizedBox(height: 16),
            buildInputFileButton(context)
          ],
        ),
      ),
    );
  }

  Widget buildMainButton(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 56,
      child: ElevatedButton.icon(
          onPressed: () => onSubmit(context),
          style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 32.0)),
          label: Text(mainButtonText),
          icon: Icon(mainButtonIcon, fill: 1)),
    );
  }

  Widget buildWorkingSpinner(BuildContext context) {
    return isWorking
        ? const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircularProgressIndicator())
        : const SizedBox.shrink();
  }

  Widget buildKeyInput(BuildContext context);

  Widget buildKeyCard(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (screenSize.width > 400
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: buildKeyInput(context)),
                  const SizedBox(width: 16.0),
                  buildWorkingSpinner(context),
                  buildMainButton(context)
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    buildKeyInput(context),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        buildWorkingSpinner(context),
                        Expanded(child: buildMainButton(context))
                      ],
                    )
                  ])),
      ),
    );
  }

  Widget buildOutputFileButton(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton.icon(
              onPressed: () async {
                setState(() {
                  isDownloading = true;
                });
                if (await service.downloadOutput() == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Download cancelled")));
                }
                setState(() {
                  isDownloading = false;
                });
              },
              icon: const Icon(Icons.file_download, fill: 1),
              label: Text(outputFileButtonText)),
        ],
      ),
    );
  }

  Widget buildDownloadingSpinner(BuildContext context) {
    return isDownloading
        ? const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: CircularProgressIndicator())
        : const SizedBox.shrink();
  }

  Widget buildOutputCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(children: [
              buildOutputFileButton(context),
              buildDownloadingSpinner(context)
            ]),
            const SizedBox(height: 16),
            TextField(
              controller: service.outputController,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: outputLabelText,
                  helperText: "*$outputHelperText",
                  hintText: outputHintText),
              readOnly: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            const SizedBox(height: 16),
            Row(children: [
              buildOutputFileButton(context),
              buildDownloadingSpinner(context)
            ])
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildHeader(context),
          buildInputCard(context),
          buildKeyCard(context),
          buildOutputCard(context),
        ],
      ),
    );
  }
}

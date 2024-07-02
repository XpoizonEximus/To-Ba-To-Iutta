import 'package:flutter/material.dart';

class NewKeyDialog extends StatefulWidget {
  const NewKeyDialog({super.key, required this.requiresKey});

  final bool requiresKey;
  @override
  State<NewKeyDialog> createState() => NewKeyDialogState();
}

class NewKeyDialogState extends State<NewKeyDialog> {
  final nameController = TextEditingController();
  final keyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Name"),
          TextField(controller: nameController),
          (widget.requiresKey
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      const SizedBox(height: 16.0),
                      const Text("Key"),
                      TextField(
                          controller: keyController,
                          maxLines: null,
                          keyboardType: TextInputType.multiline)
                    ])
              : const SizedBox.shrink())
        ]);
  }
}

import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/view/generic_page.dart';

class SymmetricDecryptPage extends GenericPage {
  const SymmetricDecryptPage({super.key})
      : super(title: 'Symmetric Decryption');

  @override
  State<StatefulWidget> createState() => _SymmetricDecryptPageState();
}

class _SymmetricDecryptPageState extends State<SymmetricDecryptPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Symmetric Decrypt");
  }
}

import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/view/generic_page.dart';

class SymmetricEncryptPage extends GenericPage {
  const SymmetricEncryptPage({super.key})
      : super(title: 'Symmetric Encryption');

  @override
  State<StatefulWidget> createState() => _SymmetricEncryptPageState();
}

class _SymmetricEncryptPageState extends State<SymmetricEncryptPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Symmetric Encrypt");
  }
}

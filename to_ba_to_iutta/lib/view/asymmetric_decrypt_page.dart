import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/view/generic_page.dart';

class AsymmetricDecryptPage extends GenericPage {
  const AsymmetricDecryptPage({super.key})
      : super(title: 'Asymmetric Decryption');

  @override
  State<StatefulWidget> createState() => _AsymmetricDecryptPageState();
}

class _AsymmetricDecryptPageState extends State<AsymmetricDecryptPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Asymmetric Decrypt");
  }
}

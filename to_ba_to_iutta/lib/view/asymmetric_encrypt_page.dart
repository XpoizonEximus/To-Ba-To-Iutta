import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/view/generic_page.dart';

class AsymmetricEncryptPage extends GenericPage {
  const AsymmetricEncryptPage({super.key})
      : super(title: 'Asymmetric Encryption');

  @override
  State<StatefulWidget> createState() => _AsymmetricEncryptPageState();
}

class _AsymmetricEncryptPageState extends State<AsymmetricEncryptPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Asymmetric Encrypt");
  }
}

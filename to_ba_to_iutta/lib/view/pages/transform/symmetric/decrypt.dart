import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/service/index/symmetric/decrypt.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;
import 'package:to_ba_to_iutta/view/pages/transform/decrypt.dart';
import 'package:to_ba_to_iutta/view/pages/transform/symmetric/index.dart';

class SymmetricDecryptPage extends local.Page {
  const SymmetricDecryptPage({super.key})
      : super(title: 'Symmetric Decryption');

  @override
  State<StatefulWidget> createState() => SymmetricDecryptPageState();
}

class SymmetricDecryptPageState extends SymmetricPageState<SymmetricDecryptPage>
    with DecryptPageState {
  @override
  final SymmetricDecryptService service = SymmetricDecryptService();

  @override
  final headerSubtitle =
      "Decrypt your symmetricaly encrypted cipher. You need to use the same key used for encryption.";
}

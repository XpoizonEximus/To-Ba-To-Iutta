import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/service/index/symmetric/encrypt.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;
import 'package:to_ba_to_iutta/view/pages/transform/encrypt.dart';
import 'package:to_ba_to_iutta/view/pages/transform/symmetric/index.dart';

class SymmetricEncryptPage extends local.Page {
  const SymmetricEncryptPage({super.key})
      : super(title: 'Symmetric Encryption');

  @override
  State<StatefulWidget> createState() => SymmetricEncryptPageState();
}

class SymmetricEncryptPageState extends SymmetricPageState<SymmetricEncryptPage>
    with EncryptPageState {
  @override
  final SymmetricEncryptService service = SymmetricEncryptService();

  @override
  final headerSubtitle =
      "Encrypt your data using a key. The cipher generated can be decrypted using the same key.";
}

import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/service/index/asymmetric/decrypt.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;
import 'package:to_ba_to_iutta/view/pages/transform/decrypt.dart';
import 'package:to_ba_to_iutta/view/pages/transform/asymmetric/index.dart';

class AsymmetricDecryptPage extends local.Page {
  const AsymmetricDecryptPage({super.key})
      : super(title: 'Asymmetric Decryption');

  @override
  State<StatefulWidget> createState() => AsymmetricDecryptPageState();
}

class AsymmetricDecryptPageState
    extends AsymmetricPageState<AsymmetricDecryptPage> with DecryptPageState {
  @override
  final AsymmetricDecryptService service = AsymmetricDecryptService();

  @override
  final headerSubtitle =
      "Decrypt your asymmetricaly encrypted cipher. You need to use the private key conterpart of the public key used for encryption.";
}

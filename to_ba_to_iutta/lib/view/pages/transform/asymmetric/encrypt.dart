import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/service/index/asymmetric/encrypt.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;
import 'package:to_ba_to_iutta/view/pages/transform/encrypt.dart';
import 'package:to_ba_to_iutta/view/pages/transform/asymmetric/index.dart';

class AsymmetricEncryptPage extends local.Page {
  const AsymmetricEncryptPage({super.key})
      : super(title: 'Asymmetric Encryption');

  @override
  State<StatefulWidget> createState() => AsymmetricEncryptPageState();
}

class AsymmetricEncryptPageState
    extends AsymmetricPageState<AsymmetricEncryptPage> with EncryptPageState {
  @override
  final AsymmetricEncryptService service = AsymmetricEncryptService();

  @override
  final headerSubtitle =
      "Encrypt your data using the public key received from your receiver. The cipher generated can be decrypted using only the receiver's private couterpart of the key.";
}

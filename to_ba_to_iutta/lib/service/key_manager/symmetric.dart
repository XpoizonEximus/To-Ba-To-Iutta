import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/service/key_manager/index.dart';

class SymmetricKeyManager extends KeyManager {
  final keyController = TextEditingController();

  @override
  void dispose() {
    keyController.dispose();
    super.dispose();
  }

  @override
  Future<Bytes> get decryptionKey async => utf8.encode(keyController.text);

  @override
  Future<Bytes> get encryptionKey async => utf8.encode(keyController.text);
}

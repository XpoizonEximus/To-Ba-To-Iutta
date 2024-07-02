import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;

mixin EncryptPageState<T extends local.Page> on local.PageState<T> {
  @override
  final String? inputHintText = "Type something to encrypt";
  @override
  final String? inputLabelText = "Input text";
  @override
  final String? inputHelperText =
      "Type your message here or select a file to upload";
  @override
  final String inputFileButtonText = "Encrypt a file";

  @override
  final String? outputHintText = null;
  @override
  final String? outputLabelText = "Output";
  @override
  final String? outputHelperText =
      "This is the cipher representing your encrypted data";
  @override
  final String outputFileButtonText = "Save cipher to a file";

  @override
  final String mainButtonText = "Encrypt";
  @override
  final IconData mainButtonIcon = Symbols.lock;

  final String? keyHintText = "Enter your encryption key";
  final String? keyHelperText = "Encryption key";
}

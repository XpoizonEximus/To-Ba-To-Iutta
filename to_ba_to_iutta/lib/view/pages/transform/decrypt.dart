import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;

mixin DecryptPageState<T extends local.Page> on local.PageState<T> {
  @override
  final String? inputHintText = "Type your cipher to decrypt";
  @override
  final String? inputLabelText = "Input cipher";
  @override
  final String? inputHelperText =
      "Type your cipher here or select a cipher file to upload";
  @override
  final String inputFileButtonText = "Decrypt a file";

  @override
  final String? outputHintText = null;
  @override
  final String? outputLabelText = "Output";
  @override
  final String? outputHelperText = "This is the decpripted cipher";
  @override
  final String outputFileButtonText = "Save output to a file";

  @override
  final String mainButtonText = "Decrypt";
  @override
  final IconData mainButtonIcon = Symbols.lock_open;

  final String? keyHintText = "Enter your decryption key";
  final String? keyHelperText = "Decryption key";
}

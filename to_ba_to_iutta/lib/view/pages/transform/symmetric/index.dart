import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/service/index/symmetric/index.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;

abstract class SymmetricPageState<T extends local.Page>
    extends local.PageState<T> {
  @override
  abstract final SymmetricService service;

  String? get keyLabelText => "Key";
  String? get keyHintText;
  String? get keyHelperText;

  @override
  Widget buildKeyInput(BuildContext context) {
    return TextField(
      controller: service.keyManager.keyController,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: keyHintText,
          labelText: keyLabelText,
          helperText: "*$keyHelperText"),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/domain/cipher/index.dart';
import 'package:to_ba_to_iutta/domain/digest/index.dart';
import 'package:to_ba_to_iutta/domain/persistent/settings.dart';
import "page.dart" as local;

class SettingsPage extends local.Page {
  const SettingsPage({super.key}) : super(title: "Settings");

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _key = CipherDataInteractorKey();
  CipherData? _initial;

  @override
  void initState() {
    super.initState();
    SettingsProvider().symmetric.then((value) => setState(() {
          _initial = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CipherDataInteractor(
            initial: _initial ?? CipherData.defaults, key: _key)
      ],
    );
  }
}

import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/asymmetric/index.dart';
import 'package:to_ba_to_iutta/persistent/keys.dart';
import 'package:to_ba_to_iutta/view/pages/key_manager/manager.dart';
import "package:to_ba_to_iutta/view/pages/page.dart" as local;

class KeysManagerPage extends local.Page {
  const KeysManagerPage({super.key}) : super(title: "Asymmetric keys manager");

  @override
  State<KeysManagerPage> createState() => _KeysManagerPageState();
}

class _KeysManagerPageState extends State<KeysManagerPage> {
  final _cipher = AsymmetricCipherData.defaults.newMean;
  final _provider = AsymmetricKeysProvider();
  final _serializer = const AsymmetricCipherVariablesSerializer();

  Future<Iterable<String>> get _publicKeys => _provider.publics;
  Future<Iterable<String>> get _privateKeys => _provider.privates;

  Future _addPrivateKey(String name) async => await _provider.setKey(
      name,
      Bytes.fromList(
          await _serializer.serialize(await _cipher.newKey).toList()),
      false);

  Future _addPublicKey(String name, String value) async =>
      await _provider.setKey(name, base64Decode(value), true);

  Future _deletePrivateKey(String name) async =>
      await _provider.setKey(name, null, false);

  Future _deletePublicKey(String name) async =>
      await _provider.setKey(name, null, true);

  Future<String> _convertKey(String name) async {
    final key = await _provider.getKey(name, false);

    if (key == null) return "Error: no key with specified name";

    return base64Encode(await _serializer
        .serialize(_cipher.extractPublicKey(
            await _serializer.load(StreamQueue(Stream.fromIterable(key)))))
        .toList());
  }

  Future handleError(BuildContext context, Future Function() f) async {
    try {
      await f();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: theme.textTheme.displayMedium),
                  Text(
                      "Modify you preferences related to algorithms used for encryption.",
                      style: theme.textTheme.bodyLarge),
                  const Row(
                    children: [],
                  )
                ],
              ),
            ),
          ),
          KeysManager(
              title: "Private keys",
              subtitle: "The keys used for decryption",
              newKey: (name, _) =>
                  handleError(context, () => _addPrivateKey(name)),
              values: () => _privateKeys,
              deleteKey: (value) async {
                late bool res = false;
                handleError(context, () async {
                  _deletePrivateKey(value);
                  res = true;
                });
                return res;
              },
              getPublicKey: (value) async {
                try {
                  return await _convertKey(value);
                } catch (e) {
                  return e.toString();
                }
              }),
          KeysManager(
              title: "Public keys",
              subtitle: "The keys used for encryption",
              newKey: (name, value) =>
                  handleError(context, () => _addPublicKey(name, value!)),
              values: () => _publicKeys,
              deleteKey: (value) async {
                late bool res = false;
                handleError(context, () async {
                  _deletePublicKey(value);
                  res = true;
                });
                return res;
              },
              getPublicKey: null)
        ],
      ),
    );
  }
}

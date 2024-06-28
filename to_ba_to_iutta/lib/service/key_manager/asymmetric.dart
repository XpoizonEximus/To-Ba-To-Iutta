import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/persistent/keys.dart';
import 'package:to_ba_to_iutta/service/key_manager/index.dart';

class AsymmetricKeyManager extends KeyManager {
  final keyController = SearchController();
  final keysProvider = AsymmetricKeysProvider();

  @override
  void dispose() {
    keyController.dispose();
    super.dispose();
  }

  Iterable<String>? cache;
  bool forPublic;

  AsymmetricKeyManager(this.forPublic);

  @override
  Future<Bytes> get decryptionKey async =>
      (await keysProvider.getKey(keyController.value.text)) ??
      base64Decode(keyController.value.text);

  @override
  Future<Bytes> get encryptionKey async =>
      (await keysProvider.getKey(keyController.value.text)) ??
      base64Decode(keyController.value.text);

  Future<Iterable<String>> related(String value) async {
    cache ??= await (forPublic ? keysProvider.publics : keysProvider.privates);

    final distances =
        cache!.map((str) => MapEntry(str, _levenshtein(str, value))).toList();
    distances.sort((a, b) => a.value.compareTo(b.value));

    return distances /*.take(n)*/ .map((entry) => entry.key);
  }
}

int _levenshtein(String s, String t) {
  if (s == t) return 0;
  if (s.isEmpty) return t.length;
  if (t.isEmpty) return s.length;

  List<List<int>> matrix =
      List.generate(s.length + 1, (i) => List<int>.filled(t.length + 1, 0));

  for (int i = 0; i <= s.length; i++) {
    matrix[i][0] = i;
  }

  for (int j = 0; j <= t.length; j++) {
    matrix[0][j] = j;
  }

  for (int i = 1; i <= s.length; i++) {
    for (int j = 1; j <= t.length; j++) {
      int cost = (s[i - 1] == t[j - 1]) ? 0 : 1;

      matrix[i][j] = [
        matrix[i - 1][j] + 1, // deletion
        matrix[i][j - 1] + 1, // insertion
        matrix[i - 1][j - 1] + cost // substitution
      ].reduce((a, b) => a < b ? a : b);
    }
  }

  return matrix[s.length][t.length];
}

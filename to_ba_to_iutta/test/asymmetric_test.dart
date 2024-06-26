import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pointycastle/export.dart' as pc;
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/asymmetric/index.dart';
import 'list_matcher.dart';

Future testImplementation(AsymmetricCipherData data) async {
  final cipher = data.newMean;

  final key = await cipher.newKey;

  final test1 = <Bytes>[
    Bytes.fromList([1, 2, 3])
  ];

  
  final key2 = await const AsymmetricCipherVariablesSerializer().load(
      StreamQueue(const AsymmetricCipherVariablesSerializer().serialize(key)));
  final key3 = AsymmetricCipherVariables(
      modulus: key.modulus,
      exponent: pc.RSAPrivateKey(key2.modulus, key2.exponent, key2.p, key2.q)
          .publicExponent!);
  final key4 = await const AsymmetricCipherVariablesSerializer().load(
      StreamQueue(const AsymmetricCipherVariablesSerializer().serialize(key3)));

  final cipherText = await cipher
      .encrypt(StreamQueue(Stream.fromIterable(test1)), key4)
      .toList();
  // for (final chunk in cipherText) {
  //   print(chunk);
  // }
  // print("-------------------");


  final plainText = await (await AsymmetricCipherDataSerializer()
          .load(StreamQueue(AsymmetricCipherDataSerializer().serialize(data))))
      .newMean
      .decrypt(StreamQueue(Stream.fromIterable(cipherText)), key)
      .toList();
  // for (final chunk in plainText) {
  //   print(chunk);
  // }
  // print("-------------------");
  // print("-------------------");

  expect(flatten(plainText), ListMatcher(flatten(test1)));
}

void main() async {
  group("Implementation", () {
    test("Asymmetric", () async {
      AsymmetricCipherData cipherData;

      cipherData = AsymmetricCipherData(
          AsymmetricCipherImplementation.rsa,
          const AsymmetricCipherParams(
              AsymmetricCipherEngine.rsa, AsymmetricEncoding.oaep));
      await testImplementation(cipherData);
    });
  });
}

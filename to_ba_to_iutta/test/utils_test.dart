import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:to_ba_to_iutta/bytes.dart';
import 'package:to_ba_to_iutta/cryptography/cipher/index.dart';
import 'package:to_ba_to_iutta/cryptography/index/index.dart';
import 'package:to_ba_to_iutta/files/manager/reader/all.dart';
import 'package:to_ba_to_iutta/files/manager/writer/specific.dart';

import 'list_matcher.dart';

class A {}

class B extends A {}

void main() {
  group("Serializers", () {
    test("BigInt", () async {
      final input = BigInt.parse("12345678912345675759");
      const serializer = BigIntSerializer();
      final output =
          await serializer.load(StreamQueue(serializer.serialize(input)));
      expect(output.toString(), input.toString());
    });
  });
  group("Dart", () {
    test("Function subtyping", () async {
      void a(A x) {}
      void b(B x) {}

      void Function(A) fa = a;
      void Function(B)? fb = b;

      fa = fb as Function(A);
    });
    test("Files", () async {
      final reader = AllFileReader();
      await reader.choose;

      final writer = SpecificFileWriter(extension(reader.file.path));
      await writer.choose;

      final cipher = CipherData.defaults.newMean;

      final key = await cipher.newKey;
      final nonce = await cipher.newNonce;
      final variables = CipherVariables(key: key, nonce: nonce);

      final plaintext = await reader.get.toList();
      final ciphertext = await cipher
          .encrypt(StreamQueue(Stream.fromIterable(plaintext)), variables)
          .toList();
      final plaintext2 = await cipher
          .decrypt(StreamQueue(Stream.fromIterable(ciphertext)), variables)
          .toList();

      expect(Bytes.fromList(flatten(plaintext)),
          ListMatcher(Bytes.fromList(flatten(plaintext2))));

      writer.put(Stream.fromIterable(plaintext2));
    });
  });
}

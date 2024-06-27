import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_ba_to_iutta/cryptography/mean/index.dart';

void main() {
  group("Serializers", () {
    test("BigInt", () async {
      final input = BigInt.parse("12345678912345675759");
      final serializer = BigIntSerializer();
      final output =
          await serializer.load(StreamQueue(serializer.serialize(input)));
      expect(output.toString(), input.toString());
    });
  });
}

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class ListMatcher extends Matcher {
  final Uint8List expected;

  ListMatcher(this.expected);

  @override
  Description describe(Description description) =>
      description.add('equals $expected');

  @override
  Description describeMismatch(item, Description mismatchDescription,
          Map matchState, bool verbose) =>
      mismatchDescription.add('is not equal to $expected');

  @override
  bool matches(item, Map matchState) {
    if (item is! Uint8List) return false;
    if (item.length != expected.length) return false;

    for (int i = 0; i < item.length; i++) {
      if (item[i] != expected[i]) {
        return false;
      }
    }
    return true;
  }
}

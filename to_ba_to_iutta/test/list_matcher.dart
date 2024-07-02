import 'package:flutter_test/flutter_test.dart';
import 'package:to_ba_to_iutta/bytes.dart';

Bytes flatten(Iterable<Iterable<int>> input) {
  var res = <int>[];
  for (final iterable in input) {
    for (final element in iterable) {
      res.add(element);
    }
  }
  return Bytes.fromList(res);
}

class ListMatcher extends Matcher {
  final Bytes expected;

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
    if (item is! Bytes) return false;
    if (item.length != expected.length) return false;

    for (int i = 0; i < item.length; i++) {
      if (item[i] != expected[i]) {
        return false;
      }
    }
    return true;
  }
}

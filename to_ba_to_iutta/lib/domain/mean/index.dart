library mean;

import 'dart:async';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part "data.dart";
part "mean.dart";
part "params.dart";
part "variables.dart";

part "converter/mean_implementation_converter.dart";
part "converter/params_interactor_converter.dart";

part "implementation/named.dart";
part "implementation/implementation.dart";
part "implementation/params_implementation.dart";

part "interactor/interactor.dart";
part "interactor/bounded_int_interactor.dart";
part "interactor/named_enum_interactor.dart";
part "interactor/params_interactor.dart";
part "interactor/data_interactor.dart";

part "serializer/serializer.dart";
part "serializer/int_serializer.dart";
part "serializer/bounded_int_serializer.dart";
part "serializer/enum_serializer.dart";
part "serializer/params_serializer.dart";
part "serializer/data_serializer.dart";
part "serializer/variables_serializer.dart";
part "serializer/bytes_serializer.dart";

typedef Byte = int;
typedef Bytes = Uint8List;

class BoundedInt {
  final int min;
  final int max;

  final int value;

  const BoundedInt(this.value, {required this.min, required this.max});
}

class BoundedIntRangeFormatter extends TextInputFormatter {
  final int min;
  final int max;

  BoundedIntRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int? value = int.tryParse(newValue.text);

    if (value == null || value < min || value > max) {
      return oldValue;
    }

    return newValue;
  }
}

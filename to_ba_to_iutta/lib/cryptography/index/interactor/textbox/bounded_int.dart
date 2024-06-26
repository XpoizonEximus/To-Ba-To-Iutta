part of "../../index.dart";

class BoundedIntInteractor extends TextboxInteractor<BoundedInt> {
  const BoundedIntInteractor(
      {super.key,
      required super.initial,
      required super.title,
      required super.description,
      required super.unitOfMeasure,
      super.unitOfMeasureInFront = false});

  @override
  BoundedIntInteractorState createState() => BoundedIntInteractorState();
}

class BoundedIntInteractorState
    extends TextboxInteractorState<BoundedInt, BoundedIntInteractor> {
  String? _errorMessage;

  int get min => initial.min;
  int get max => initial.max;

  @override
  String get initialString => initial.value.toString();

  String? _validateNumber(String value) {
    final number = int.tryParse(value);
    if (number == null) {
      return 'Please enter a number';
    }
    if (number < min || number > max) {
      return 'Number must be between $min and $max';
    }
    return null;
  }

  @override
  BoundedInt get current =>
      BoundedInt(int.parse(controller.text), min: min, max: max);

  @override
  Widget buildTextbox(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          BoundedIntRangeFormatter(min: min, max: max)
        ],
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: _errorMessage,
        ),
        onChanged: (value) {
          if (mounted) {
            setState(() {
              _errorMessage = _validateNumber(value);
            });
          }
        });
  }
}

typedef BoundedIntInteractorKey = InteractorKey<BoundedIntInteractorState>;

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

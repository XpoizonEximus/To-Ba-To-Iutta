part of "../../index.dart";

class IntInteractor extends TextboxInteractor<int> {
  const IntInteractor(
      {super.key,
      required super.initial,
      required super.title,
      required super.description,
      required super.unitOfMeasure,
      super.unitOfMeasureInFront = false});

  @override
  IntInteractorState createState() => IntInteractorState();
}

class IntInteractorState extends TextboxInteractorState<int, IntInteractor> {
  String? _errorMessage;

  @override
  String get initialString => initial.toString();

  String? _validateNumber(String value) {
    final number = int.tryParse(value);
    if (number == null) {
      return 'Please enter a number';
    }
    return null;
  }

  @override
  int get current => int.parse(controller.text);

  @override
  Widget buildTextbox(BuildContext context) {
    return TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
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

typedef IntInteractorKey = InteractorKey<IntInteractorState>;

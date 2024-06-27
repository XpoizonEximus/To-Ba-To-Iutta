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
  late final TextEditingController _controller;
  String? _errorMessage;

  String get _initial => widget.initial.toString();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _initial);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant IntInteractor oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initial != widget.initial) _controller.text = _initial;
  }

  String? _validateNumber(String value) {
    final number = int.tryParse(value);
    if (number == null) {
      return 'Please enter a number';
    }
    return null;
  }

  @override
  int get current => int.parse(_controller.text);

  @override
  Widget buildTextbox(BuildContext context) {
    return TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: _errorMessage,
        ),
        onChanged: (value) {
          setState(() {
            _errorMessage = _validateNumber(value);
          });
        });
  }
}

typedef IntInteractorKey = InteractorKey<IntInteractorState>;

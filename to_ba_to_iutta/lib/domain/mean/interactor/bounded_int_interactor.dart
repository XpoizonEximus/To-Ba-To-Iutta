part of "../index.dart";

class BoundedIntInteractor extends Interactor<BoundedInt> {
  const BoundedIntInteractor(
      {super.key,
      required super.initial,
      required super.title,
      required super.description});

  @override
  BoundedIntInteractorState createState() => BoundedIntInteractorState();
}

class BoundedIntInteractorState
    extends InteractorState<BoundedInt, BoundedIntInteractor> {
  late final TextEditingController _controller;
  String? _errorMessage;

  int get min => widget.initial.min;
  int get max => widget.initial.max;

  String get _initial => widget.initial.value.toString();

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
  void didUpdateWidget(covariant BoundedIntInteractor oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initial != widget.initial) _controller.text = _initial;
  }

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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: theme.textTheme.titleMedium,
        ),
        Text(widget.description, style: theme.textTheme.bodyMedium),
        TextField(
            controller: _controller,
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
              setState(() {
                _errorMessage = _validateNumber(value);
              });
            })
      ],
    );
  }

  @override
  BoundedInt get current =>
      BoundedInt(int.parse(_controller.text), min: min, max: max);
}

typedef BoundedIntInteractorKey = InteractorKey<BoundedIntInteractorState>;

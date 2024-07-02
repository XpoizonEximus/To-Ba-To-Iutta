part of "../../index.dart";

abstract class TextboxInteractor<T> extends Interactor<T> {
  final String unitOfMeasure;
  final bool unitOfMeasureInFront;
  const TextboxInteractor(
      {super.key,
      required super.initial,
      required super.title,
      required super.description,
      required this.unitOfMeasure,
      this.unitOfMeasureInFront = false});

  @override
  TextboxInteractorState<T, TextboxInteractor> createState();
}

abstract class TextboxInteractorState<T, I extends TextboxInteractor>
    extends InteractorState<T, I> {
  Widget buildTextbox(BuildContext context);

  final TextEditingController controller = TextEditingController();
  String get initialString;

  @override
  set initial(T value) {
    super.initial = value;
    setState(() {
      controller.text = initialString;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.text = initialString;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.unitOfMeasureInFront
                ? <Widget>[
                    Text(widget.unitOfMeasure),
                    const SizedBox(width: 8.0),
                    Container(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: buildTextbox(context))
                  ]
                : <Widget>[
                    Container(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: buildTextbox(context)),
                    const SizedBox(width: 8.0),
                    Text(widget.unitOfMeasure)
                  ],
          ),
        )
      ],
    );
  }
}

typedef TextboxInteractorKey<T>
    = InteractorKey<TextboxInteractorState<T, TextboxInteractor>>;

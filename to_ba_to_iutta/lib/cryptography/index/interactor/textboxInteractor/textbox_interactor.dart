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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widget.unitOfMeasureInFront
              ? <Widget>[
                  Text(widget.unitOfMeasure),
                  Expanded(child: buildTextbox(context))
                ]
              : <Widget>[
                  Expanded(child: buildTextbox(context)),
                  Text(widget.unitOfMeasure)
                ],
        )
      ],
    );
  }
}

typedef TextboxInteractorKey<T>
    = InteractorKey<TextboxInteractorState<T, TextboxInteractor>>;

part of "../index.dart";

class ParamsInteractor<T extends Params> extends Interactor<T> {
  const ParamsInteractor(
      {super.key,
      required super.initial,
      required super.title,
      required super.description});
}

abstract class ParamsInteractorState<T extends Params,
    I extends ParamsInteractor> extends InteractorState<T, I> {
  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        super.build(context),
        Container(
          decoration: BoxDecoration(
              border:
                  Border(left: BorderSide(color: theme.colorScheme.secondary))),
          child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: buildContent(context)),
        )
      ],
    );
  }
}

typedef ParamsInteractorKey<T extends Params>
    = InteractorKey<ParamsInteractorState<T, ParamsInteractor>>;

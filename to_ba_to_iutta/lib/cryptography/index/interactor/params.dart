part of "../index.dart";

abstract class ParamsInteractor<T extends Params> extends Interactor<T> {
  const ParamsInteractor(
      {super.key,
      required super.initial,
      required super.title,
      required super.description});

  @override
  ParamsInteractorState<T, ParamsInteractor> createState();
}

abstract class ParamsInteractorState<T extends Params,
    I extends ParamsInteractor> extends InteractorState<T, I> {
  Iterable<Widget> buildParams(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        super.build(context),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: theme.colorScheme.secondary))),
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: buildParams(context)
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: e,
                            ))
                        .toList())),
          ),
        )
      ],
    );
  }
}

typedef ParamsInteractorKey<T extends Params>
    = InteractorKey<ParamsInteractorState<T, ParamsInteractor>>;

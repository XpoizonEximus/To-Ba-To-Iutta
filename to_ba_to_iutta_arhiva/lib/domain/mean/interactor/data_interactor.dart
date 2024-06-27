part of "../index.dart";

abstract class DataInteractor<T extends Data> extends Interactor<T> {
  const DataInteractor(
      {super.key,
      required super.initial,
      required super.title,
      required super.description});

  @override
  DataInteractorState<T, DataInteractor> createState();
}

abstract class DataInteractorState<T extends Data, I extends DataInteractor>
    extends InteractorState<T, I> {
  Widget buildImplementation(BuildContext context);
  Widget buildParams(BuildContext context);

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [buildImplementation(context), buildParams(context)],
              )),
        )
      ],
    );
  }
}

typedef DataInteractorKey<T extends Data>
    = InteractorKey<DataInteractorState<T, DataInteractor>>;

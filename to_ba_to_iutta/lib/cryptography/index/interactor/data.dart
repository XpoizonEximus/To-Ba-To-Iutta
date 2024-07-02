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
  NamedEnumInteractor<Implementation> buildImplementation(BuildContext context);
  ParamsInteractor buildParams(BuildContext context);

  late Implementation _implementation;
  late Params params;

  Implementation get implementation => _implementation;

  set implementation(Implementation value) {
    setState(() {
      _implementation = value;
      params = value.requiredParams.defaults;
    });
  }

  void changeImplementation(Implementation value) => implementation = value;

  @override
  void initState() {
    super.initState();
    setState(() {
      _implementation = initial.implementation;
      params = initial.params;
    });
  }

  @override
  set initial(T value) {
    super.initial = value;
    setState(() {
      _implementation = value.implementation;
      params = value.params;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        super.build(context),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 32.0, bottom: 32.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: theme.colorScheme.secondary))),
            child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: buildImplementation(context),
                    ),
                    const SizedBox(height: 16.0),
                    buildParams(context)
                  ],
                )),
          ),
        )
      ],
    );
  }
}

typedef DataInteractorKey<T extends Data>
    = InteractorKey<DataInteractorState<T, DataInteractor>>;

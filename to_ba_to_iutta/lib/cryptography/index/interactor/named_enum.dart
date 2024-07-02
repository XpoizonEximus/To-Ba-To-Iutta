part of "../index.dart";

class NamedEnumInteractor<T extends Named> extends Interactor<T> {
  final List<T> values;
  final ValueChanged<T>? _onChanged;

  void onChanged(T value) {
    if (_onChanged != null) {
      _onChanged(value);
    }
  }

  const NamedEnumInteractor(
      {super.key,
      required super.initial,
      required super.title,
      required super.description,
      required this.values,
      ValueChanged<T>? onChanged})
      : _onChanged = onChanged;

  @override
  NamedEnumInteractorState<T> createState() => NamedEnumInteractorState<T>();
}

class NamedEnumInteractorState<T extends Named>
    extends InteractorState<T, NamedEnumInteractor<T>> {
  late T _current;

  @override
  void initState() {
    super.initState();
    _current = initial;
  }

  void _onChanged(T? value) {
    if (value != null) {
      setState(() {
        _current = value;
      });
      widget.onChanged(value);
    }
  }

  @override
  set initial(T value) {
    super.initial = value;
    _current = initial;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        super.build(context),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.values
                .map((e) => RadioListTile<T>(
                    title: Text(e.name),
                    value: e,
                    groupValue: _current,
                    onChanged: _onChanged))
                .toList())
      ],
    );
  }

  @override
  T get current => _current;
}

typedef NamedEnumInteractorKey<T extends Named>
    = InteractorKey<NamedEnumInteractorState<T>>;

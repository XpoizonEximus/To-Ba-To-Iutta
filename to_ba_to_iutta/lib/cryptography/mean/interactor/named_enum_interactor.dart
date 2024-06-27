part of "../index.dart";

class NamedEnumInteractor<T extends Named> extends Interactor<T> {
  final List<T> values;
  final ValueChanged<T>? onChanged;

  const NamedEnumInteractor(
      {super.key,
      required super.initial,
      required super.title,
      required super.description,
      required this.values,
      this.onChanged});

  @override
  NamedEnumInteractorState<T> createState() => NamedEnumInteractorState<T>();
}

class NamedEnumInteractorState<T extends Named>
    extends InteractorState<T, NamedEnumInteractor<T>> {
  late T _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initial;
  }

  void _onChanged(T? value) {
    if (value != null) {
      setState(() {
        _selected = value;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(value);
      }
    }
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
                    groupValue: _selected,
                    onChanged: _onChanged))
                .toList())
      ],
    );
  }

  @override
  T get current => _selected;
}

typedef NamedEnumInteractorKey<T extends Named>
    = InteractorKey<NamedEnumInteractorState<T>>;

part of "../index.dart";

abstract class Interactor<T> extends StatefulWidget {
  final T initial;
  final String title;
  final String description;

  const Interactor(
      {super.key,
      required this.initial,
      required this.title,
      required this.description});

  @override
  InteractorState<T, Interactor> createState();
}

abstract class InteractorState<T, I extends Interactor> extends State<I> {
  T get current;
  late T _initial;

  T get initial => _initial;
  set initial(T value) => setState(() {
        _initial = value;
      });

  @override
  void initState() {
    super.initState();
    _initial = widget.initial;
  }

  @override
  void didUpdateWidget(covariant I oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initial != widget.initial) {
      initial = widget.initial;
    }
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
      ],
    );
  }
}

typedef InteractorKey<S extends InteractorState> = GlobalKey<S>;

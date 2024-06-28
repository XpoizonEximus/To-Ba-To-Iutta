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

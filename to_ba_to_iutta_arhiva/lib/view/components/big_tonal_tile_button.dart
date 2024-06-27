import 'package:flutter/material.dart';

class BigTonalTileButton extends StatelessWidget {
  const BigTonalTileButton({
    super.key,
    required this.iconData,
    required this.title,
    required this.content,
    required this.onPressed,
  });

  final IconData iconData;
  final String title;
  final String content;
  final Function onPressed;

  double? _calculateIconSize(double? fontSize) {
    if (fontSize == null) return null;

    return fontSize * 2;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FilledButton.tonal(
        style: const ButtonStyle(
            padding:
                MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 8.0)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))))),
        onPressed: () => onPressed(),
        child: ListTile(
          title: Text(title),
          subtitle: Text(content),
          leading: Icon(
            iconData,
            size: _calculateIconSize(theme.textTheme.titleLarge?.fontSize),
            fill: 1,
          ),
        ));
  }
}

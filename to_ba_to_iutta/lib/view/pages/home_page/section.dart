import 'package:flutter/material.dart';
import 'package:to_ba_to_iutta/view/components/big_tonal_tile_button.dart';

class HomePageSection extends StatelessWidget {
  const HomePageSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  final String title;
  final String subtitle;
  final List<BigTonalTileButton> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.headlineLarge!
                .copyWith(color: theme.primaryColor),
          ),
          Text(
            subtitle,
            style: theme.textTheme.bodyLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
                children: children
                    .map((e) => [
                          e,
                          const SizedBox(
                            height: 8.0,
                          )
                        ])
                    .expand((e) => e)
                    .toList()),
          )
        ],
      ),
    );
  }
}

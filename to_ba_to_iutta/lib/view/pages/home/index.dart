import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:to_ba_to_iutta/view/components/big_tonal_tile_button.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;
import 'package:to_ba_to_iutta/view/pages/home/section.dart';

class HomePage extends local.Page {
  const HomePage(
      {super.key,
      required this.selectSymmetricEncryption,
      required this.selectSymmetricDecryption,
      required this.selectAsymmetricEncryption,
      required this.selectAsymmetricDecryption})
      : super(title: 'TO BA\nTO IUTTA');

  final Function selectSymmetricEncryption;
  final Function selectSymmetricDecryption;
  final Function selectAsymmetricEncryption;
  final Function selectAsymmetricDecryption;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 64.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: theme.textTheme.displayLarge),
              Text(
                "Bringing ecryption closer to the user",
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        HomePageSection(
          title: "Encrypt something",
          subtitle: "Turn your messages and files into cifers",
          children: [
            BigTonalTileButton(
              iconData: Symbols.key_vertical_rounded,
              title: "Symmetric encryption",
              content:
                  "Symmetric algorythms use the same unique key for encryption and decryption. You can specify any string of characters as a key.",
              onPressed: widget.selectSymmetricEncryption,
            ),
            BigTonalTileButton(
              iconData: Symbols.passkey_rounded,
              title: "Asymmetric encryption",
              content:
                  "Asymmetric algorythms use different keys for encryption and decryption. You will need to first recieve the encryption key from your recipient.",
              onPressed: widget.selectAsymmetricEncryption,
            )
          ],
        ),
        HomePageSection(
          title: "Decrypt anything",
          subtitle: "Extract files and text from your recieved ciphers",
          children: [
            BigTonalTileButton(
              iconData: Symbols.key_vertical_rounded,
              title: "Symmetric decryption",
              content:
                  "Symmetric algorythms use the same unique key for encryption and decryption. You can specify any string of characters as a key.",
              onPressed: widget.selectSymmetricDecryption,
            ),
            BigTonalTileButton(
              iconData: Symbols.passkey_rounded,
              title: "Asymmetric decryption",
              content:
                  "Asymmetric algorythms use different keys for encryption and decryption. You will need to first recieve the encryption key from your recipient.",
              onPressed: widget.selectAsymmetricDecryption,
            )
          ],
        )
      ]),
    );
  }
}

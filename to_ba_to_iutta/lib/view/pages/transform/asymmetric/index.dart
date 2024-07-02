import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_ba_to_iutta/service/index/asymmetric/index.dart';
import 'package:to_ba_to_iutta/view/pages/page.dart' as local;

abstract class AsymmetricPageState<T extends local.Page>
    extends local.PageState<T> {
  @override
  abstract final AsymmetricService service;

  String? get keyLabelText => "Key";
  String? get keyHintText;
  String? get keyHelperText;

  @override
  Widget buildKeyInput(BuildContext context) {
    final theme = Theme.of(context);
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        child: SearchAnchor.bar(
            barHintText: keyHelperText,
            barElevation: MaterialStateProperty.all(0),
            barShape: MaterialStateProperty.all(const RoundedRectangleBorder()),
            barSide: MaterialStateProperty.all(
                theme.inputDecorationTheme.outlineBorder ??
                    BorderSide(color: Colors.grey.shade500)),
            barBackgroundColor: MaterialStateProperty.all(Colors.transparent),
            barOverlayColor: MaterialStateProperty.all(Colors.transparent),
            searchController: service.keyManager.keyController,
            viewTrailing: null,
            suggestionsBuilder: (context, controller) async =>
                (await service.keyManager.related(controller.text))
                    .map((e) => ListTile(
                          title: Text(e),
                          onTap: () {
                            setState(() {
                              controller.closeView(e);
                            });
                          },
                        ))),
      )
    ]);
  }
}

import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class TextsWithButton extends StatelessWidget {
  final String firstTextKey;
  final String secondTextKey;
  final Function() action;
  const TextsWithButton({
    required this.firstTextKey,
    required this.secondTextKey,
    required this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(firstTextKey.translate),
        SizedBox(width: context.width),
        registerTextButton(context),
      ],
    );
  }

  Widget registerTextButton(BuildContext context) {
    return TextButton(
      onPressed: action,
      child: AutoSizeText(
        secondTextKey.translate,
        style: context.headline4.copyWith(color: context.primaryColor),
      ),
    );
  }
}

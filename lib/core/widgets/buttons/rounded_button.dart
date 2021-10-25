import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class RoundedButton extends StatelessWidget {
  final String buttonTextKey;
  final Function() action;
  final Color? backgroundColor;
  final Color? borderColor;
  final String iconPath;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final TextStyle? textStyle;
  const RoundedButton({
    required this.buttonTextKey,
    required this.action,
    this.backgroundColor,
    this.borderColor,
    this.iconPath = '',
    this.borderRadius,
    this.borderWidth = 2.0,
    Key? key,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyles(context).roundedStyle(
        borderWidth: borderWidth,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        borderRadius: borderRadius,
      ),
      onPressed: action,
      child: Row(
        children: [
          iconPath == '' ? Expanded(child: Container()) : preImage(context),
          AutoSizeText(buttonTextKey.translate,
              style: textStyle ?? context.headline4.copyWith(fontSize: 23)),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget preImage(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: context.lowMedEdgeInsets,
          child: iconPath.pngLogoAsset,
        ),
      ),
    );
  }
}

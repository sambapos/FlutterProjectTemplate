import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class ButtonStyles {
  static final ButtonStyles _instance = ButtonStyles();
  static ButtonStyles get instance => _instance;

  ButtonStyle roundedStyle(
    BuildContext context, {
    Color? backgroundColor,
    Color? borderColor,
    BorderRadius? borderRadius,
    double? borderWidth,
  }) {
    return ButtonStyle(
      fixedSize:  MaterialStateProperty.all(Size.fromHeight(context.height*6)),
      backgroundColor:
          MaterialStateProperty.all(backgroundColor ?? context.canvasColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? context.highCircular,
          side: BorderSide(
            color: borderColor ?? context.primaryColor,
            width: borderWidth ?? 2.0,
          ),
        ),
      ),
    );
  }

  ButtonStyle lowRoundedStyle(
    BuildContext context, {
    Color? backgroundColor,
    Color? borderColor,
    double? width,
  }) {
    return ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(backgroundColor ?? context.canvasColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: context.lowCircular,
          side: BorderSide(
              color: borderColor ?? context.primaryColor, width: width ?? 2.0),
        ),
      ),
    );
  }
}

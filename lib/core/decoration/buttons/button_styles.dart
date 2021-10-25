import 'package:flutter/material.dart';

import '../../core_shelf.dart';

class ButtonStyles {
  const ButtonStyles(this.context);
  final BuildContext context;

  ButtonStyle roundedStyle({
    Color? backgroundColor,
    Color? borderColor,
    BorderRadius? borderRadius,
    double? borderWidth,
  }) {
    return ButtonStyle(
      fixedSize: _all(Size.fromHeight(context.height * 6)),
      backgroundColor: _all(backgroundColor ?? context.canvasColor),
      shape: _all<RoundedRectangleBorder>(
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

  MaterialStateProperty<T> _all<T>(T value) =>
      MaterialStateProperty.all<T>(value);
}

import 'package:flutter/material.dart';

import '../../core_shelf.dart';

extension ButtonStyleExtension on BuildContext {
  ButtonStyle get cancelStyle => ElevatedButton.styleFrom(
        primary: canvasColor.withOpacity(.9),
        elevation: 2.5,
        side: BorderSide(color: errorColor, width: 1.1),
      );
  ButtonStyle get saveStyle => ElevatedButton.styleFrom(
        primary: primaryColor.withOpacity(.9),
        elevation: 4,
        side: BorderSide(color: primaryColor, width: 1.2),
      );
}

import 'package:flutter/material.dart';

import 'context_extensions_shelf.dart';

extension ResponsiveExtension on BuildContext {
  double get height => mediaQuery.size.height * 0.01;
  double get width => mediaQuery.size.width * 0.01;

  double get lowHeight => height * 1.5;
  double get lowWidth => width * 1.5;

  double get lowMedHeight => height * 2;
  double get lowMedWidth => width * 2;

  double get medHeight => height * 2.8;
  double get medWidth => width * 2.8;

  double get medHighHeight => height * 5;
  double get medHighWidth => width * 5;

  double get highHeight => height * 8;
  double get highWidth => width * 8;

  double get extremeHeight => height * 10;
  double get extremeWidth => width * 10;

  double get maxHeight => height * 20;
  double get maxWidth => width * 20;

  double get fontSize => (width + height) / 2;
}

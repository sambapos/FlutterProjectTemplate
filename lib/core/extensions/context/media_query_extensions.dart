import 'package:flutter/cupertino.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  EdgeInsets get mediaPadding => mediaQuery.padding;
  double get mediaTopPad => mediaPadding.top;
  double get mediaBottomPad => mediaPadding.bottom;

  EdgeInsets get mediaViewInsets => mediaQuery.viewInsets;
  double get viewTopPad => mediaViewInsets.top;
  double get viewBottomPad => mediaViewInsets.bottom;
}

import 'package:flutter/material.dart';

import '../../core_shelf.dart';

extension BorderRadiusExtension on BuildContext {
  BorderRadius get lowCircular => BorderRadius.circular(8);
  BorderRadius get mediumCircular => BorderRadius.circular(15);
  BorderRadius get medHighCircular => BorderRadius.circular(20);
  BorderRadius get highCircular => BorderRadius.circular(30);
  BorderRadius get extremeCircular => BorderRadius.circular(40);
}

extension ShapeBorderExtension on BuildContext {
  ShapeBorder get roundedRectangularLow =>
      RoundedRectangleBorder(borderRadius: lowCircular);
  ShapeBorder get roundedRectangularMedium =>
      RoundedRectangleBorder(borderRadius: mediumCircular);
  ShapeBorder get roundedRectangularHigh =>
      RoundedRectangleBorder(borderRadius: highCircular);
  ShapeBorder get roundedRectangularExtreme =>
      RoundedRectangleBorder(borderRadius: extremeCircular);
}

extension BorderSideExtension on BuildContext {
  BorderSide get defaultBlack =>
      BorderSide(color: Colors.black26, width: width * .05);
  BorderSide get defaultPrimary =>
      BorderSide(color: primaryColor, width: width * .07);
}

extension BoxBorderExtension on BuildContext {
  BoxBorder get defaultBlackBoxBorder =>
      Border.all(color: Colors.black26, width: width * .05);
  BoxBorder get defaultGreyBoxBorder =>
      Border.all(color: Colors.blueGrey, width: width * .1);
}

import 'package:flutter/material.dart';

import '../../core_shelf.dart';

extension AllEdgeInsetsExtension on BuildContext {
  EdgeInsets get lowEdgeInsets => EdgeInsets.all(lowWidth);
  EdgeInsets get lowMedEdgeInsets => EdgeInsets.all(lowMedWidth);
  EdgeInsets get mediumEdgeInsets => EdgeInsets.all(medWidth);
  EdgeInsets get highEdgeInsets => EdgeInsets.all(highWidth);
  EdgeInsets get extremeEdgeInsets => EdgeInsets.all(extremeWidth);
}

extension SymmetricEdgeInsetsExtension on BuildContext {
  EdgeInsets get verticalLow => EdgeInsets.symmetric(vertical: lowHeight);
  EdgeInsets get verticalMedium => EdgeInsets.symmetric(vertical: medHeight);
  EdgeInsets get verticalLowMed => EdgeInsets.symmetric(vertical: lowMedHeight);
  EdgeInsets get verticalHigh => EdgeInsets.symmetric(vertical: highHeight);
  EdgeInsets get verticalExtreme =>
      EdgeInsets.symmetric(vertical: extremeHeight);
  EdgeInsets get verticalMax => EdgeInsets.symmetric(vertical: maxHeight);

  EdgeInsets get horizontalLow => EdgeInsets.symmetric(horizontal: lowWidth);
  EdgeInsets get horizontalMedium => EdgeInsets.symmetric(horizontal: medWidth);
  EdgeInsets get horizontalLowMed =>
      EdgeInsets.symmetric(horizontal: lowMedWidth);
  EdgeInsets get horizontalHigh => EdgeInsets.symmetric(horizontal: highWidth);
  EdgeInsets get horizontalExtreme =>
      EdgeInsets.symmetric(horizontal: extremeWidth);

  EdgeInsets get horizontalMax => EdgeInsets.symmetric(horizontal: maxWidth);

  EdgeInsets get lowSymmetric =>
      EdgeInsets.symmetric(horizontal: lowWidth, vertical: lowHeight);
  EdgeInsets get lowMedSymmetric =>
      EdgeInsets.symmetric(horizontal: lowMedWidth, vertical: lowMedHeight);
  EdgeInsets get mediumSymmetric =>
      EdgeInsets.symmetric(horizontal: medWidth, vertical: medHeight);
  EdgeInsets get highSymmetric =>
      EdgeInsets.symmetric(horizontal: highWidth, vertical: highHeight);
  EdgeInsets get extremeSymmetric =>
      EdgeInsets.symmetric(horizontal: extremeWidth, vertical: extremeHeight);
}

extension LeftEdgeInsetsExtension on BuildContext {
  EdgeInsets get leftLow => EdgeInsets.only(left: lowWidth);
  EdgeInsets get leftLowMed => EdgeInsets.only(left: lowMedWidth);
  EdgeInsets get leftMedium => EdgeInsets.only(left: medWidth);
  EdgeInsets get leftHigh => EdgeInsets.only(left: highWidth);
  EdgeInsets get leftExtreme => EdgeInsets.only(left: extremeWidth);
}

extension RightEdgeInsetsExtension on BuildContext {
  EdgeInsets get rightLow => EdgeInsets.only(right: lowWidth);
  EdgeInsets get rightLowMed => EdgeInsets.only(right: lowMedWidth);
  EdgeInsets get rightMedium => EdgeInsets.only(right: medWidth);
  EdgeInsets get rightHigh => EdgeInsets.only(right: highWidth);
  EdgeInsets get rightExtreme => EdgeInsets.only(right: extremeWidth);
}

extension TopEdgeInsetsExtension on BuildContext {
  EdgeInsets get topLow => EdgeInsets.only(top: lowHeight);
  EdgeInsets get topLowMed => EdgeInsets.only(top: lowMedHeight);
  EdgeInsets get topMedium => EdgeInsets.only(top: medHeight);
  EdgeInsets get topMedHigh => EdgeInsets.only(top: medHighHeight);
  EdgeInsets get topHigh => EdgeInsets.only(top: highHeight);
  EdgeInsets get topExtreme => EdgeInsets.only(top: extremeHeight);
}

extension BottomEdgeInsetsExtension on BuildContext {
  EdgeInsets get bottomLow => EdgeInsets.only(bottom: lowHeight);
  EdgeInsets get bottomLowMed => EdgeInsets.only(bottom: lowMedHeight);
  EdgeInsets get bottomMedium => EdgeInsets.only(bottom: medHeight);
  EdgeInsets get bottomHigh => EdgeInsets.only(bottom: highHeight);
  EdgeInsets get bottomExtreme => EdgeInsets.only(bottom: extremeHeight);
}

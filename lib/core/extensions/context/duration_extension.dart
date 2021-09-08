import 'package:flutter/material.dart';

extension DurationExtension on BuildContext {
  Duration get tooFast => const Duration(milliseconds: 200);
  Duration get fast => const Duration(milliseconds: 500);
  Duration get normal => const Duration(milliseconds: 800);
  Duration get slow => const Duration(seconds: 1);
  Duration get tooSlow => const Duration(seconds: 2);
}

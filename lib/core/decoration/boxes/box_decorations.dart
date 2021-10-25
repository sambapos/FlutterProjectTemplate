import 'package:flutter/material.dart';

class BoxDecorations {
  const BoxDecorations(this.context);
  final BuildContext context;

  static BoxDecoration fullImageDeco(String image) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    );
  }
}

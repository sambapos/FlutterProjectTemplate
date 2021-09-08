import 'package:flutter/material.dart';

class BoxDecorations {
  static BoxDecorations? _instance;
  static BoxDecorations get instance {
    _instance ??= BoxDecorations();
    return _instance!;
  }

  BoxDecoration fullImageDeco(String image) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    );
  }
}

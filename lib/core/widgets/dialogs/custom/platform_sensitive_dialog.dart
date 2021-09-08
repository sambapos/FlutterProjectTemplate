import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class PlatformSensitiveWidget extends StatelessWidget {
  const PlatformSensitiveWidget({Key? key}) : super(key: key);

  Widget buildAndroidWidget(BuildContext context);

  Widget buildIOSWidget(BuildContext context);

  Widget buildMainWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return buildMainWidget(context);
    } else if (Platform.isIOS) {
      return buildIOSWidget(context);
    } else {
      return buildAndroidWidget(context);
    }
  }
}

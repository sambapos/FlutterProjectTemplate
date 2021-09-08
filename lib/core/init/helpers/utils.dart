import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core_shelf.dart';

class Utils {
  static final Utils _instance = Utils();
  static Utils get instance => _instance;

  void textDialog(BuildContext context, String textKey, {String? text}) {
    final isWeb = getDeviceType(context, null) == DeviceType.web;
    CustomDialog(
      content: Padding(
        padding: isWeb
            ? context.lowEdgeInsets.copyWith(top: context.height * 2)
            : const EdgeInsets.all(0),
        child: Text(
          text ?? textKey.translate,
          textAlign: TextAlign.center,
          style: context.headline5.copyWith(
            fontSize: (context.width + context.height) / (isWeb ? 1.1 : .76),
          ),
        ),
      ),
    ).show(context);
  }

  DeviceType getDeviceType(BuildContext context, BoxConstraints? constraints) {
    final orientation = MediaQuery.of(context).orientation;
    var maxWidth = MediaQuery.of(context).size.width;
    var maxHeight = MediaQuery.of(context).size.height;
    if (constraints != null) {
      maxWidth = constraints.maxWidth;
      maxHeight = constraints.maxHeight;
    }
    if ((orientation == Orientation.portrait && maxWidth < 900) ||
        (orientation == Orientation.landscape && maxHeight < 600 && !kIsWeb)) {
      return DeviceType.mobile;
    } else {
      return DeviceType.web;
    }
  }

  DeviceType getGeneralType(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    final devicePixelRatio = ui.window.devicePixelRatio;
    final orientation = MediaQuery.of(context).orientation;
    if (devicePixelRatio < 2 && (maxWidth >= 1000 || maxHeight >= 1000) ||
        devicePixelRatio == 2 && (maxWidth >= 1920 || maxHeight >= 1920)) {
      return DeviceType.tablet;
    } else {
      if ((orientation == Orientation.portrait && maxWidth < 900) ||
          (orientation == Orientation.landscape &&
              maxHeight < 600 &&
              !kIsWeb)) {
        return DeviceType.mobile;
      } else {
        return DeviceType.web;
      }
    }
  }

  void setSystemUi(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(isDark ? 0xffffff : 0xff121212),
        statusBarColor: Color(isDark ? 0xff3280c0 : 0xff616161),
        systemNavigationBarIconBrightness:
            isDark ? Brightness.dark : Brightness.light,
      ),
    );
  }

  Future<void> onThemeChanged(bool isDark, ThemeProvider themeNotifier) async {
    Utils.instance.setSystemUi(themeNotifier.isDark());
    (isDark)
        ? themeNotifier.theme = getDarkTheme()
        : themeNotifier.theme = getLightTheme();
    await LocalManager.instance.setBoolValue(LocalManagerKeys.darkMode, isDark);
  }

  Future<void> changeLanguage(BuildContext context) async {
    var lang = Localizations.localeOf(context).languageCode;
    await context
        .read<LanguageProvider>()
        .changeLanguage(lang == 'tr' ? 'en' : 'tr');
  }

  Future<void> setOrientation(BuildContext context) async {
    if (Utils.instance.getGeneralType(context) == DeviceType.tablet) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
    }
  }
}

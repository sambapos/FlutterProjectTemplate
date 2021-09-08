import 'package:flutter/material.dart';

import '../core_shelf.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _appLocale;

  Locale? get appLocal => _appLocale;

  Future<void> fetchLocale() async {
    var langCode = await LocalManager.instance
        .getStringValue(LocalManagerKeys.languageCode);
    _appLocale = Locale(langCode == 'Not Found' ? 'en' : langCode);
  }

  Future<void> changeLanguage(type) async {
    if (Locale(type) == _appLocale || (type != 'tr' && type != 'en')) return;
    _appLocale = Locale(type);
    await LocalManager.instance
        .setStringValue(LocalManagerKeys.languageCode, type);
    notifyListeners();
  }

  String getLanguage() {
    if (_appLocale == const Locale('en')) {
      return 'en';
    } else {
      return 'tr';
    }
  }
}

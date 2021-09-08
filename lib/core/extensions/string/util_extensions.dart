import '../../init/lang/app_localizations.dart';

extension UtilExtension on String {
  String get translate =>
      AppLocalizations.instance?.translateHelper(this) ?? this;

  String get turkishCharToEnglish {
    return replaceAll(RegExp(r'Ğ'), 'G')
        .replaceAll(RegExp(r'Ü'), 'U')
        .replaceAll(RegExp(r'Ş'), 'S')
        .replaceAll(RegExp(r'İ'), 'I')
        .replaceAll(RegExp(r'Ö'), 'O')
        .replaceAll(RegExp(r'Ç'), 'C')
        .replaceAll(RegExp(r'ğ'), 'g')
        .replaceAll(RegExp(r'ü'), 'u')
        .replaceAll(RegExp(r'ş'), 's')
        .replaceAll(RegExp(r'ı'), 'i')
        .replaceAll(RegExp(r'ö'), 'o')
        .replaceAll(RegExp(r'ç'), 'c');
  }
}

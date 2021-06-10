import 'dart:ui';

import 'package:flutter_translation/flutter_translation.dart';
import 'package:githubapp/core/language/app_languages.dart';
import 'package:githubapp/core/language/translator/app_translator.dart';
import 'package:githubapp/injection/injection.dart';

class AppLocalizations extends ILocalizations<AppTranslator> {
  AppLocalizations._(Locale locale) : super(locale);

  @override
  AppTranslator getTranslator(String languageCode) {
    return getIt<AppLanguages>().findByCode(languageCode).translator
        as AppTranslator;
  }
}

class AppLocalizationsDelegate
    extends ILocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  List<LanguageEntity> getLanguages() => getIt<AppLanguages>().languages;

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations._(locale);
  }
}

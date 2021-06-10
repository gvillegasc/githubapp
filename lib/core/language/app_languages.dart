import 'package:flutter_translation/flutter_translation.dart';
import 'package:githubapp/core/language/translator/en_translator.dart';
import 'package:githubapp/core/language/translator/es_translator.dart';

class AppLanguages extends ILanguages {
  AppLanguages.singleton();

  @override
  LanguageEntity get defaultLanguage => findByCode('es');

  @override
  List<LanguageEntity> createLanguages() {
    return [
      const LanguageEntity(
        code: 'en',
        name: 'English',
        translator: EnTranslator(),
      ),
      const LanguageEntity(
        code: 'es',
        name: 'Español',
        translator: EsTranslator(),
      ),
    ];
  }
}

import 'package:flutter/widgets.dart';
import 'package:githubapp/core/language/translator/app_translator.dart';
import 'package:githubapp/injection/injection.dart';

class Translator {
  static AppTranslator findTranslator(BuildContext context) {
    return getIt<AppTranslator>(param1: context);
  }
}

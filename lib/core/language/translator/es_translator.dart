import 'package:githubapp/core/language/translator/app_translator.dart';

class EsTranslator extends AppTranslator {
  const EsTranslator();

  @override
  String get textAuthored => 'escritor';

  @override
  String get textCommits => 'Compromisos';

  @override
  String get textDays => 'dias';

  @override
  String get textHours => 'h';

  @override
  String get textMinutes => 'min';

  @override
  String get textSeconds => 'seg';
}

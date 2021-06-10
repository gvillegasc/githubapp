import 'package:githubapp/core/language/translator/app_translator.dart';

class EnTranslator extends AppTranslator {
  const EnTranslator();

  @override
  String get textAuthored => 'authored';

  @override
  String get textCommits => 'Commits';

  @override
  String get textDays => 'days';

  @override
  String get textHours => 'h';

  @override
  String get textMinutes => 'min';

  @override
  String get textSeconds => 'sec';
}

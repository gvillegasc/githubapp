import 'package:flutter_translation/flutter_translation.dart';

abstract class AppTranslator extends ITranslator {
  const AppTranslator();

  String get textCommits;
  String get textAuthored;
  String get textSeconds;
  String get textMinutes;
  String get textHours;
  String get textDays;
}

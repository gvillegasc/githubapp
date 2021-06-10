import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String prefLanguage = 'LANGUAGE';
  static const String prefDarkMode = 'DARK_MODE';
}

abstract class LocalDataSource {
  Future<String> getLanguage();
  Future<String> saveLanguage(String languageCode);
}

class LocalDataSourceImpl extends LocalDataSource {
  LocalDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<String> saveLanguage(String languageCode) async {
    await sharedPreferences.setString(Preferences.prefLanguage, languageCode);
    return languageCode;
  }

  @override
  Future<String> getLanguage() async {
    return sharedPreferences.getString(Preferences.prefLanguage) ?? 'es';
  }
}

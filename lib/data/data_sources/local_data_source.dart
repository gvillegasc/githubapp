import 'package:githubapp/core/error/exceptions.dart';
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
    try {
      await sharedPreferences.setString(Preferences.prefLanguage, languageCode);
      return languageCode;
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<String> getLanguage() async {
    try {
      final language =
          sharedPreferences.getString(Preferences.prefLanguage) ?? 'es';
      return language;
    } on CacheException {
      throw CacheException();
    }
  }
}

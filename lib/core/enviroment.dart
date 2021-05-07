import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

class Enviroment {
  Enviroment() {
    loadEnvFile();
  }
  Enviroment._internal();
  static final Enviroment _instance = Enviroment._internal();
  static Enviroment get instance => _instance;

  static String pathEnv = 'assets/env/.env.dev';

  Future<Map<String, String>> loadEnvFile() async {
    await dotenv.load(fileName: pathEnv);
    return dotenv.env;
  }
}

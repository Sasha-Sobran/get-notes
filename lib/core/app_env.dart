import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  static String get apiUrl => dotenv.env['API_URL']!;
}

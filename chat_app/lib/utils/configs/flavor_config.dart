import 'package:chat_app/utils/enums/env_enum.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FlavorConfig {
  final FlavorEnvEnum env;

  FlavorConfig({required this.env});

  static String get baseUrl => dotenv.get("BASE_URL");
  static String get kPREF => dotenv.get("KPREF");
}

import 'package:chat_app/main.dart';
import 'package:chat_app/utils/configs/di.dart';
import 'package:chat_app/utils/configs/flavor_config.dart';
import 'package:chat_app/utils/enums/env_enum.dart';

Future<void> main() async {
  configureDependencies();
  mainCommon(FlavorConfig(env: FlavorEnvEnum.dev));
}

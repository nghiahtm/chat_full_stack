import 'package:chat_app/main.dart';
import 'package:chat_app/utils/configs/di.dart';
import 'package:chat_app/utils/configs/flavor_config.dart';
import 'package:chat_app/utils/enums/env_enum.dart';

void mainProd(String env) {
  configureDependencies();

  mainCommon(FlavorConfig(env: FlavorEnvEnum.dev));
}

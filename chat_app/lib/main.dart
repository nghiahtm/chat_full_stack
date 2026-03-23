import 'package:chat_app/app/app.dart';
import 'package:chat_app/utils/configs/flavor_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> mainCommon(FlavorConfig flavor) async {
  await dotenv.load(fileName: "assets/env/.${flavor.env.name}.env");
  runApp(const MyApp());
}

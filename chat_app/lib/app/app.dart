import 'package:chat_app/app/routes/app_route.dart';
import 'package:chat_app/utils/themes/app_color.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      title: 'Chat app',
      routerConfig: appRouter.config(),
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: AppColor.primary),
        inputDecorationTheme: InputDecorationTheme(
          // Default fill color
          fillColor: AppColor.lightPasent,

          filled: true, // Must be true for fillColor to work
          // Default border style
          border: OutlineInputBorder(),

          // Colors for various states
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primary),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.lightPasent),
            borderRadius: BorderRadius.circular(16),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(16),
          ),

          // Default hint text style
          hintStyle: TextStyle(color: AppColor.lightPasent),
        ),
      ),
    );
  }
}

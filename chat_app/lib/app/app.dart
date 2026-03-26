import 'package:chat_app/app/bloc/app_bloc.dart';
import 'package:chat_app/app/bloc/app_event.dart';
import 'package:chat_app/app/bloc/app_state.dart';
import 'package:chat_app/app/routes/app_route.dart';
import 'package:chat_app/utils/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.instance.get<AppRouter>();

    return BlocProvider(
      create: (_) => GetIt.instance.get<AppBloc>(),
      child: KeyboardVisibilityProvider(
        child: Builder(
          builder: (context) {
            final bool isKeyboardVisible =
                KeyboardVisibilityProvider.isKeyboardVisible(context);
            context.read<AppBloc>().add(
              ShowHiddenKeyboardEvent(isShowKeyboard: isKeyboardVisible),
            );
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
          },
        ),
      ),
    );
  }
}

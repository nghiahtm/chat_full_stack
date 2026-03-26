import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/splash/bloc/splash_bloc.dart';
import 'package:chat_app/app/pages/splash/bloc/splash_event.dart';
import 'package:chat_app/app/pages/splash/bloc/splash_state.dart';
import 'package:chat_app/app/widgets/app_button.dart';
import 'package:chat_app/app/widgets/app_scaffold.dart';
import 'package:chat_app/utils/configs/di.dart';
import 'package:chat_app/utils/constant/image.dart';
import 'package:chat_app/utils/constant/path.dart';
import 'package:chat_app/utils/themes/app_color.dart';
import 'package:chat_app/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SpashPage extends StatelessWidget implements AutoRouteWrapper {
  const SpashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listenWhen: (pre, cur) => cur.isHasToken,
      listener: (context, state) {
        context.router.replacePath(PathConstant.home);
      },
      child: AppScaffold(
        paddingChild: EdgeInsets.zero,
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(ImageConstants.splash),
              const Spacer(),
              Text('Chat app', style: TextStyleThemes.title),
              const Spacer(),
              Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      onPressed: () {
                        context.router.pushPath(PathConstant.login);
                      },
                      child: const Text('Sign in'),
                    ),
                    AppButton(
                      onPressed: () {
                        context.router.pushPath(PathConstant.signup);
                      },
                      backgroundColor: AppColor.white,
                      foregroundColor: AppColor.primary,
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashBloc>()..add(SplashInitEvent()),
      child: this,
    );
  }
}

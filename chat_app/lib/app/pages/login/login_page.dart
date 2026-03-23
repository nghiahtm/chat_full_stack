import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/login/bloc/login_bloc.dart';
import 'package:chat_app/app/pages/login/bloc/login_event.dart';
import 'package:chat_app/app/widgets/app_button.dart';
import 'package:chat_app/app/widgets/app_scaffold.dart';
import 'package:chat_app/utils/configs/di.dart';
import 'package:chat_app/utils/constant/image.dart';
import 'package:chat_app/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      paddingChild: EdgeInsets.zero,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(ImageConstants.placeHolder),
            const Spacer(),
            Text('Login', style: TextStyleThemes.title),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 300,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                        GetAuthorizeEvent(userName: '', password: ''),
                      );
                    },
                    child: Text('Login'),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<LoginBloc>(), child: this);
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/login/bloc/login_bloc.dart';
import 'package:chat_app/app/pages/login/bloc/login_event.dart';
import 'package:chat_app/app/pages/login/bloc/login_state.dart';
import 'package:chat_app/app/pages/login/data/auth_dto.dart';
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
                      counterText: '',
                    ),
                    onChanged: (value) {},
                    maxLength: 40,
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) =>
                        current is ObsecurePasswordState,
                    builder: (context, state) {
                      return TextFormField(
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          suffixIcon: IconButton(
                            icon:
                                state is ObsecurePasswordState && !state.obscure
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: AppColor.white,
                            onPressed: () {
                              context.read<LoginBloc>().add(
                                ObsecurePasswordEvent(
                                  obscure: state is ObsecurePasswordState
                                      ? state.obscure
                                      : true,
                                ),
                              );
                            },
                          ),
                        ),
                        obscureText: state is ObsecurePasswordState
                            ? state.obscure
                            : true,

                        onChanged: (value) {},
                        maxLength: 40,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocConsumer<LoginBloc, LoginState>(
                    listenWhen: (previous, current) => current is LoginSuccess,
                    listener: (context, state) => {
                      if (state is LoginSuccess)
                        {context.router.pushPath(PathConstant.home)},
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const CircularProgressIndicator();
                      }
                      return AppButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(
                            GetAuthorizeEvent(
                              authDto: AuthDto(
                                username: 'username',
                                password: 'password',
                              ),
                            ),
                          );
                        },
                        child: Text('Login'),
                      );
                    },
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

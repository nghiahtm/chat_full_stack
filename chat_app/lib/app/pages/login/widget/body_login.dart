import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/bloc/app_bloc.dart';
import 'package:chat_app/app/bloc/app_state.dart';
import 'package:chat_app/app/pages/login/bloc/login_bloc.dart';
import 'package:chat_app/app/pages/login/bloc/login_event.dart';
import 'package:chat_app/app/pages/login/bloc/login_state.dart';
import 'package:chat_app/app/pages/login/data/auth_dto.dart';
import 'package:chat_app/app/widgets/app_button.dart';
import 'package:chat_app/app/widgets/app_text_field.dart';
import 'package:chat_app/utils/constant/image.dart';
import 'package:chat_app/utils/constant/path.dart';
import 'package:chat_app/utils/themes/app_color.dart';
import 'package:chat_app/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyLoginWidget extends StatefulWidget {
  const BodyLoginWidget({super.key});

  @override
  State<BodyLoginWidget> createState() => _BodyLoginWidgetState();
}

class _BodyLoginWidgetState extends State<BodyLoginWidget> {
  final keyForm = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.viewInsetsOf(context).bottom;
    return SafeArea(
      child: Center(
        child: BlocSelector<AppBloc, AppState, bool>(
          selector: (state) {
            return state.isHiddenKeyboard;
          },
          builder: (context, isHiddenKeyboard) {
            return Column(
              children: [
                const Spacer(),
                Flexible(
                  flex: isHiddenKeyboard ? 4 : 5,
                  child: Image.asset(ImageConstants.placeHolder),
                ),
                const Spacer(),
                Text('Login', style: TextStyleThemes.title),
                const Spacer(),
                AnimatedContainer(
                  width: double.infinity,
                  duration: const Duration(milliseconds: 200), // T
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  padding: EdgeInsets.all(
                    16,
                  ).copyWith(bottom: isHiddenKeyboard ? (keyboardHeight) : 0),
                  child: Form(
                    key: keyForm,
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return AppTextField(
                                enabled: state is! LoginLoading,
                                controller: usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter username';
                                  }
                                  if (value.length < 6) {
                                    return 'Username must be at least 6 characters';
                                  }
                                  return null;
                                },
                                labelText: 'Username',
                                onChanged: (value) {
                                  context.read<LoginBloc>().add(
                                    ShowOrHideClearTextUsernameEvent(
                                      isHasText: value.isNotEmpty,
                                    ),
                                  );
                                },
                                suffixIcon: BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    if (state
                                            is ShowOrHideClearTextUsernameState &&
                                        state.isHasText) {
                                      return IconButton(
                                        onPressed: () {
                                          usernameController.clear();
                                          context.read<LoginBloc>().add(
                                            ShowOrHideClearTextUsernameEvent(
                                              isHasText: false,
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.clear,
                                          color: AppColor.white,
                                        ),
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: AppColor.white,
                                ),
                              );
                            },
                          ),
                          BlocBuilder<LoginBloc, LoginState>(
                            buildWhen: (previous, current) =>
                                previous != current,
                            builder: (context, state) {
                              return AppTextField(
                                controller: passwordController,
                                enabled: state is! LoginLoading,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: AppColor.white,
                                ),
                                labelText: 'Password',
                                obscureText: state is ObsecurePasswordState
                                    ? state.obscure
                                    : true,
                                suffixIcon: IconButton(
                                  icon:
                                      state is ObsecurePasswordState &&
                                          !state.obscure
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                          BlocConsumer<LoginBloc, LoginState>(
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
                                  if (keyForm.currentState?.validate() !=
                                      true) {
                                    return;
                                  }
                                  context.read<LoginBloc>().add(
                                    GetAuthorizeEvent(
                                      authDto: AuthDto(
                                        username: usernameController.text,
                                        password: passwordController.text,
                                      ),
                                    ),
                                  );
                                },
                                child: Text('Login'),
                              );
                            },
                          ),
                          const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

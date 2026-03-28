import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/sign_up/bloc/signup_bloc.dart';
import 'package:chat_app/app/pages/sign_up/bloc/signup_event.dart';
import 'package:chat_app/app/pages/sign_up/bloc/signup_state.dart';
import 'package:chat_app/app/pages/sign_up/data/user_req_dto.dart';
import 'package:chat_app/app/widgets/app_button.dart';
import 'package:chat_app/app/widgets/app_text_field.dart';
import 'package:chat_app/utils/constant/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyCreateWidget extends StatefulWidget {
  const BodyCreateWidget({super.key});

  @override
  State<BodyCreateWidget> createState() => _BodyCreateWidgetState();
}

class _BodyCreateWidgetState extends State<BodyCreateWidget> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listenWhen: (pre, cur) => pre.isCreateSuccess != cur.isCreateSuccess,
      listener: (context, state) {
        if (state.isCreateSuccess) {
          context.router.pop();
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          spacing: 16,
          children: [
            AppTextField(
              controller: _usernameController,
              labelText: 'Username',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username is required';
                }
                return null;
              },
            ),
            AppTextField(
              controller: _nameController,
              labelText: 'Full Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Full name is required';
                }
                return null;
              },
            ),
            AppTextField(
              controller: _emailController,
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
            ),
            AppTextField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }

                return null;
              },
            ),
            AppTextField(
              controller: _confirmPasswordController,
              labelText: 'Confirm Password',
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm Password is required';
                }
                if (value != _passwordController.text) {
                  return 'Confirm Password need equal Password';
                }
                return null;
              },
            ),
            AppButton(
              onPressed: () {
                final curState = formKey.currentState;
                if (!curState!.validate()) {
                  return;
                }
                context.read<SignupBloc>().add(
                  SignupCreateUserEvent(
                    UserReqDto(
                      username: _usernameController.text,
                      password: _passwordController.text,
                      confirmPassword: _confirmPasswordController.text,
                      email: _emailController.text,
                      fullName: _nameController.text,
                    ),
                  ),
                );
              },
              child: Text('Create Account'),
            ),
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

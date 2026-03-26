import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/widgets/app_button.dart';
import 'package:chat_app/app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class BodyCreateWidget extends StatefulWidget {
  const BodyCreateWidget({super.key});

  @override
  State<BodyCreateWidget> createState() => _BodyCreateWidgetState();
}

class _BodyCreateWidgetState extends State<BodyCreateWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        AppTextField(controller: _usernameController, labelText: 'Username'),
        AppTextField(controller: _nameController, labelText: 'Full Name'),
        AppTextField(
          controller: _passwordController,
          labelText: 'Password',
          obscureText: true,
        ),
        AppTextField(
          controller: _confirmPasswordController,
          labelText: 'Confirm Password',
          obscureText: true,
        ),
        AppButton(
          onPressed: () {
            context.router.pop();
          },
          child: Text('Create Account'),
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/sign_up/widget/body_create.dart';
import 'package:chat_app/app/widgets/app_button.dart';
import 'package:chat_app/app/widgets/app_scaffold.dart';
import 'package:chat_app/utils/constant/image.dart';
import 'package:chat_app/utils/themes/text_style.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpPage extends StatelessWidget implements AutoRouteWrapper {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      paddingChild: EdgeInsets.zero,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(ImageConstants.placeholderSignUp),
            const Spacer(),
            Text('Sign up', style: TextStyleThemes.title),
            const Spacer(),
            Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.all(16),
              child: BodyCreateWidget(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return this;
  }
}

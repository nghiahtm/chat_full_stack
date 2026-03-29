import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/bloc/app_bloc.dart';
import 'package:chat_app/app/bloc/app_state.dart';
import 'package:chat_app/app/pages/sign_up/bloc/signup_bloc.dart';
import 'package:chat_app/app/pages/sign_up/widget/body_create.dart';
import 'package:chat_app/app/widgets/app_scaffold.dart';
import 'package:chat_app/utils/configs/di.dart';
import 'package:chat_app/utils/constant/image.dart';
import 'package:chat_app/utils/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocSelector<AppBloc, AppState, bool>(
              selector: (state) => state.isHiddenKeyboard,
              builder: (_, isHiddenKeyboard) {
                if (isHiddenKeyboard) {
                  return const SizedBox.shrink();
                }
                return Flexible(
                  flex: 3,
                  child: Image.asset(ImageConstants.placeholderSignUp),
                );
              },
            ),
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
              child: SingleChildScrollView(
                padding: EdgeInsetsGeometry.zero,
                child: BodyCreateWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return BlocProvider(create: (context) => getIt<SignupBloc>(), child: this);
  }
}

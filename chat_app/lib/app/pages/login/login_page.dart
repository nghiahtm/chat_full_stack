import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/bloc/app_bloc.dart';
import 'package:chat_app/app/pages/login/bloc/login_bloc.dart';
import 'package:chat_app/app/pages/login/widget/body_login.dart';
import 'package:chat_app/app/widgets/app_scaffold.dart';
import 'package:chat_app/utils/configs/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(paddingChild: EdgeInsets.zero, body: BodyLoginWidget());
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (_) => getIt<LoginBloc>(), child: this);
  }
}

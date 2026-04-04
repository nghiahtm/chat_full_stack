import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/home/page/user/page/user_info/bloc/user_info_bloc.dart';
import 'package:chat_app/app/pages/home/page/user/page/user_info/bloc/user_info_event.dart';
import 'package:chat_app/app/pages/home/page/user/page/user_info/bloc/user_info_state.dart';
import 'package:chat_app/app/pages/home/page/user/page/user_info/widgets/user_info_body_wdiget.dart';
import 'package:chat_app/app/widgets/app_scaffold.dart';
import 'package:chat_app/utils/configs/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UserInfoPage extends StatelessWidget implements AutoRouteWrapper {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(appBar: AppBar(), body: UserInfoBodyWidget());
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserInfoBloc>(),
      child: this,
    );
  }
}

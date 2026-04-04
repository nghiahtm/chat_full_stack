import 'package:auto_route/auto_route.dart';
import 'package:chat_app/app/pages/home/page/user/widget/user_body.dart';
import 'package:chat_app/utils/themes/text_style.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget implements AutoRouteWrapper {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("User", style: TextStyleThemes.title),
        Expanded(child: UserBodyWidget()),
      ],
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return this;
  }
}

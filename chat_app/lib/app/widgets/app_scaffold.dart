import 'package:chat_app/utils/themes/app_color.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.backgroundColor,
    this.paddingChild,
  });
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final EdgeInsets? paddingChild;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColor.primary,
      appBar: appBar,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: paddingChild ?? const EdgeInsets.all(16.0),
        child: body,
      ),
    );
  }
}

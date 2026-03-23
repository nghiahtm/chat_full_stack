import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.backgroundColor = Colors.deepPurpleAccent,
    this.paddingChild,
  });
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final EdgeInsets? paddingChild;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: Padding(
        padding: paddingChild ?? const EdgeInsets.all(16.0),
        child: body,
      ),
    );
  }
}

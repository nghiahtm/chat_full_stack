import 'package:chat_app/utils/themes/app_color.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor = Colors.white,
    this.child,
  });
  final Function() onPressed;
  final Color? backgroundColor;
  final Color foregroundColor;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.primary,
          foregroundColor: foregroundColor,
        ),
        child: child,
      ),
    );
  }
}

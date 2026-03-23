import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = Colors.deepPurple,
    this.foregroundColor = Colors.white,
    this.child,
  });
  final Function() onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: child,
      ),
    );
  }
}

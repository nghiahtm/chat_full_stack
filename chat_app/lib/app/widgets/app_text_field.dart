import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.obscureText = false,
    this.suffixIcon,
    this.labelText,
    this.onChanged,
    this.validator,
    this.controller,
    this.enabled,
    this.prefixIcon,
  });
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? enabled;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      decoration: InputDecoration(
        counterText: '',
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
      ),
      obscureText: widget.obscureText,

      onChanged: widget.onChanged,
      validator: widget.validator,
      maxLength: 40,
    );
  }
}

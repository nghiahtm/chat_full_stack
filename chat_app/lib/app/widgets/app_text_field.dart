import 'package:chat_app/utils/themes/text_style.dart';
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
    this.keyboardType,
    this.hintText,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
  });
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? enabled;
  final TextInputType? keyboardType;
  final String? hintText;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        counterText: '',
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: TextStyleThemes.body.copyWith(color: Colors.grey),
      ),
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      validator: widget.validator,
      maxLength: 40,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}

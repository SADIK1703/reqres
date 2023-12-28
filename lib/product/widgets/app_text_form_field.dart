import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final Function()? onFieldComplete;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isObscure;
  final bool enabled;
  final int maxLines;
  final FocusNode? focusNode;
  final double? radius;
  final bool? autoFocus;
  final AutovalidateMode? autovalidateMode;
  final VoidCallback? onTapOutside;
  const AppTextFormField({
    final Key? key,
    this.hintText,
    this.onTap,
    this.onFieldComplete,
    this.onFieldSubmitted,
    this.labelText,
    this.validator,
    this.onChanged,
    this.controller,
    this.isObscure = false,
    this.enabled = true,
    this.maxLines = 1,
    this.focusNode,
    this.radius = 8,
    this.autoFocus = false,
    this.autovalidateMode,
    this.onTapOutside,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      onTapOutside: (final _) => onTapOutside?.call(),
      enabled: enabled,
      onTap: onTap,
      focusNode: focusNode,
      onEditingComplete: onFieldComplete,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        errorMaxLines: 3,
        isDense: true,
        hintText: hintText,
        labelText: labelText,
        filled: true,
        enabled: enabled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
      ),
      autofocus: autoFocus!,
      maxLines: maxLines,
      obscureText: isObscure,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
    );
  }
}

import 'package:flutter/material.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.decoration
  });

  final String? label;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: AppColors.inputBorderColorUnfocused),
    );
    final defaultFocusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: AppColors.inputBorderColorFocused),
    );

    final inputDecoration = (decoration ?? const InputDecoration()).copyWith(
      hintText: decoration?.hintText ?? hintText,
      hintStyle: decoration?.hintStyle ?? AppTextStyles.hint,
      contentPadding: decoration?.contentPadding ?? const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: decoration?.border ?? defaultBorder,
      enabledBorder: decoration?.enabledBorder ?? (decoration?.border == null ? defaultBorder : null),
      focusedBorder: decoration?.focusedBorder ?? (decoration?.border == null ? defaultFocusedBorder : null),
      filled: decoration?.filled,
      fillColor: decoration?.fillColor,
      labelText: decoration?.labelText,
      prefixIcon: decoration?.prefixIcon,
      suffixIcon: decoration?.suffixIcon,
      prefixText: decoration?.prefixText,
      suffixText: decoration?.suffixText,
      helperText: decoration?.helperText,
      errorText: decoration?.errorText,
      counterText: decoration?.counterText,
      isDense: decoration?.isDense,
      alignLabelWithHint: decoration?.alignLabelWithHint,
      constraints: decoration?.constraints,
    );

    return label != null 
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label!,
              style: AppTextStyles.label,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              enabled: decoration?.enabled ?? true,
              decoration: inputDecoration,
            ),
          ],
        ) 
      : TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          enabled: decoration?.enabled ?? true,
          decoration: inputDecoration,
        );
  }
}

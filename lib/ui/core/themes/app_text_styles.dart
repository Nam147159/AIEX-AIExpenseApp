import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTextStyles {
  static const label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.labelColor
  );

  static const hint = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.hintColor
  );
}
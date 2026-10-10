import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography scale from Stitch config.
class AppTextStyles {
  AppTextStyles._();

  static const String _font = 'Inter';

  static const headlineXl = TextStyle(
    fontFamily: _font, fontSize: 36, height: 44 / 36,
    letterSpacing: -0.025, fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const headlineLg = TextStyle(
    fontFamily: _font, fontSize: 24, height: 32 / 24,
    letterSpacing: -0.02, fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const headlineMd = TextStyle(
    fontFamily: _font, fontSize: 20, height: 28 / 20,
    letterSpacing: -0.015, fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const headlineSm = TextStyle(
    fontFamily: _font, fontSize: 16, height: 24 / 16,
    letterSpacing: -0.01, fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const bodyLg = TextStyle(
    fontFamily: _font, fontSize: 16, height: 24 / 16,
    letterSpacing: -0.005, fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
  );

  static const bodyMd = TextStyle(
    fontFamily: _font, fontSize: 14, height: 20 / 14,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
  );

  static const bodySm = TextStyle(
    fontFamily: _font, fontSize: 13, height: 18 / 13,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
  );

  static const labelMd = TextStyle(
    fontFamily: _font, fontSize: 13, height: 18 / 13,
    letterSpacing: 0.005, fontWeight: FontWeight.w500,
    color: AppColors.onSurface,
  );

  static const labelSm = TextStyle(
    fontFamily: _font, fontSize: 12, height: 16 / 12,
    letterSpacing: 0.01, fontWeight: FontWeight.w500,
    color: AppColors.onSurface,
  );

  static const codeSm = TextStyle(
    fontFamily: _font, fontSize: 12, height: 16 / 12,
    letterSpacing: 0.02, fontWeight: FontWeight.w500,
    color: AppColors.onSurface,
  );
}
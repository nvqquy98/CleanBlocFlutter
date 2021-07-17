import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../dimens/dimens.dart';

/// AppTextStyle format as follows:
/// s[fontSize][colorName][opacity][fontWeight]
/// Example: s18White50w400

class AppTextStyles extends TextStyle {
  const AppTextStyles._({
    required double fontSize,
    required Color color,
    required FontWeight fontWeight,
  }) : super(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        );

  factory AppTextStyles({
    required double fontSize,
    required Color color,
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      AppTextStyles._(fontSize: fontSize, color: color, fontWeight: fontWeight);

  static final s12Amaranth = AppTextStyles(
    fontSize: Dimens.sp(12),
    color: AppColors.amaranth,
  );

  static final s12Raven = AppTextStyles(
    fontSize: Dimens.sp(12),
    color: AppColors.raven,
  );

  static final s14Ghost = AppTextStyles(
    fontSize: Dimens.sp(14),
    color: AppColors.ghost,
  );

  static final s16Black = AppTextStyles(
    fontSize: Dimens.sp(16),
    color: AppColors.black,
  );
  static final s18BlackBold = AppTextStyles(
    fontSize: Dimens.sp(18),
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
}

import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.light(primary: AppColors.pacificBlue),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: ColorScheme.dark(primary: AppColors.amaranth),
  );
}

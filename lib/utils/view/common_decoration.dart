import 'package:flutter/material.dart';
import '../../presentation/ui/resource/colors/app_colors.dart';

class CommonDecoration {
  static BoxShadow boxShadow() => BoxShadow(
    color: AppColors.shadow,
    spreadRadius: 2,
    blurRadius: 3,
    offset: const Offset(0, 4),
  );
}
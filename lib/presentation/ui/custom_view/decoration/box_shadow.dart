import 'package:flutter/material.dart';

import '../../resource/colors/app_colors.dart';

BoxShadow boxShadow() => BoxShadow(
      color: AppColors.downriver8,
      spreadRadius: 2,
      blurRadius: 3,
      offset: const Offset(0, 4),
    );

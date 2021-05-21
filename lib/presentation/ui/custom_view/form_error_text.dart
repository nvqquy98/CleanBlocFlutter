import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class FormErrorText extends StatelessWidget {
  final String error;

  const FormErrorText({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.amaranth),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        error,
        style: TextStyle(fontSize: 12, color: AppColors.amaranth),
      ),
    );
  }
}

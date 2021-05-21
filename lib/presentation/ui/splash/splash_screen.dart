import '../../../utils/app_color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Image.asset(
        'assets/images/splash.jpg',
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

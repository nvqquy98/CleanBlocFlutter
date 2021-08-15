import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String resetPasswordToken;

  const ResetPasswordScreen({required this.resetPasswordToken});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(resetPasswordToken),
        ),
      ),
    );
  }
}

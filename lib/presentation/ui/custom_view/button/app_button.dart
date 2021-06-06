import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double width;
  final String text;
  final Gradient? enableGradient;
  final Gradient? disableGradient;
  final bool isEnable;
  final VoidCallback onPressed;

  const AppButton(
      {Key? key,
      this.width = 265,
      required this.text,
      this.enableGradient,
      this.disableGradient,
      this.isEnable = true,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnable ? onPressed : null,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(56)),
      ),
      child: Ink(
        decoration: BoxDecoration(
            gradient: isEnable ? enableGradient : disableGradient,
            borderRadius: BorderRadius.circular(56)),
        child: Container(
          width: width,
          height: 50,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

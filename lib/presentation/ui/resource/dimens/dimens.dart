import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  const Dimens._();
  factory Dimens() => const Dimens._();

  /// font size
  static double sp(double fontSize) => fontSize.sp;

  /// width
  static double w(double width) => width.w;

  /// height
  static double h(double height) => height.h;

  /// radius
  static double r(double radius) => radius.r;

  /// screen width
  static final screenWidth = 1.sw;

  /// screen height
  static final screenHeight = 1.sh;
}

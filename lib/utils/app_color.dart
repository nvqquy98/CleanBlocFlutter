import 'package:flutter/material.dart';

class AppColors {
  static final Color black = HexColor('#000000');
  static final Color athensGrayApprox = HexColor('#EFEFF0');
  static final Color mineShaft = HexColor('#222222');
  static final Color mineShaft30 = HexColor('#4D222222');
  static final Color white = HexColor('#FFFFFF');
  static final Color black50 = HexColor('#80000000');
  static final Color athensGray = HexColor('#F9FAFB');
  static final Color lightAthensGray = HexColor('#F8F9FA');
  static final Color darkAthensGray = HexColor('#ECEFF2');
  static final Color alabaster = HexColor('#F8F8F8');
  static final Color iron = HexColor('#CCD2D9');
  static final Color whiteAlto = HexColor('#D8D8D8');
  static final Color downriver10 = HexColor('#1A0A2953');
  static final Color pacificBlue = HexColor('#07ABB8');
  static final Color persianGreen = HexColor('#08B794');
  static final Color cerulean = HexColor('#069EDD');
  static final Color silver = HexColor('#C8C8C8');
  static final Color silverApprox = HexColor('#CDCDCD');
  static final Color cinnabar = HexColor('#F0483C');
  static final Color azureRadiance = HexColor('#007AFF');
  static final Color sunsetOrange = HexColor('#FF483C');
  static final Color doveGray = HexColor('#707070');
  static final Color wildSand = HexColor('#EAEFF4');
  static final Color grayChateau = HexColor('#9AA0A7');
  static final Color alto = HexColor('#E0E0E0');
  static final Color white50 = HexColor('#80ffffff');
  static final Color white70 = HexColor('#B3FFFFFF');
  static final Color amaranth = HexColor('#E21B51');
  static final Color raven = HexColor('#757B83');
  static final Color ghost = HexColor('#CBCED3');
  static final Color aluminium = HexColor('#ACB1B9');
  static final Color rollingStone = HexColor('#6B787E');
  static final Color mystic = HexColor('#E9EDF2');
  static final Color flamingo = HexColor('#F5483D');
  static final Color flamingo15 = HexColor('#25F5483D');
  static final Color flamingo30 = HexColor('#4DF5483D');
  static final Color coolGrey = HexColor('#9AA09D');
  static final Color dodgerBlue = HexColor('#3F91FF');
  static final Color ashGray = HexColor('#4C4C4C');
  static final Color mimeShaftApprox = HexColor('#252525');
  static final Color black10 = HexColor('#1A000000');
  static final Color darkDodgerBlue = HexColor('#1981FB');
  static final Color redOrange = HexColor('#FA3826');
  static final Color dustyGray = HexColor('#999999');
  static final Color pacificBlue80 = HexColor('#CC07ABB8');
  static final Color gray = HexColor('#E4E7EB');
  static final Color darkIndigo24 = HexColor('#3D0D1A45');
  static final Color darkGrey = HexColor('#252A2B');
  static final Color shadow = HexColor('#0A2953').withOpacity(0.08);

  static final gradient =
      LinearGradient(colors: [AppColors.cerulean, AppColors.persianGreen]);
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(getColorFromHex(hexColor));

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

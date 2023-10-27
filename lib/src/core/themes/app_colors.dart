import 'package:flutter/material.dart';

abstract class AppColors {
//theme primary color
  static const Color primary = const Color(0xFF7472E0);

  //text colors
  static const Color textDark = const Color(0xFF222222);
  static const Color textLightDark = Color(0xff666666);
  static const Color textLight = const Color(0xFFCFCFCF);
  static const Color textGrey = const Color(0xFF999999);
  static const Color shadow = const Color(0xFFF4F6F9);
  static const Color textBlue = const Color(0xFF3E64D2);
  static const Color lightWhite = const Color(0xffD5D5F6);

  //status color
  static const Color statusRed = const Color(0xFFD23E3E);
  static const Color statusLightRed = const Color(0xFFF9E3E3);
  static const Color statusGreen = const Color(0xFF4CD964);
  static const Color statusOrange = const Color(0xFFFF9212);

  // background colors
  static const Color scaffoldBackground = const Color(0xFFF5F5F7);
  static const Color fabRedBackground = const Color(0xFFFD6464);
  static const Color brandBackground = const Color(0xFFEBEFF9);
  static const Color brandBackgroundLight = const Color(0xFFABC4F1);
  static const Color secondaryButtonBackground = const Color(0xFFEBEBEB);

  //default
  static const Color border = const Color(0xFFD6D6D6);
  static const Color dashBorder = const Color(0xFFABC4F1);
  static const Color white = const Color(0xFFFFFFFF);
  static const Color black = const Color(0xFF000000);
  static const Color transparent = Colors.transparent;
  static const fadedBlack = Color(0x0000000D);
  static const dividerColor = Color(0xff7472E0);
  static const Color lightPrimary = Color(0xff09A8C8);

  static const Color softPrimary = Color(0xff150B3D);

  static const Color softBlack = Color(0xff524B6B);

  static const Color softGrey = Color(0xffD6CDFE);
  static const Color textFieldLabel = Color(0xffEFF2F6);
  static const Color greyColor = const Color(0xFFDDDDDD);
  // F4F6FA
  static const Color lightGrey = const Color(0XFFF4F6FA);
  static const Color yellow = const Color(0xffFCC515);

  static const LinearGradient userGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.yellow,
      AppColors.statusOrange,
    ],
  );

  // text
  static const Color softTextGrey = Color(0xff4C4C4C);
  // 929292
  static const Color ironGrey = Color(0xff929292);
}

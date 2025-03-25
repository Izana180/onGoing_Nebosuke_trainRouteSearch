import 'package:flutter/material.dart';
// アプリ内で用いる色定義
class CustomColors {
  static const baseWhite = Colors.white;
  static const minBlack = Color(0xff333333);
  static const thinBlack = Color(0xff555555);
  static const midThinBlack = Color(0xff222222);
  static const black = Colors.black;
  static const baseGray = Color(0xffa6a6a6);
  static const baseGray2 = Color(0xffe5e5e5);
  static const baseGray3 = Color(0xff8b8b8b);
  static const baseGray4 = Color(0xffd9d9d9);
  static const baseGray5 = Color(0xdd9999a3);
  static const grassGreen = Color(0xff1b701e);
  static const wineRed = Color(0xff701b1b);
  static const deepBlue = Color(0xff1b1b6f);
  static const strongRed = Color(0xffe91917);

  // パーツごとの色定義
  static const baseBackground = baseWhite;
  static const disableBackground = baseGray;
  static const minBlackBackground = minBlack;
  static const thinBlackBackground = thinBlack;
  static const blackBackground = black;

  static const requiredTextColor = strongRed;
  static const textColor = black;
  static const inputBlack = midThinBlack;

  static const departureButtonColor = grassGreen;
  static const arrivalButtonColor = wineRed;
}
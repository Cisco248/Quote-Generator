import 'package:flutter/material.dart';
import 'package:text_qoute/constants/app_constant.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: QColors.primary,
    appBarTheme: AppBarTheme(
        backgroundColor: QColors.light,
        iconTheme: IconThemeData(color: QColors.primary, size: 24),
        titleTextStyle: TextStyle(color: QColors.dark)),
    scaffoldBackgroundColor: QColors.light,
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: QColors.primary,
            iconColor: QColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: QColors.buttonBackground, iconSize: 24),
  );

  static final darkTheme = ThemeData(
      primaryColor: QColors.primary,
      appBarTheme: AppBarTheme(
          backgroundColor: QColors.dark,
          iconTheme: IconThemeData(color: QColors.primary, size: 24),
          titleTextStyle: TextStyle(color: QColors.light)),
      scaffoldBackgroundColor: QColors.dark,
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: QColors.primary,
              iconColor: QColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: QColors.buttonBackground, iconSize: 24));
}

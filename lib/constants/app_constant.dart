import 'package:flutter/material.dart';
import 'package:text_qoute/pages/add_data.dart';
import 'package:text_qoute/pages/generate_page.dart';
import 'package:text_qoute/pages/home_screen.dart';
import 'package:text_qoute/pages/start_page/slash.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTheme = const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
    headlineSmall: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
    titleSmall: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),
    bodyLarge: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black54),
    labelLarge: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelMedium: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black54),
  );

  static TextTheme darkTheme = const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
    bodyLarge: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white70),
    labelLarge: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white70),
  );
}

class QColors {
  QColors._();

  // Primary & Secondary Colors
  static const Color primary = Color(0xFFF7921E);
  static const Color secondary = Color.fromARGB(255, 255, 255, 255);

  // Text Colors
  static const Color textPrimary = Color(0xFF0A66C2);
  static const Color textSecondary = Color(0xFF34A853);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textBlack = Color(0xFF000000);
  static const Color textGrey = Color(0xFF757575);

  // Background Colors
  static const Color light = Color(0xFFFAFAFA);
  static const Color dark = Color(0xFF121212);
  static const Color buttonBackground = Color.fromARGB(255, 255, 195, 126);
  static const Color secondaryBackground = Color(0xFFF5F5F5);

  // Container Colors
  static const Color lightContainer = Color(0xFFF0F0F0);
  static const Color darkContainer = Color(0xFF1E1E1E);

  // Border Colors
  static const Color lightBorder = Color(0xFFE6E6E6);
  static const Color darkBorder = Color(0xFF303030);
  static const Color buttonBorder = primary;

  // Button Colors
  static const Color primaryButton = primary;
  static const Color secondaryButton = secondary;
  static const Color deleteButton = Color(0xFFD32F2F);
  static const Color disabledButton = Color(0xFFBDBDBD);

  // Icon Colors
  static const Color iconPrimary = primary;
  static const Color iconSecondary = secondary;
}

class AppRoutes {
  AppRoutes._();

  static const String splashPage = '/';
  static const String homePage = 'home';
  static const String addQuote = '/add-quote';
  static const String generatePage = '/generate-page';

  static final routes = {
    splashPage: (context) => SplashPage(),
    homePage: (context) => Homescreen(),
    addQuote: (context) => AddUser(),
    generatePage: (context) => GenerateScreen()
  };
}

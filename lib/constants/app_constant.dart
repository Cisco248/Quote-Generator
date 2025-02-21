import 'package:flutter/material.dart';
import 'package:text_qoute/pages/add_data.dart';
import 'package:text_qoute/pages/generate_page.dart';
import 'package:text_qoute/pages/home_screen.dart';
import 'package:text_qoute/pages/start_page/slash.dart';

class QColors {
  QColors._();

  // Primary & Secondary Colors
  static const Color primary = Color(0xFFF7921E);
  static const Color secondary = Color.fromARGB(255, 255, 255, 255);

  // Background Colors
  static const Color light = Color(0xFFFAFAFA);
  static const Color dark = Color(0xFF121212);
  static const Color buttonBackground = Color.fromARGB(255, 255, 195, 126);
  static const Color secondaryBackground = Color(0xFFF5F5F5);

  // Container Colors
  static const Color lightContainer = Color(0xFFF0F0F0);
  static const Color darkContainer = Color(0xFF1E1E1E);

  // Button Colors
  static const Color primaryButton = primary;
  static const Color secondaryButton = secondary;
  static const Color deleteButton = Color(0xFFD32F2F);
  static const Color disabledButton = Color(0xFFBDBDBD);
}

class AppRoutes {
  static const String splashPage = '/';
  static const String homePage = 'home';
  static const String addQuote = '/add-quote';
  static const String generatePage = '/generate-page';

  static final routes = {
    splashPage: (context) => SplashPage(),
    homePage: (context) => HomeScreen(),
    addQuote: (context) => AddUser(),
    generatePage: (context) => GenerateScreen()
  };
}

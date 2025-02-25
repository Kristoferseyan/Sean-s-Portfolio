import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF283044);
  static const secondaryColor = Color(0xFF6474A2);
  static const textColor = Colors.white;
  static const buttonColor = Color(0xFF417492);
  static const backgroundColor = Color.fromARGB(255, 19, 26, 44);

  static const headerGradient = LinearGradient(
    colors: [
      Color(0xFF1C1F28),
      Color(0xFF2E3444),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: textColor),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 56, 65, 87),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: textColor),
    ),
  );

  static TextStyle get navTextStyle => const TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );
}

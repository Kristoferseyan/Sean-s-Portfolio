// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static const primaryColorDark = Color(0xFF60A5FA); 
  static const secondaryColorDark = Color(0xFF9CA3AF); 
  static const textColorDark = Color(0xFFF9FAFB); 
  static const backgroundColorDark = Color(0xFF111827); 
  static const surfaceColorDark = Color(0xFF1F2937); 
  static const cardColorDark = Color(0xFF1F2937); 

  
  static const primaryGradient = LinearGradient(
    colors: [
      Color(0xFF2563EB),
      Color(0xFF3B82F6),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const primaryGradientDark = LinearGradient(
    colors: [
      Color(0xFF3B82F6),
      Color(0xFF60A5FA),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const subtleGradient = LinearGradient(
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFF9FAFC),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const subtleGradientDark = LinearGradient(
    colors: [
      Color(0xFF111827),
      Color(0xFF1F2937),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const darkGradient = LinearGradient(
    colors: [
      Color(0xFF1F2937),
      Color(0xFF111827),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  
  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 15,
      spreadRadius: 1,
      offset: Offset(0, 4),
    ),
  ];

  static List<BoxShadow> get cardShadowDark => [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 15,
      spreadRadius: 0,
      offset: Offset(0, 4),
    ),
  ];


  static List<BoxShadow> get buttonShadowDark => [
    BoxShadow(
      color: primaryColorDark.withOpacity(0.25),
      blurRadius: 12,
      spreadRadius: 0,
      offset: Offset(0, 4),
    ),
  ];


  static List<BoxShadow> get profileShadowDark => [
    BoxShadow(
      color: primaryColorDark.withOpacity(0.25),
      blurRadius: 20,
      spreadRadius: 5,
      offset: Offset(0, 10),
    ),
  ];

  
  static TextStyle get headingLargeDark => GoogleFonts.poppins(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: textColorDark,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static TextStyle get headingMediumDark => GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textColorDark,
    letterSpacing: -0.5,
  );

  static TextStyle get headingSmallDark => GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: textColorDark,
  );

  static TextStyle get bodyLargeDark => GoogleFonts.poppins(
    fontSize: 16,
    color: textColorDark.withOpacity(0.8),
    height: 1.6,
  );

  static TextStyle get bodyMediumDark => GoogleFonts.poppins(
    fontSize: 15,
    color: textColorDark.withOpacity(0.8),
    height: 1.6,
  );

  static TextStyle get bodySmallDark => GoogleFonts.poppins(
    fontSize: 14,
    color: textColorDark.withOpacity(0.7),
    height: 1.5,
  );

  static TextStyle get captionDark => GoogleFonts.poppins(
    fontSize: 12,
    color: textColorDark.withOpacity(0.6),
  );

  static TextStyle get navTextStyleDark => GoogleFonts.poppins(
    color: textColorDark,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get buttonText => GoogleFonts.poppins(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get buttonTextDark => GoogleFonts.poppins(
    color: backgroundColorDark,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get tagTextDark => GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: primaryColorDark,
  );

  
  static ButtonStyle get primaryButtonStyleDark => ElevatedButton.styleFrom(
    backgroundColor: primaryColorDark,
    foregroundColor: backgroundColorDark,
    elevation: 0,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
  
  static ButtonStyle get secondaryButtonStyleDark => OutlinedButton.styleFrom(
    foregroundColor: primaryColorDark,
    side: BorderSide(color: primaryColorDark),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  
  static BoxDecoration get cardDecorationDark => BoxDecoration(
    color: cardColorDark,
    borderRadius: BorderRadius.circular(16),
    boxShadow: cardShadowDark,
    border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
  );

  static BoxDecoration get projectCardDecorationDark => BoxDecoration(
    color: cardColorDark,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 20,
        spreadRadius: 0,
        offset: Offset(0, 8),
      ),
    ],
  );

  
  static InputDecoration inputDecorationDark(String label, {String? hint, IconData? prefixIcon}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: secondaryColorDark) : null,
      labelStyle: bodyMediumDark.copyWith(color: secondaryColorDark),
      hintStyle: bodyMediumDark.copyWith(color: secondaryColorDark.withOpacity(0.6)),
      filled: true,
      fillColor: surfaceColorDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.05)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primaryColorDark, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }

  
  static BoxDecoration get badgeDecorationDark => BoxDecoration(
    color: primaryColorDark.withOpacity(0.2),
    borderRadius: BorderRadius.circular(20),
  );

  static BoxDecoration badgeDecorationWithColorDark(Color color) => BoxDecoration(
    color: color.withOpacity(0.2),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: color.withOpacity(0.3), width: 1),
  );

  
  static Duration get defaultAnimationDuration => Duration(milliseconds: 300);
  static Duration get longAnimationDuration => Duration(milliseconds: 500);

  
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1000;
  static const double desktopBreakpoint = 1440;

  
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacing2Xl = 48.0;
  static const double spacing3Xl = 64.0;

  
  static BorderRadius get borderRadiusSm => BorderRadius.circular(8);
  static BorderRadius get borderRadiusMd => BorderRadius.circular(12);
  static BorderRadius get borderRadiusLg => BorderRadius.circular(16);
  static BorderRadius get borderRadiusXl => BorderRadius.circular(24);
  static BorderRadius get borderRadiusFull => BorderRadius.circular(999);

  
  static BoxDecoration get sectionDecorationDark => BoxDecoration(
    color: cardColorDark,
    borderRadius: borderRadiusLg,
    border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
    boxShadow: cardShadowDark,
  );

  
  static List<BoxShadow> get hoverShadowDark => [
    BoxShadow(
      color: primaryColorDark.withOpacity(0.2),
      blurRadius: 25,
      spreadRadius: 0,
      offset: Offset(0, 10),
    ),
  ];

  
  static PageTransitionsTheme get pageTransitionsTheme => PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
    },
  );

  
  static ThemeData get darkTheme => ThemeData(
    primaryColor: primaryColorDark,
    colorScheme: ColorScheme.dark(
      primary: primaryColorDark,
      secondary: secondaryColorDark,
      surface: surfaceColorDark,
      background: backgroundColorDark,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: backgroundColorDark,
    textTheme: TextTheme(
      displayLarge: headingLargeDark,
      displayMedium: headingMediumDark,
      displaySmall: headingSmallDark,
      bodyLarge: bodyLargeDark,
      bodyMedium: bodyMediumDark,
      bodySmall: bodySmallDark,
      labelLarge: buttonTextDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: primaryButtonStyleDark,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: secondaryButtonStyleDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceColorDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primaryColorDark, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      labelStyle: bodyMediumDark,
      hintStyle: bodyMediumDark.copyWith(color: secondaryColorDark.withOpacity(0.7)),
    ),
    cardTheme: CardTheme(
      color: cardColorDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    dividerColor: Colors.white.withOpacity(0.1),
    iconTheme: IconThemeData(
      color: secondaryColorDark,
    ),
    pageTransitionsTheme: pageTransitionsTheme,
    brightness: Brightness.dark,
    dialogBackgroundColor: surfaceColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColorDark,
      foregroundColor: textColorDark,
      elevation: 0,
    ),
  );
}
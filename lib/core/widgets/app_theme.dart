import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  TextTheme textTheme({bool isDarkTheme = false}) => TextTheme(
        displayLarge: GoogleFonts.poppins(
            fontSize: 89, fontWeight: FontWeight.w300, letterSpacing: -1.5),
        displayMedium: GoogleFonts.poppins(
            fontSize: 36, fontWeight: FontWeight.w300, letterSpacing: -0.5),
        displaySmall:
            GoogleFonts.poppins(fontSize: 44, fontWeight: FontWeight.w400),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Colors.black,
        ),
        headlineSmall:
            GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
        titleLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        titleMedium: GoogleFonts.poppins(
            fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
        titleSmall: GoogleFonts.poppins(
            fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        bodyLarge: GoogleFonts.poppins(
          color: AppColors.textBlack,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 14,
          letterSpacing: 0.15,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.poppins(
            fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
        labelSmall: GoogleFonts.poppins(
            fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
      );

  AppBarTheme appBarTheme({bool isDarkTheme = false}) => const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textBlack,
        centerTitle: true,
        elevation: 0,
      );

  CheckboxThemeData checkBoxTheme({bool isDarkTheme = false}) =>
      CheckboxThemeData(
        fillColor: MaterialStateProperty.all(AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        overlayColor: MaterialStateProperty.all(AppColors.softGray),
      );

  RadioThemeData radioTheme({bool isDarkTheme = false}) => RadioThemeData(
        fillColor: MaterialStateProperty.all(AppColors.primary),
      );

  InputDecorationTheme inputDecorationTheme({bool isDarkTheme = false}) =>
      InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.softGray,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.softGray,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primarySwatch,
          ),
        ),
        iconColor: AppColors.primarySwatch,
        focusColor: AppColors.primarySwatch,
      );

  static const marginHorizontal = 24.0;
  static const marginVertical = 24.0;

  BottomNavigationBarThemeData bottomNavigationBarTheme(
      {bool isDarkTheme = false}) {
    return BottomNavigationBarThemeData(
      backgroundColor: isDarkTheme ? Colors.black26 : Colors.white,
      unselectedItemColor:
          isDarkTheme ? Colors.blue.withOpacity(0.5) : Colors.grey,
    );
  }
}

extension SwitchTheme on AppTheme {
  ThemeData get light => ThemeData(
      textTheme: textTheme(),
      radioTheme: radioTheme(),
      checkboxTheme: checkBoxTheme(),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      bottomNavigationBarTheme: bottomNavigationBarTheme());
  ThemeData get dark => ThemeData(
        textTheme: textTheme(isDarkTheme: true),
        radioTheme: radioTheme(isDarkTheme: true),
        checkboxTheme: checkBoxTheme(isDarkTheme: true),
        scaffoldBackgroundColor: Colors.black26,
        appBarTheme: appBarTheme(isDarkTheme: true),
        inputDecorationTheme: inputDecorationTheme(isDarkTheme: true),
        bottomNavigationBarTheme: bottomNavigationBarTheme(isDarkTheme: true),
      );
}

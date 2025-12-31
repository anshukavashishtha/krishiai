import 'package:flutter/material.dart';
import 'app_colors.dart';

class DarkTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,

      // 🔥 VERY IMPORTANT for Flutter Web
      scaffoldBackgroundColor: AppColors.darkBackground,
      canvasColor: AppColors.darkBackground,

      primaryColor: AppColors.lightGreen,

      colorScheme: ColorScheme.dark(
        primary: AppColors.lightGreen,
        secondary: AppColors.olive,
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
        error: AppColors.error,
        onBackground: AppColors.darkTextPrimary,
        onSurface: AppColors.darkTextPrimary,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkTextPrimary,
        elevation: 0,
      ),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.darkTextPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.darkTextPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.darkTextSecondary,
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

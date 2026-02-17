import "package:flutter/material.dart";

abstract class AppColors {
  // Primary / Brand
  static const Color primaryLight = Color(0xFF3369FF);
  static const Color primaryDark  = Color(0xFF8AB4F8);

  // Backgrounds & Surfaces
  static const Color backgroundLight = Color(0xFFF6F7F9);
  static const Color backgroundDark  = Color(0xFF121212);

  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark  = Color(0xFF1E1E1E);

  // Text
  static const Color textPrimaryLight   = Color(0xFF1C1C1C);
  static const Color textPrimaryDark    = Color(0xFFFFFFFF);

  static const Color textSecondaryLight = Color(0xFF757575);
  static const Color textSecondaryDark  = Color(0xFFB0B3B8);

  // Disabled / Inactive States
  static const Color disabledLight = Color(0xFF9E9E9E);
  static const Color disabledDark  = Color(0xFF616161);

  // UI Helpers
  static const Color infoSnackBarColor = Colors.blue;
  static const Color successSnackBarColor = Colors.green;
  static const Color errorSnackBarColor = Colors.redAccent;
  static const Color warningSnackBarColor = Colors.orangeAccent;
  static const Color hintLight = Color(0xFF8A8A8A);
  static const Color hintDark  = Color(0xFFB0B0B0);
}
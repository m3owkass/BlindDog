import 'package:flutter/material.dart';

import 'blind_dog_colors.dart';

ThemeData blindDogTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: BlindDogColors.accent,
    brightness: Brightness.light,
  ).copyWith(
    primary: BlindDogColors.accent,
    onPrimary: Colors.white,
    secondary: BlindDogColors.highlight,
    onSecondary: BlindDogColors.textPrimary,
    tertiary: BlindDogColors.relapseSoft,
    onTertiary: Colors.white,
    error: BlindDogColors.relapse,
    onError: Colors.white,
    surface: BlindDogColors.surface,
    onSurface: BlindDogColors.textPrimary,
    surfaceContainerHighest: BlindDogColors.surfaceAlt,
    onSurfaceVariant: BlindDogColors.textSecondary,
    outline: BlindDogColors.surfaceAlt,
    outlineVariant: BlindDogColors.surfaceAlt,
    inverseSurface: BlindDogColors.textPrimary,
    onInverseSurface: BlindDogColors.background,
    inversePrimary: BlindDogColors.accentSoft,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: BlindDogColors.background,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      foregroundColor: BlindDogColors.textPrimary,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: BlindDogColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    dividerTheme: const DividerThemeData(
      color: BlindDogColors.surfaceAlt,
      thickness: 1,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: BlindDogColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: BlindDogColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: BlindDogColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: BlindDogColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        color: BlindDogColors.textSecondary,
      ),
    ),
  );
}

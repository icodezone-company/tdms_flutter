import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_sized.dart';
import 'app_text_style.dart';

/// ================================
/// MAIN APP THEME
/// ================================

class AppTheme {
  const AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.scaffoldColor,

    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      tertiary: AppColors.accentColor,
      surface: AppColors.surfaceColor,
      error: AppColors.errorColor,
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      elevation: AppSizes.elevationSM,
    ),

    cardTheme: CardThemeData(
      color: AppColors.surfaceColor,
      elevation: AppSizes.elevationMD,
      shadowColor: AppColors.shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      ),
    ),

    scrollbarTheme: ScrollbarThemeData(
      minThumbLength: 50,
      thumbVisibility: WidgetStatePropertyAll(true),
      trackVisibility: WidgetStatePropertyAll(true),
      thickness: WidgetStatePropertyAll(8),
      radius: const Radius.circular(6),
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.dragged)) {
          return AppColors.primaryColor.withValues(alpha: 0.85);
        }
        if (states.contains(WidgetState.hovered)) {
          return AppColors.primaryColor.withValues(alpha: 0.55);
        }
        return AppColors.primaryColor.withValues(alpha: 0.35);
      }),

      trackColor: WidgetStateProperty.all(
        AppColors.borderColor.withValues(alpha: 0.4),
      ),
      trackBorderColor: WidgetStateProperty.all(
        AppColors.borderColor.withValues(alpha: 0.6),
      ),
    ),

    textTheme: TextTheme(
      headlineMedium: AppTextStyles.headlineMedium,
      bodyMedium: AppTextStyles.bodyMedium,
      labelMedium: AppTextStyles.labelMedium,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingLG,
          vertical: AppSizes.paddingMD,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceColor,
      contentPadding: const EdgeInsets.all(AppSizes.paddingMD),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
    ),
  );
}

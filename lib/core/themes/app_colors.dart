import 'package:flutter/material.dart';

/// ================================
/// CHROMATIC WEAVE – COLOR TOKENS
/// ================================

class AppColors {
  const AppColors._();

  // Brand Colors
  static const Color primaryColor = Color(0xFF1E3A8A); // Indigo Blue
  static const Color secondaryColor = Color(0xFF0F766E); // Deep Teal
  static const Color accentColor = Color(0xFFF59E0B); // Amber Gold

  // Background & Surfaces
  static const Color backgroundColor = Color(0xFFF8FAFC); // App background
  static const Color surfaceColor = Color(0xFFFFFFFF); // Cards, sheets
  static const Color scaffoldColor = Color(0xFFF8FAFC);

  // Text Colors
  static const Color textPrimaryColor = Color(0xFF111827); // Main text
  static const Color textSecondaryColor = Color(0xFF6B7280); // Labels, hints
  static const Color textMutedColor = Color(0xFF9CA3AF); // Disabled

  // Borders & Dividers
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color dividerColor = Color(0xFFE5E7EB);

  // Status Colors (Factory Use)
  static const Color successColor = Color(0xFF16A34A);
  static const Color warningColor = Color(0xFFD97706);
  static const Color errorColor = Color(0xFFDC2626);
  static const Color infoColor = Color(0xFF2563EB);

  // Utility
  static const Color disabledColor = Color(0xFFD1D5DB);
  static const Color shadowColor = Color(0x1A000000); // 10% black
}

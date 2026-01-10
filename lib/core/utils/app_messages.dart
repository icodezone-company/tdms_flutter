import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_sized.dart';
import '../themes/app_text_style.dart';

class AppMessages {
  /// SUCCESS SNACKBAR
  /// ================================
  static void success(
    BuildContext context, {
    String message = 'تمت العملية بنجاح',
  }) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.successColor,
      icon: Icons.check_circle_outline,
    );
  }

  /// ERROR SNACKBAR
  /// ================================
  static void error(
    BuildContext context, {
    String message = 'حدث خطأ، الرجاء المحاولة مرة أخرى',
  }) {
    _show(
      context,
      message: message,
      backgroundColor: AppColors.errorColor,
      icon: Icons.error_outline,
    );
  }

  /// BASE SNACKBAR METHOD
  /// ================================
  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        margin: const EdgeInsets.all(AppSizes.paddingMD),
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all((Radius.circular(AppSizes.radiusMD))),
        ),
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: AppSizes.paddingSM),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

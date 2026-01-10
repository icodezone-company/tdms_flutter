

import 'package:flutter/material.dart';

import '../core/themes/app_colors.dart';
import '../core/themes/app_sized.dart';
import '../core/themes/app_text_style.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.factory, size: 72, color: AppColors.primaryColor),
        SizedBox(height: AppSizes.paddingMD),
        Text(
          'تسجيل الدخول',
          style: AppTextStyles.headlineMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.paddingSM),
        Text(
          'الرجاء إدخال اسم المستخدم وكلمة المرور',
          style: AppTextStyles.labelMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

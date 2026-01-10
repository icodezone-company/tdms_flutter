import 'package:flutter/material.dart';

import '../core/themes/app_colors.dart';
import '../core/themes/app_sized.dart';
import '../core/themes/app_text_style.dart';

class GridItem {
  final String label;
  final IconData icon;
  final void Function() onTap;

  GridItem(this.label, this.icon, this.onTap);
}

class GridCard extends StatelessWidget {
  final GridItem item;

  const GridCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSizes.radiusMD),
      onTap: item.onTap,
      child: Card(
        elevation: AppSizes.elevationLG,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusMD),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingMD),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 42, color: AppColors.primaryColor),
              const SizedBox(height: AppSizes.paddingLG),
              Text(
                item.label,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

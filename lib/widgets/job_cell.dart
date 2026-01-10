
import 'package:flutter/material.dart';

import '../core/themes/app_colors.dart';

class JobCell extends StatelessWidget {
  const JobCell({
    super.key,
    required this.isHeader,
    required this.isSelected,
    required this.label,
  });

  final bool isHeader;
  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: isHeader
          ? BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.10),
              border: Border(
                top: BorderSide(
                  color: AppColors.primaryColor.withValues(alpha: 0.4),
                  width: 1.5,
                ),
                bottom: BorderSide(
                  color: AppColors.primaryColor.withValues(alpha: 0.2),
                  width: 1.5,
                ),
                right: BorderSide(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                ),
                left: BorderSide(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                ),
              ),
            )
          : BoxDecoration(
              color: isSelected
                  ? AppColors.primaryColor.withValues(alpha: 0.12)
                  : AppColors.surfaceColor,
              border: Border(
                bottom: BorderSide(color: AppColors.borderColor),
                right: BorderSide(color: AppColors.borderColor),
                left: BorderSide(color: AppColors.borderColor),
              ),
            ),
      child: Text(
        label,
        style: isHeader
            ? Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              )
            : Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}

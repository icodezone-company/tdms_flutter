import 'package:flutter/material.dart';

import '../core/themes/app_colors.dart';
import '../core/themes/app_sized.dart';
import '../core/themes/app_text_style.dart';
import '../core/utils/constants.dart';
import '../widgets/app_grid_view.dart';
import '../widgets/grid_card.dart';
import 'job_screen.dart';
import 'warehouse_raw_screen.dart';
import 'warehouse_ready_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الرئيسية')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.paddingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('أعمال المصبغة'),
            const SizedBox(height: AppSizes.paddingMD),
            AppGridView(
              items: List.generate(
                5,
                (index) => GridItem(
                  Constants.dyeingTitles[index],
                  Constants.dyeingIcons[index],
                  () {
                    print(index + 1);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => JobScreen(dyeingPart: index + 1),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: AppSizes.paddingXL),
            _buildSectionTitle('المستودعات والمواد'),
            const SizedBox(height: AppSizes.paddingMD),
            AppGridView(
              items: [
                GridItem('مستودع المواد الخام', Icons.inventory_2_outlined, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => WarehouseRawScreen()),
                  );
                }),
                GridItem(
                  'مستودع المواد الجاهزة',
                  Icons.local_shipping_outlined,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => WarehouseReadyScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.all(12),

      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.radiusMD)),
      ),
      child: Text(
        "   $title",
        style: AppTextStyles.sectionTitle.copyWith(
          color: AppColors.surfaceColor,
        ),
      ),
    );
  }
}

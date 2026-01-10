import 'package:flutter/material.dart';

import '../core/themes/app_sized.dart';
import 'grid_card.dart';

class AppGridView extends StatelessWidget {
  const AppGridView({super.key, required this.items});
  final List<GridItem> items;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.sizeOf(context).width < 600 ? 2 : 3,
        mainAxisSpacing: AppSizes.paddingMD,
        crossAxisSpacing: AppSizes.paddingMD,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) => GridCard(item: items[index]),
    );
  }
}

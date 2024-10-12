import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart'; // Certifique-se de importar o AppColors corretamente

class HomeBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const HomeBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingExtraLarge * 2,
        vertical: AppDimensions.paddingSmall,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.paddingSmall,
        ),
        decoration: BoxDecoration(
          color: AppColors.secondaryGrey,
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusMedium,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: AppIconsSecondary.homeIcon,
              iconSize: AppDimensions.iconExtraLarge,
              onPressed: () => widget.onItemTapped(0),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => widget.onItemTapped(1),
              icon: AppIconsSecondary.luggageIcon,
              iconSize: AppDimensions.iconExtraLarge,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: AppIconsSecondary.historyIcon,
              iconSize: AppDimensions.iconExtraLarge,
              onPressed: () => widget.onItemTapped(1),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: AppIconsSecondary.personIcon,
              iconSize: AppDimensions.iconExtraLarge,
              onPressed: () => widget.onItemTapped(2),
            )
          ],
        ),
      ),
    );
  }
}

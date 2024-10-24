import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';

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

  void _navigateTo(int index) {
    widget.onItemTapped(index);

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/user/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/user/luggage');
        break;
      case 2:
        Navigator.pushNamed(context, '/user/history');
        break;
      case 3:
        Navigator.pushNamed(context, '/user/profile');
        break;
    }
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
              color: widget.selectedIndex == 0
                  ? AppColors.primary
                  : AppColors.secondaryGrey,
              onPressed: () => _navigateTo(0),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: AppIconsSecondary.luggageIcon,
              iconSize: AppDimensions.iconExtraLarge,
              color: widget.selectedIndex == 1
                  ? AppColors.primary
                  : AppColors.secondaryGrey,
              onPressed: () => _navigateTo(1),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: AppIconsSecondary.historyIcon,
              iconSize: AppDimensions.iconExtraLarge,
              color: widget.selectedIndex == 2
                  ? AppColors.primary
                  : AppColors.secondaryGrey,
              onPressed: () => _navigateTo(2),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: AppIconsSecondary.personIcon,
              iconSize: AppDimensions.iconExtraLarge,
              color: widget.selectedIndex == 3
                  ? AppColors.primary
                  : AppColors.secondaryGrey,
              onPressed: () => _navigateTo(3),
            ),
          ],
        ),
      ),
    );
  }
}

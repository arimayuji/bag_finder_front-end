import 'package:bag_finder_frontend/app/presentation/home/widget/appbar/home_search_bar_widget.dart';
import 'package:bag_finder_frontend/app/presentation/home/widget/appbar/home_welcome_user_widget.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: const EdgeInsets.only(
        top: AppDimensions.paddingMedium,
        left: AppDimensions.paddingSmall,
        right: AppDimensions.paddingSmall,
        bottom: AppDimensions.paddingSmall,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeWelcomeUserWidget(userName: 'Luisa'),
          SizedBox(
            height: AppDimensions.verticalSpaceMedium,
          ),
          HomeSearchBarWidget(),
        ],
      ),
    );
  }
}

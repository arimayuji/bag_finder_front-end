import 'package:bag_finder_frontend/app/presentation/home/widget/appbar/home_search_field_widget.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class HomeSearchBarWidget extends StatefulWidget {
  const HomeSearchBarWidget({super.key});

  @override
  State<HomeSearchBarWidget> createState() => _HomeSearchBarWidgetState();
}

class _HomeSearchBarWidgetState extends State<HomeSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const HomeSearchFieldWidget(hint: 'Search your luggage ...'),
        IconButton(
          onPressed: () {},
          icon: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.filter_list,
              size: AppDimensions.iconLarge,
              color: AppColors.secondary,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

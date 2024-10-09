import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeBottomNavigationWidget extends StatefulWidget {
  const HomeBottomNavigationWidget({super.key});

  @override
  State<HomeBottomNavigationWidget> createState() => _HomeBottomNavigationWidgetState();
}

class _HomeBottomNavigationWidgetState extends State<HomeBottomNavigationWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index, String route) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      Modular.to.navigate('/home/$route');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.primary,
      surfaceTintColor: AppColors.primary,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavigationBarItem(
            icon: AppIcons.homeIcon,
            index: 0,
            route: 'home',
          ),
          _buildBottomNavigationBarItem(
            icon: AppIcons.calendarIcon,
            index: 1,
            route: 'history',
          ),
          _buildBottomNavigationBarItem(
            icon: AppIcons.homeIcon,
            index: 2,
            route: 'charts',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBarItem(
      {required Icon icon, required int index, required String route}) {
    return IconButton(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(AppColors.secondary),
      ),
      alignment: Alignment.center,
      color: AppColors.secondary,
      icon: icon,
      onPressed: () => _onItemTapped(index, route),
    );
  }
}

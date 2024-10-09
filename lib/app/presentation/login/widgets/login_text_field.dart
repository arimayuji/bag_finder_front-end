import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hint;
  const LoginTextField(
      {super.key, required this.prefixIcon, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        fillColor: AppColors.textFieldBackground,
        filled: true,
        border: const OutlineInputBorder(),
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.secondaryGrey,
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.secondaryGrey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusMedium,
          ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusMedium,
          ),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusMedium,
          ),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(
        color: AppColors.secondaryGrey,
      ),
    );
  }
}

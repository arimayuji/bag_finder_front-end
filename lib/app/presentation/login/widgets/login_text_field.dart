import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final Icon prefixIcon;
  final String hint;
  final void Function(String)? onChanged;
  const LoginTextField({
    super.key,
    required this.prefixIcon,
    required this.hint,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingSmall,
          vertical: AppDimensions.paddingLarge,
        ),
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

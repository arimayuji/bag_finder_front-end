import 'package:bag_finder_frontend/app/presentation/user/mixins/user_validation_mixin.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final Icon prefixIcon;
  final String hint;
  final bool isPassword;
  final String fieldType;
  final bool isRequired;
  final void Function(String)? onChanged;

  const LoginTextField({
    super.key,
    required this.prefixIcon,
    required this.hint,
    this.onChanged,
    required this.isPassword,
    required this.fieldType,
    required this.isRequired,
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> with ValidationMixin {
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: (value) {
            final error = validateField(
              value,
              widget.hint,
              widget.fieldType,
              widget.isRequired,
            );
            setState(() {
              errorMessage = error;
            });
            return error;
          },
          obscureText: widget.isPassword,
          onChanged: (value) {
            widget.onChanged?.call(value);
            final error = validateField(
              value,
              widget.hint,
              widget.fieldType,
              widget.isRequired,
            );
            setState(() {
              errorMessage = error;
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingSmall,
              vertical: AppDimensions.paddingLarge,
            ),
            fillColor: AppColors.textFieldBackground,
            filled: true,
            border: const OutlineInputBorder(),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: AppColors.secondaryGrey,
              fontSize: 14,
            ),
            prefixIcon: widget.prefixIcon,
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
        ),
        if (errorMessage != null) // Exibe a mensagem de erro se houver
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              errorMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;

  const CustomTextFormField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: AppColors.primary.withOpacity(
          0.6,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4), 
          borderSide: BorderSide.none, 
        ),
        hintStyle: const TextStyle(
          color: Colors.black87, 
          fontSize: 16,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),
      ),
    );
  }
}

class UserInfoColumn extends StatelessWidget {
  const UserInfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(hintText: 'Fulano'),
        SizedBox(height: 10),
        CustomTextFormField(hintText: 'fulano@gmail.com'),
        SizedBox(height: 10),
        CustomTextFormField(hintText: '+55 (11) 90123-4567'),
        SizedBox(height: 10),
        CustomTextFormField(hintText: 'Masculino'),
        SizedBox(height: 10),
        CustomTextFormField(hintText: '21/07/2004'),
      ],
    );
  }
}

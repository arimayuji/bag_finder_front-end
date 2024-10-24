import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:flutter/material.dart';

class ProfileBannerWidget extends StatelessWidget {
  final UserEntity user;

  const ProfileBannerWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, ${user.fullName}!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryBlack,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Registro - ${user.createdAt.month}/${user.createdAt.year}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.secondaryGrey,
                  ),
            ),
          ],
        ),
        SizedBox(
          child: UserAvatarWidget(
            name: user.fullName[0],
          ),
        ),
      ],
    );
  }
}

class UserAvatarWidget extends StatelessWidget {
  final String name;
  final Color? backgroundColor;
  final Color? borderColor;

  const UserAvatarWidget({
    super.key,
    required this.name,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    String firstLetter = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? AppColors.primary,
          width: 4,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: backgroundColor ?? Colors.white,
        child: Text(
          firstLetter,
          style: TextStyle(
            fontSize: 30,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

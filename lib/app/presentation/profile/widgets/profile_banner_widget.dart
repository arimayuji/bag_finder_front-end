import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/domain/entity/user_avatar_entity.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Olá, ${user.fullName}!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.secondaryBlack),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Registro - ${user.createdAt.month}/${user.createdAt.year}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.secondaryGrey,
                  ),
            ),
          ],
        ),
        UserAvatarWidget(avatar: user.avatar),
      ],
    );
  }
}

class UserAvatarWidget extends StatelessWidget {
  final UserAvatarEntity? avatar;

  const UserAvatarWidget({
    super.key,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: avatar?.color ?? AppColors.secondaryGrey,
      child: Icon(
        avatar?.icon ?? Icons.person,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}

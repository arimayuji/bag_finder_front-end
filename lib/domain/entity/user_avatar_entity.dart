import 'package:flutter/cupertino.dart';

class UserAvatarEntity {
  final Color color;
  final IconData icon;

  UserAvatarEntity({
    required this.color,
    required this.icon,
  });

  UserAvatarEntity copyWith({
    Color? color,
    IconData? icon,
  }) {
    return UserAvatarEntity(
      color: color ?? this.color,
      icon: icon ?? this.icon,
    );
  }

  static UserAvatarEntity empty() {
    return UserAvatarEntity(
      color: const Color(0x00000000), 
      icon: CupertinoIcons.person, 
    );
  }
}

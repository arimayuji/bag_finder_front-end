import 'package:bag_finder_frontend/domain/entity/bag_entity.dart';

class UserEntity {
  final String id;
  final String email;
  final String password;
  final String name;
  final List<BagEntity> bags = [];

  UserEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
  });
}

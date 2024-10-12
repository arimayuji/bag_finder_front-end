import 'package:bag_finder_frontend/domain/entity/user_entity.dart';

class BagEntity {
  final String id;
  final bool isDelivered;
  final UserEntity user;

  BagEntity({required this.id, required this.user, required this.isDelivered});
}

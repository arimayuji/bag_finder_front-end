import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/enums/bag_status_enum.dart';

class BagEntity {
  final String id;
  final String description;
  final BagStatusEnum status;
  final UserEntity user;

  BagEntity({
    required this.description,
    required this.id,
    required this.user,
    required this.status,
  });
}

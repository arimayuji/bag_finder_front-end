import 'package:bag_finder_frontend/domain/entity/bag_entity.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';

class ReportEntity {
  final String id;
  final String description;
  final UserEntity userId;
  final BagEntity bagEntity;

  ReportEntity(
      {required this.id,
      required this.description,
      required this.userId,
      required this.bagEntity});
}

import 'package:bag_finder_frontend/domain/entity/bag_entity.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';

class ReportEntity {
  final String id;
  final String description;
  final UserEntity userId;
  final BagEntity bagEntity;

  ReportEntity({
    required this.id,
    required this.description,
    required this.userId,
    required this.bagEntity,
  });

  // Método copyWith
  ReportEntity copyWith({
    String? id,
    String? description,
    UserEntity? userId,
    BagEntity? bagEntity,
  }) {
    return ReportEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      bagEntity: bagEntity ?? this.bagEntity,
    );
  }

  static ReportEntity empty() {
    return ReportEntity(
      id: '',
      description: '',
      userId: UserEntity.empty(), 
      bagEntity: BagEntity.empty(), 
    );
  }
}

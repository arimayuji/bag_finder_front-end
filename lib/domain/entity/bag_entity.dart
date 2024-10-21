import 'package:bag_finder_frontend/domain/enums/bag_status_enum.dart';

class BagEntity {
  final String id;
  final String description;
  final BagStatusEnum status;
  final String ownerId;

  BagEntity({
    required this.id,
    required this.description,
    required this.status,
    required this.ownerId,
  });

  BagEntity copyWith({
    String? id,
    String? description,
    BagStatusEnum? status,
    String? ownerId,
  }) {
    return BagEntity(
      id: id ?? this.id,
      description: description ?? this.description,
      status: status ?? this.status,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  static BagEntity empty() {
    return BagEntity(
      id: '',
      description: '',
      status: BagStatusEnum.UNKNOWN,
      ownerId: '',
    );
  }
}

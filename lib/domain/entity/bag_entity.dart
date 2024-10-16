import 'package:bag_finder_frontend/domain/enums/bag_status_enum.dart';

class BagEntity {
  final String id;
  final String description;
  final BagStatusEnum status;
  final String ownerId;

  BagEntity({
    required this.description,
    required this.id,
    required this.status,
    required this.ownerId,
  });
}

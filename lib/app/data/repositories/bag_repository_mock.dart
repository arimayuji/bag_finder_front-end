import 'package:bag_finder_frontend/domain/entity/bag_entity.dart';
import 'package:bag_finder_frontend/domain/enums/bag_status_enum.dart';
import 'package:bag_finder_frontend/domain/repositories/bag_repository.dart';

class BagRepositoryMock extends IBagRepository {
  final List<BagEntity> _bags = [
    BagEntity(
      description: 'description',
      id: 'bag-id',
      ownerId: '1',
      status: BagStatusEnum.STREETWISE,
    )
  ];

  @override
  Future<void> addBag(BagEntity bag) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBag(String id) {
    throw UnimplementedError();
  }

  @override
  Future<BagEntity?> getBagById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<BagEntity>> getBagsByStatus(BagStatusEnum status) {
    throw UnimplementedError();
  }

  @override
  Future<List<BagEntity>> getBagsByUserId(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateBag(BagEntity bag) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateBagStatus(String bagId, BagStatusEnum status) {
    throw UnimplementedError();
  }
}

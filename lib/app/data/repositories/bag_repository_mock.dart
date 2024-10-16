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
    // TODO: implement addBag
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteBag(String id) {
    // TODO: implement deleteBag
    throw UnimplementedError();
  }
  
  @override
  Future<BagEntity?> getBagById(String id) {
    // TODO: implement getBagById
    throw UnimplementedError();
  }
  
  @override
  Future<List<BagEntity>> getBagsByStatus(BagStatusEnum status) {
    // TODO: implement getBagsByStatus
    throw UnimplementedError();
  }
  
  @override
  Future<List<BagEntity>> getBagsByUserId(String userId) {
    // TODO: implement getBagsByUserId
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateBag(BagEntity bag) {
    // TODO: implement updateBag
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateBagStatus(String bagId, BagStatusEnum status) {
    // TODO: implement updateBagStatus
    throw UnimplementedError();
  }
}

import 'package:bag_finder_frontend/domain/entity/bag_entity.dart';
import 'package:bag_finder_frontend/domain/enums/bag_status_enum.dart';

abstract class IBagRepository {
  Future<void> addBag(BagEntity bag);

  Future<BagEntity?> getBagById(String id);

  Future<void> updateBag(BagEntity bag);

  Future<void> deleteBag(String id);

  Future<List<BagEntity>> getBagsByUserId(String userId);

  Future<void> updateBagStatus(String bagId, BagStatusEnum status);

  Future<List<BagEntity>> getBagsByStatus(BagStatusEnum status);
}

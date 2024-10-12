import 'package:bag_finder_frontend/domain/repositories/bag_repository.dart';

class BagRepositoryMock extends IBagRepository {
  @override
  Future<bool> addBag(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> addBagToUser(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> isBagInUser(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeBag(String id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeBagFromUser(String id) {
    throw UnimplementedError();
  }
}

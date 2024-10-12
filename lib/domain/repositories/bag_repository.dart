abstract class IBagRepository {
  Future<bool> addBag(String id);
  Future<bool> removeBag(String id);
  Future<bool> addBagToUser(String id);

  Future<bool> removeBagFromUser(String id);
  Future<bool> isBagInUser(String id);
}

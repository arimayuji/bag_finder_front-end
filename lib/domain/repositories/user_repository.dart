import 'package:bag_finder_frontend/domain/entity/user_entity.dart';

abstract class IUserRepository {
  Future<UserEntity?> loginUser();
}

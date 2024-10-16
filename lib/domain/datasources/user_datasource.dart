import 'package:bag_finder_frontend/domain/entity/user_entity.dart';

abstract class IUserDatasource {
  Future<UserEntity> loginUser();
  Future<void> logout();
}

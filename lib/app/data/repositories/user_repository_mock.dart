import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';

class UserRepositoryMock implements IUserRepository {
  @override
  Future<UserEntity?> loginUser() {
    throw UnimplementedError();
  }

}

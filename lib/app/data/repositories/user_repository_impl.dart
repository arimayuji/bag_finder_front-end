import 'package:bag_finder_frontend/domain/datasources/user_datasource.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  final IUserDatasource _userDatasource;

  UserRepositoryImpl(this._userDatasource);

  @override
  Future<UserEntity?> loginUser() async {
    try {
      final result = await _userDatasource.loginUser();

      return result;
    } catch (e) {
      return null;
    }
  }
}

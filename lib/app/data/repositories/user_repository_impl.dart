import 'package:bag_finder_frontend/domain/datasources/user_datasource.dart';
import 'package:bag_finder_frontend/domain/entity/trip_entity.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  final IUserDatasource _userDatasource;

  UserRepositoryImpl(this._userDatasource);

  @override
  Future<UserEntity?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _userDatasource.loginUser();

      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addUser({required UserEntity user}) {
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> authenticateUser(
      {required String email, required String password}) {
    // TODO: implement authenticateUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser({required String id}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserEntity>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<List<TripEntity>> getUserBagsHistory({required String userId}) {
    // TODO: implement getUserBagsHistory
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> getUserByEmail({required String email}) {
    // TODO: implement getUserByEmail
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> getUserById({required String id}) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser({required UserEntity user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserBags(
      {required String userId, required List<TripEntity> bags}) {
    // TODO: implement updateUserBags
    throw UnimplementedError();
  }
}

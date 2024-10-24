import 'package:bag_finder_frontend/domain/datasources/user_datasource.dart';
import 'package:bag_finder_frontend/domain/entity/trip_entity.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/failures/failure.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements IUserRepository {
  final IUserDatasource _userDatasource;

  UserRepositoryImpl(this._userDatasource);

  @override
  Future<Either<AuthError, UserEntity>> addUser({required UserEntity user}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity?>> authenticateUser(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteUser({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TripEntity>>> getUserBagsHistory(
      {required String userId}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getUserByEmail({required String email}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity?>> getUserById({required String id}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUser({required UserEntity user}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUserBags(
      {required String userId, required List<TripEntity> bags}) {
    throw UnimplementedError();
  }

  // @override
  // Future<UserEntity?> loginUser({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final result = await _userDatasource.loginUser();

  //     return result;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}

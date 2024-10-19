import 'package:bag_finder_frontend/domain/entity/trip_entity.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/failures/failure.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryMock implements IUserRepository {
  final List<UserEntity> _users = [
    UserEntity(
      phone: '(11) 99999-9999',
      id: '1',
      email: 'bagfinder@gmail.com',
      password: 'password!',
      fullName: 'Admin',
      photoUrl: '',
    ),
    UserEntity(
      phone: '(11) 99999-9999',
      id: '1',
      email: 'bagfinder@gmail.com',
      password: 'password!',
      fullName: 'Fake Admin',
      photoUrl: '',
    ),
  ];

  @override
  Future<Either<AuthError, UserEntity>> addUser(
      {required UserEntity user}) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    UserEntity? isRegistered = _users.firstWhereOrNull(
      (
        u,
      ) {
        return u.email == user.email;
      },
    );

    if (isRegistered == null) {
      _users.add(
        user,
      );

      return Right(user);
    }

    return Left(
      UserNotFound(
        errorMessage: 'User not found',
        stackTrace: null,
      ),
    );
  }

  @override
  Future<Either<Failure, UserEntity?>> authenticateUser({
    required String email,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    UserEntity user = _users.firstWhere(
      (
        user,
      ) =>
          user.email == email,
    );

    if (user is StateError) {
      return Left(
        UserNotFound(
          errorMessage: 'User not found',
          stackTrace: null,
        ),
      );
    }

    if (user.password != password) {
      return Left(
        UserNotFound(
          errorMessage: 'User not found',
          stackTrace: null,
        ),
      );
    }

    return Right(
      user,
    );
  }

  @override
  Future<Either<Failure, void>> deleteUser({
    required String id,
  }) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    UserEntity user = _users.firstWhere(
      (
        user,
      ) =>
          user.id == id,
    );

    if (user is StateError) {
      return Left(
        UserNotFound(
          errorMessage: 'User not found',
          stackTrace: null,
        ),
      );
    }

    _users.remove(
      user,
    );

    return const Right(
      null,
    );
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    return Right(
      _users,
    );
  }

  @override
  Future<Either<Failure, List<TripEntity>>> getUserBagsHistory({
    required String userId,
  }) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    UserEntity user = _users.firstWhere(
      (
        user,
      ) =>
          user.id == userId,
    );

    if (user is StateError) {
      return Left(
        UserNotFound(
          errorMessage: 'User not found',
          stackTrace: null,
        ),
      );
    }

    return Right(
      user.bags,
    );
  }

  @override
  Future<Either<Failure, UserEntity>> getUserByEmail({
    required String email,
  }) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    UserEntity? user = _users.firstWhere(
      (
        user,
      ) =>
          user.email == email,
    );

    return Right(
      user,
    );
  }

  @override
  Future<Either<Failure, UserEntity?>> getUserById({required String id}) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    UserEntity? user = _users.firstWhere(
      (
        user,
      ) =>
          user.id == id,
    );

    if (user is StateError) {
      return Left(
        UserNotFound(
          errorMessage: 'User not found',
          stackTrace: null,
        ),
      );
    }

    return Right(
      user,
    );
  }

  @override
  Future<Either<Failure, void>> updateUser({required UserEntity user}) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    UserEntity user = _users.firstWhere(
      (
        user,
      ) =>
          user.id == user.id,
    );

    if (user is StateError) {
      return Left(
        UserNotFound(
          errorMessage: 'User not found',
          stackTrace: null,
        ),
      );
    }

    _users.remove(
      user,
    );

    _users.add(
      user,
    );

    return const Right(
      null,
    );
  }

  @override
  Future<Either<Failure, void>> updateUserBags(
      {required String userId, required List<TripEntity> bags}) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    UserEntity user = _users.firstWhere(
      (
        user,
      ) =>
          user.id == userId,
    );

    if (user is StateError) {
      return Left(
        UserNotFound(
          errorMessage: 'User not found',
          stackTrace: null,
        ),
      );
    }

    user = user.copyWith(
      bags: bags,
    );

    _users.remove(
      user,
    );

    _users.add(
      user,
    );

    return const Right(
      null,
    );
  }
}

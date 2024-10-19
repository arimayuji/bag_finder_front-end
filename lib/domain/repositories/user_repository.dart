import 'package:bag_finder_frontend/domain/entity/trip_entity.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IUserRepository {
  Future<Either<AuthError, UserEntity>> addUser({
    required UserEntity user,
  });

  Future<Either<Failure, UserEntity?>> getUserById({
    required String id,
  });

  Future<Either<Failure, void>> updateUser({
    required UserEntity user,
  });

  Future<Either<Failure, void>> deleteUser({
    required String id,
  });

  Future<Either<Failure, List<UserEntity>>> getAllUsers();

  Future<Either<Failure, UserEntity>> getUserByEmail({
    required String email,
  });

  Future<Either<Failure, UserEntity?>> authenticateUser({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> updateUserBags({
    required String userId,
    required List<TripEntity> bags,
  });

  Future<Either<Failure, List<TripEntity>>> getUserBagsHistory({
    required String userId,
  });
}

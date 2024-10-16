import 'package:bag_finder_frontend/domain/entity/trip_entity.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';

abstract class IUserRepository {
  Future<void> addUser({required UserEntity user});

  Future<UserEntity?> getUserById({required String id});

  Future<void> updateUser({required UserEntity user});

  Future<void> deleteUser({required String id});

  Future<List<UserEntity>> getAllUsers();

  Future<UserEntity?> getUserByEmail({required String email});

  Future<UserEntity?> authenticateUser({
    required String email,
    required String password,
  });

  Future<void> updateUserBags({
    required String userId,
    required List<TripEntity> bags,
  });

  Future<List<TripEntity>> getUserBagsHistory({required String userId});
}

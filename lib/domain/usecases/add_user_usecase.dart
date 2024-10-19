import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/failures/failure.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IAddUserUsecase {
  Future<Either<AuthError, UserEntity>> call({
    required String fullName,
    required String email,
    required String password,
  });
}

class AddUserUsecase implements IAddUserUsecase {
  final IUserRepository repository;

  AddUserUsecase({required this.repository});

  @override
  Future<Either<AuthError, UserEntity>> call({
    required String fullName,
    required String email,
    required String password,
  }) async {
    UserEntity user = UserEntity(
      photoUrl: '',
      fullName: fullName,
      email: email,
      password: password,
      phone: '',
      id: '',
    );

    return await repository.addUser(
      user: user,
    );
  }
}

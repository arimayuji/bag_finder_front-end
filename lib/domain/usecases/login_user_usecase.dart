import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/failures/failure.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ILoginUserUsecase {
  Future<Either<Failure, UserEntity?>> call({
    required String email,
    required String password,
  });
}

class LoginUserUsecase implements ILoginUserUsecase {
  final IUserRepository repository;

  LoginUserUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserEntity?>> call({
    required String email,
    required String password,
  }) async {
    return await repository.authenticateUser(
      email: email,
      password: password,
    );
  }
}

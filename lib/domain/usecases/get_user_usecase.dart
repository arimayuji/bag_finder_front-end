import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/failures/failure.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetUserUsecase {
  Future<Either<Failure, UserEntity?>> call({
    required String userId,
  });
}

class GetUserUsecase implements IGetUserUsecase {
  final IUserRepository repository;

  GetUserUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, UserEntity?>> call({
    required String userId,
  }) async {
    return await repository.getUserById(id: userId);
  }
}

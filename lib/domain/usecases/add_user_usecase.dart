import 'package:bag_finder_frontend/domain/entity/user_avatar_entity.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/enums/user_gender_enum.dart';
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
      avatar: UserAvatarEntity.empty(),
      fullName: fullName,
      email: email,
      password: password,
      phone: '',
      id: '',
      updatedAt: null,
      gender: UserGenderEnum.OTHER,
    );

    return await repository.addUser(
      user: user,
    );
  }
}

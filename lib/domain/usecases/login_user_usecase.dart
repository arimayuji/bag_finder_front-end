import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';

abstract class ILoginUserUsecase {
  Future<UserEntity?> call();
}

class LoginUserUsecase implements ILoginUserUsecase {
  final IUserRepository repository;

  LoginUserUsecase({required this.repository});

  @override
  Future<UserEntity?> call() async {
    return await repository.loginUser();
  }
}

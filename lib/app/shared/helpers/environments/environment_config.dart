import 'package:bag_finder_frontend/app/data/repositories/bag_repository_mock.dart';
import 'package:bag_finder_frontend/app/data/repositories/user_repository_mock.dart';
import 'package:bag_finder_frontend/domain/repositories/bag_repository.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';
import 'package:bag_finder_frontend/env/env_enum.dart';

class EnvironmentConfig {
  static const MSS_BASE_URL = String.fromEnvironment('MSS_BASE_URL');

  static const ENV = String.fromEnvironment('ENV');

  static IBagRepository getBagRepository() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) {
        return element.name.toUpperCase() == ENV.toUpperCase();
      },
      orElse: () => EnvironmentEnum.LOCAL,
    );
    if (value == EnvironmentEnum.LOCAL) {
      return BagRepositoryMock();
    } else {
      return BagRepositoryMock();
    }
  }

  static IUserRepository getUserRepository() {
    EnvironmentEnum value = EnvironmentEnum.values.firstWhere(
      (element) {
        return element.name.toUpperCase() == ENV.toUpperCase();
      },
      orElse: () => EnvironmentEnum.LOCAL,
    );
    if (value == EnvironmentEnum.LOCAL) {
      return UserRepositoryMock();
    } else {
      return UserRepositoryMock();
    }
  }
}

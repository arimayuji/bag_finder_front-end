import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/usecases/add_user_usecase.dart';
import 'package:bag_finder_frontend/domain/usecases/get_user_usecase.dart';
import 'package:bag_finder_frontend/domain/usecases/login_user_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserProvider extends ChangeNotifier {
  final ILoginUserUsecase _loginUserUsecase;
  final IAddUserUsecase _addUserUsecase;
  final IGetUserUsecase _getUserUsecase;

  UserProvider(
    this._loginUserUsecase,
    this._addUserUsecase,
    this._getUserUsecase,
  );

  UserEntity? user;

  Future<UserEntity?> getUser({
    required String userId,
  }) async {
    var result = await _getUserUsecase.call(
      userId: userId,
    );

    result.fold(
      (l) => user = null,
      (r) => user = r,
    );

    notifyListeners();

    return user;
  }

  Future<UserEntity?> loginUser({
    required String email,
    required String password,
  }) async {
    var result = await _loginUserUsecase.call(email: email, password: password);

    result.fold(
      (l) => user = null,
      (r) => user = r,
    );

    notifyListeners();

    return user;
  }

  Future<void> createUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    var result = await _addUserUsecase.call(
      fullName: fullName,
      email: email,
      password: password,
    );

    result.fold(
      (l) => l,
      (r) => user = r,
    );

    notifyListeners();
  }

  void logout() async {
    user = null;
    Modular.to.navigate('/login/sign-in');
  }
}

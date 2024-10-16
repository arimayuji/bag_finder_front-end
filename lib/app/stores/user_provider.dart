import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:bag_finder_frontend/domain/usecases/login_user_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserProvider extends ChangeNotifier {
  final ILoginUserUsecase _loginUserUsecase;

  UserProvider(this._loginUserUsecase);

  UserEntity? user;

  Future<UserEntity?> loginUser({
    required String email,
    required String password,
  }) async {
    user = await _loginUserUsecase.call(email: email, password: password);
    notifyListeners();
    return user;
  }

  void logout() async {
    user = null;
    Modular.to.navigate('/login/sign-in');
  }
}

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

  // Aqui não é necessário setar ID e nome do usuário, pois são final
  // Apenas armazene o usuário na propriedade `user` durante o login
  UserEntity? get currentUser => user;

  String? get userName => user?.name; // Obter nome do usuário
  String? get userId => user?.id; // Obter ID do usuário
}

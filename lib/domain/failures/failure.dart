import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

abstract class Failure implements Exception {
  String errorMessage;

  Failure({
    required this.errorMessage,
    StackTrace? stackTrace,
  }) {
    Modular.get<Logger>().e(
      errorMessage,
      time: DateTime.now(),
      error: this,
      stackTrace: stackTrace,
    );
  }
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure({required String errorMessage})
      : super(
          errorMessage: 'Falha no armazenamento local',
        );
}

class NoInternetConnectionError extends Failure {
  NoInternetConnectionError()
      : super(
          errorMessage: 'Erro de conexão. Verifique sua rede',
        );
}

class NoDataFound extends Failure {
  NoDataFound()
      : super(
          errorMessage: 'Nenhum dado encontrado',
        );
}

class UnknownError extends Failure {
  final StackTrace? stackTrace;

  UnknownError({
    this.stackTrace,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: 'Falha desconhecida',
        );
}

class AuthError extends Failure {
  AuthError({required super.errorMessage, required super.stackTrace});
}

class NewPasswordNecessaryError extends AuthError {
  NewPasswordNecessaryError({
    required super.stackTrace,
  }) : super(
          errorMessage: 'Por favor, defina uma nova senha',
        );
}

class UserNotFound extends AuthError {
  UserNotFound({
    required super.stackTrace, required String errorMessage,
  }) : super(
          errorMessage: 'Usário não encontrado',
        );
}

class InvalidCredentialsError extends AuthError {
  InvalidCredentialsError({
    required super.stackTrace,
  }) : super(
          errorMessage: 'Credenciais inválidas',
        );
}

class LogoutError extends Failure {
  LogoutError()
      : super(
          errorMessage: 'Falha ao realizar o logout',
        );
}

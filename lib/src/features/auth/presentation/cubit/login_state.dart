part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String username;
  final String password;

  LoginState({
    this.username = '',
    this.password = '',
  });

  LoginState copyWith({
    String? username,
    String? password,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [username, password];
}

class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class LoginSuccess extends LoginState {
  final String userId;

  LoginSuccess({required this.userId});
  @override
  List<Object> get props => [userId];
}

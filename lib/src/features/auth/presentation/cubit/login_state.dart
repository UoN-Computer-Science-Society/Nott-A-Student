part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;

  const LoginState({
    this.email = '',
    this.password = '',
  });

  LoginState copyWith({
    String? email,
    String? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [email, password];
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

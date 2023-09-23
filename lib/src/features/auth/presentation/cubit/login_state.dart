part of 'login_cubit.dart';

class LoginState {
  final String username;
 // bool get isValidUsername => username.isNotEmpty;

  final String password;
  //bool get isValidPassword => password.isNotEmpty;

  //final FormSubmissionStatus formStatus;


  LoginState({
    this.username = '',
    this.password = '',
    // this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? username,
    String? password,
    //   FormSubmissionStatus formStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      //   formStatus: formStatus ?? this.formStatus,
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

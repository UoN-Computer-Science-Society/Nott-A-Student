import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepo;
  LoginCubit({required this.authRepo}) : super(LoginState());

  void onUserNameChanged(String username) {
    print(username);
    if (username != state.username) {
    emit(state.copyWith(username: username));
  }
  }

  void onPasswordChanged(String password) {
    print(password);
    if (password != state.password) {
    emit(state.copyWith(password: password));
  }
  }

 // Future<void> onFormSubmit(String username,String password) async {
    Future<void> onFormSubmit() async {
    if (state.username.isEmpty || state.password.isEmpty) {
      emit(LoginFailed(errorMessage: "Username or Password is empty"));
    } else {
      try {
        final userId = await authRepo.login(
          username: state.username,
          password: state.password,
        );

        if (userId != "Failed") {
          emit(LoginSuccess(userId: userId));
        } else {
          emit(LoginFailed(errorMessage: "Username or Password Incorrect"));
        }
      } catch (e) {
        emit(LoginFailed(errorMessage: e.toString()));
      }
    }
  }
}

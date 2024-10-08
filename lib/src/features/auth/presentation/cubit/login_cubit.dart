import 'package:Nott_A_Student/src/config/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepo;
  LoginCubit({required this.authRepo}) : super(LoginState());
  final logger = CustomLogger();

  void onUserNameChanged(String email) {
    if (email != state.email) {
      emit(state.copyWith(email: email));
    }
  }

  void onPasswordChanged(String password) {
    if (password != state.password) {
      emit(state.copyWith(password: password));
    }
  }

  // Future<void> onFormSubmit(String username,String password) async {
  Future<void> onFormSubmit() async {
    logger.info("${state.email} ${state.password}");

    if (state.email.isEmpty || state.password.isEmpty) {
      emit(LoginFailed(errorMessage: "Username or Password is empty"));
    } else {
      try {
        try {
          final userId = await authRepo.login(
              email: state.email, password: state.password);

          if (userId.isNotEmpty) {
            emit(LoginSuccess(userId: userId));
          }
        } catch (e) {
          emit(LoginFailed(errorMessage: e.toString()));
        }
      } catch (e) {
        emit(LoginFailed(errorMessage: e.toString()));
      }
    }
  }
}

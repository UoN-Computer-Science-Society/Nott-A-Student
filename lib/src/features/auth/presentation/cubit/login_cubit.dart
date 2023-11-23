import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepo;
  LoginCubit({required this.authRepo}) : super(LoginState());

  void onUserNameChanged(String email) {
    print(email);
    if (email != state.email) {
      emit(state.copyWith(email: email));
    }
  }

  void onPasswordChanged(String password) {
    print(password);
    if (password != state.password) {
      emit(state.copyWith(password: password));
    }
  }

  // Future<void> onFormSubmit(String username,String password) async {
  Future<void> onFormSubmit(BuildContext ctx) async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(LoginFailed(errorMessage: "Username or Password is empty"));
    } else {
      try {
        final userId = authRepo.login(
            email: state.email, password: state.password, context: ctx);

        userId.then((value) {
          if (value.isNotEmpty) {
            emit(LoginSuccess(userId: value));
          } else {
            emit(LoginFailed(errorMessage: "Username or Password Incorrect"));
          }
        });
      } catch (e) {
        emit(LoginFailed(errorMessage: e.toString()));
      }
    }
  }
}

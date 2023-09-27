import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_repo.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/intro.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/login.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/signup.dart';

class AppRouter {
  //final AuthRepository _authRepository = AuthRepository();
  final LoginCubit _loginCubit = LoginCubit(authRepo: AuthRepository());
  final SignupCubit _signupCubit = SignupCubit();
  Route onGenerateRoute(RouteSettings settings) {
    //final Object? key = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const Intro(),
        );
      case '/intro':
        return MaterialPageRoute(
          builder: (_) => const Intro(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _loginCubit,
            child: const Login(),
          ),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _signupCubit,
            child: const Signup(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _loginCubit,
            child: const Login(),
          ),
        );
    }
  }

  void dispose() {
    _loginCubit.close();
    _signupCubit.close();
  }
}

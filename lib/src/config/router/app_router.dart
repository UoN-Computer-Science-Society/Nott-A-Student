import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_repo.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/intro.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/login.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/signup.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/widgets/dashboard.dart';

class AppRouter {
  final LoginCubit _loginCubit = LoginCubit(authRepo: AuthRepository());
  final SignupCubit _signupCubit = SignupCubit(authRepo: AuthRepository());
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
      case '/dashboard':
        return MaterialPageRoute(
          builder: (_) => const Dashboard(),
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

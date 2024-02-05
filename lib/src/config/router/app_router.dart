import 'package:Nott_A_Student/src/features/timetable/presentation/views/TimeTable.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/views/dayView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_repo.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/view/account-view.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/view/intro.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/view/login.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/view/signup.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/views/bus.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/cubit/news_type_cubit.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/views/dashboard.dart';

class AppRouter {
  final LoginCubit _loginCubit = LoginCubit(authRepo: AuthRepository());
  final SignupCubit _signupCubit = SignupCubit(authRepo: AuthRepository());
  final NewsTypeCubit _newsTypeCubit = NewsTypeCubit();
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
      case '/timetable':
        return MaterialPageRoute(
          builder: (_) => const DayView(),
        );
      case '/account':
        return MaterialPageRoute(
          builder: (_) => const Account(),
        );
      case '/bus':
        return MaterialPageRoute(
          builder: (_) => const Bus(),
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

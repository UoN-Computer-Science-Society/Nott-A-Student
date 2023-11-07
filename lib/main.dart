import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/config/router/app_router.dart';
import 'package:nott_a_student/src/config/themes/app_theme.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_cubit.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_repo.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_status.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/login.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/cubit/news_type_cubit.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/views/dashboard.dart';
import 'package:nott_a_student/src/presentation/cubit/cubit/bottom_nav_bar_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create and initialize your AuthCubit
  final authCubit = AuthCubit();

  // Attempt auto-login
  await authCubit.attemptAutoLogin();
//authCubit.logout();
  runApp(
    BlocProvider.value(
      value: authCubit,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(authRepo: AuthRepository()),
        ),
        BlocProvider(
          create: (BuildContext context) => NewsTypeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => BottomNavBarCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Nott A Student',
        theme: AppTheme.style(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appRouter.onGenerateRoute,
        home: Scaffold(
          body: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state.authStatus is AuthAuthorized) {
                return const Dashboard();
              } else if (state.authStatus is AuthUnauthorized) {
                return const Login();
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _appRouter.dispose();
  }
}

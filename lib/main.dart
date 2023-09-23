import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/config/themes/app_theme.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/auth_repo.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.style(),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
            create: (_) => AuthRepository(),
          ),
          BlocProvider<LoginCubit>(
            create: (context) =>
                LoginCubit(authRepo: context.read<AuthRepository>()),
          ),
        ],
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Intro(),
    );
  }
}

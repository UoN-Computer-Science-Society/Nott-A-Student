import 'package:flutter/material.dart';
import 'package:nott_a_student/src/config/router/app_router.dart';
import 'package:nott_a_student/src/config/themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return /*  MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (_) => AuthRepository(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) =>
              LoginCubit(authRepo: context.read<AuthRepository>()),
        ),
      ],
      child: */
        MaterialApp(
      title: 'Nott A Student',
      theme: AppTheme.style(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.onGenerateRoute,
      /*      ), */
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _appRouter.dispose();
  }
}



/* class MyHomePage extends StatefulWidget {
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
 */


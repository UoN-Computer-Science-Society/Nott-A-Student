import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/bloc/timetable/cubit/school_timetable_cubit.dart';
import 'package:Nott_A_Student/src/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:Nott_A_Student/src/config/router/app_router.dart';
import 'package:Nott_A_Student/src/config/themes/app_theme.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_repo.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_status.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/account_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/view/intro.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/view/login.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/cubit/news_type_cubit.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/views/dashboard.dart';
import 'package:Nott_A_Student/src/presentation/cubit/cubit/bottom_nav_bar_cubit.dart';
import 'package:logging/logging.dart';
import 'dart:developer' as dev;

bool firstRun = true;
void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.INFO;
  // Create and initialize your AuthCubit
  final authCubit = AuthCubit();
  final accountCubit = AccountCubit();
  firstRun = await IsFirstRun.isFirstRun();
//authCubit.logout();
  initializeDateFormatting('en_MY', null);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider.value(
        value: authCubit,
      ),
      BlocProvider.value(
        value: accountCubit,
      ),
      // Add more BlocProvider.value as needed
    ],
    child: MyApp(),
  ));
  final log = Logger("Main");
  if (firstRun) log.info("First Run detected.");
  // Attempt auto-login
  await authCubit.attemptAutoLogin();
  // await accountCubit.initializeAccountInfo();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
        BlocProvider(create: (context) => LocationCubit()),
        BlocProvider(
          create: (BuildContext context) => NewsTypeCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => DashboardCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => BottomNavBarCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SchoolTimetableCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Nott A Student',
        theme: AppTheme.style(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appRouter.onGenerateRoute,
        home: Scaffold(
          body: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final log = Logger('MainAccount');
              if (firstRun) {
                dev.log("First Run");
                const cacheIntroImages = [
                  'lib/src/utils/resources/intro/intro_start.svg',
                  'lib/src/utils/resources/intro/intro_news.svg',
                  'lib/src/utils/resources/intro/intro_bus.svg',
                  'lib/src/utils/resources/intro/intro_timetable.svg',
                  'lib/src/utils/resources/intro/intro_end.svg'
                ];

                for (String img in cacheIntroImages) {
                  var loader = SvgAssetLoader(img);
                  svg.cache.putIfAbsent(
                      loader.cacheKey(null), () => loader.loadBytes(null));
                }
                return const Intro();
              } else {
                dev.log("First Run not detected");
                if (state.authStatus is AuthAuthorized) {
                  context.read<AccountCubit>().initializeAccountInfo();
                  return const Dashboard();
                } else if (state.authStatus is AuthUnauthorized) {
                  return const Login();
                } else if (state.authStatus is AuthInitial) {
                  return const SplashScreen();
                } else {
                  return const CircularProgressIndicator();
                }
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

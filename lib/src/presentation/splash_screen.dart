import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_status.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/account_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/view/login.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final log = Logger('MainAuth');
            {
              if (state.authStatus is AuthAuthorized) {
                log.info('Authorized Session. Going Dashboard...');
                final accountCubit = AccountCubit();
                accountCubit.initializeAccountInfo();
                return const Dashboard();
              } else if (state.authStatus is AuthUnauthorized) {
                log.info('Unauthorized Session. Going Login Page....');
                return const Login();
              } else {
                return const CircularProgressIndicator();
              }
            }
          },
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1C3064),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          horizontal: 84,
          vertical: 42,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 124),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'lib/src/utils/resources/nas_logo.png',
                  height: 200,
                  width: 200,
                  alignment: Alignment.center,
                )),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 138,
                width: 163,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Made with ❤️",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Image.asset('lib/src/utils/resources/CSS_dark.png',
                        height: 130,
                        width: 163,
                        alignment: Alignment.bottomCenter)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

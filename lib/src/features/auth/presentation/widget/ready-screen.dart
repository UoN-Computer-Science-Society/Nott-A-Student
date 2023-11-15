import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/submission_status.dart';

class ReadyScreen extends StatefulWidget {
  const ReadyScreen({super.key});

  @override
  State<ReadyScreen> createState() => _ReadyScreen();
}

class _ReadyScreen extends State<ReadyScreen> {
  String _username = "";
  @override
  void initState() {
    super.initState();
    _initializeField();
  }

  void _initializeField() {
    setState(() {
      _username = context.read<SignupCubit>().state.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome Aboard! $_username",
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
          const Gap(10),
          Text(
              "Your journey with Nott a Student begins now,and we're excited to  be part of it",
              style: Theme.of(context).textTheme.titleSmall),
          const Gap(10),
          Image.asset('lib/src/utils/resources/SignUpSuccess.jpeg'),
          const Gap(10),
          InkWell(
            onTap: (() {
              context.read<SignupCubit>().onFormSubmit(context);
            }),
            child: Container(
              width: 328, // Width of 328px
              height: 48, // Fixed height of 48px
              padding: const EdgeInsets.all(10), // Padding of 10px
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xff005697),
              ),
              child: const Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          BlocListener<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state.status is ProceedSuccess && state.step == 2) {
                context.read<SignupCubit>().onStepChanged(1);
              } else if (state.status is ProceedFailed) {
                // Show an error message to the user.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${state.status}'),
                    duration: const Duration(seconds: 3),
                  ),
                );
              } else if (state.status is SignupLoading) {
                const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status is SignupSuccess) {
                //context.read<SignupCubit>().updateUserPreferences();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Welcome'),
                    duration: Duration(seconds: 3),
                  ),
                );
                Navigator.of(context).pushNamed(
                  '/dashboard',
                );
                context.read<AuthCubit>().attemptAutoLogin();
                print("sign up sucesss");
              } else if (state.status is SignupFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("signup failed"),
                    duration: Duration(seconds: 3),
                  ),
                );
                Navigator.of(context).pushNamed(
                  '/signup',
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (() => {
                        /* context
                            .read<SignupCubit>()
                            .onStatusChanged(ProceedInitial()), */
                        context.read<SignupCubit>().onStepChanged(1),
                      }),
                  child: Row(children: [
                    Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text("Back",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/submission_status.dart';

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
      _username = context
          .read<SignupCubit>()
          .state
          .name; // Set the counter to your desired initial value.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
              "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
              height: 175.0),
          const Gap(20),
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
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.normal),
          ),
          const Gap(20),
          InkWell(
            onTap: (() {
              context.read<SignupCubit>().onFormSubmit();
              // context.read<AuthCubit>().attemptAutoLogin();
            }),
            child: Container(
              width: 250,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: const Center(
                child: Text(
                  "Get started",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          BlocListener<SignupCubit, SignupState>(
            listener: (context, state) {
              if (state.status is ProceedSuccess && state.step == 2) {
                context.read<SignupCubit>().onStepChanged(1);
              } else if (state is ProceedFailed) {
                // Show an error message to the user.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${state.status}'),
                    duration: const Duration(seconds: 3),
                  ),
                );
              } else /* if (state is SignupSuccess) */ {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Sign up Success.'),
                    duration: Duration(seconds: 3),
                  ),
                );
                Navigator.of(context).pushNamed(
                  '/login',
                );
                print("sign in sucesss");
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

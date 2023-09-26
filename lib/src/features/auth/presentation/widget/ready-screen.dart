import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/submission_status.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
              "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
              height: 175.0),
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome Aboard! [Username]",
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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Placeholder()),
              );
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
                    content: Text('Login failed: ${state.status}'),
                    duration: const Duration(seconds: 3),
                  ),
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

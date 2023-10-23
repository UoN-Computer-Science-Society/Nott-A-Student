import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/account-setup-form.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/personal-info-form.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/ready-screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int activeStep = 0;
  final totalStep = 2;
  bool proceed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,toolbarHeight: 0,),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Account",
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                ],
              ),
              const Gap(30),
              BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  return EasyStepper(
                    activeStep: context.read<SignupCubit>().state.step,
                    enableStepTapping: false,
                    lineLength: 100,
                    lineSpace: 0,
                    lineType: LineType.normal,
                    defaultLineColor: Colors.grey,
                    finishedLineColor: Theme.of(context).primaryColor,
                    activeStepTextColor: Theme.of(context).primaryColor,
                    finishedStepTextColor: Theme.of(context).primaryColor,
                    internalPadding: 0,
                    showLoadingAnimation: false,
                    stepRadius: 8,
                    showStepBorder: false,
                    steps: [
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor:
                                context.read<SignupCubit>().state.step >= 0
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                          ),
                        ),
                        title: 'Personal Information',
                      ),
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor:
                                context.read<SignupCubit>().state.step >= 1
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                          ),
                        ),
                        title: 'Account Setup',
                        topTitle: true,
                      ),
                      EasyStep(
                        customStep: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 7,
                            backgroundColor:
                                context.read<SignupCubit>().state.step >= 2
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                          ),
                        ),
                        title: 'Ready to Go',
                      ),
                    ],
                    onStepReached: (index) =>
                        setState(() => activeStep = index),
                  );
                },
              ),
              const Gap(30),
              BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
                if (state.step == 0) {
                  return const PersonalInfoForm();
                } else if (state.step == 1) {
                  return AccountSetup();
                } else {
                  return const ReadyScreen();
                }
              }),
              /* activeStep == 0
                      ? const PersonalInfoForm()
                      : (activeStep == 1
                          ? const AccountSetup()
                          : const ReadyScreen()), */
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:nott_a_student/src/config/themes/app_theme.dart';
import 'package:nott_a_student/src/features/welcome-page/login-screen/account_widget/account-setup-form.dart';
import 'package:nott_a_student/src/features/welcome-page/login-screen/account_widget/personal-info-form.dart';
import 'package:nott_a_student/src/features/welcome-page/login-screen/account_widget/ready-screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int activeStep = 0;
  final totalStep = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.style(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Gap(70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Account",
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                ],
              ),
              const Gap(40),
              EasyStepper(
                activeStep: activeStep,
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
                        backgroundColor: activeStep >= 0
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
                        backgroundColor: activeStep >= 1
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
                        backgroundColor: activeStep >= 2
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                    title: 'Ready to Go',
                  ),
                ],
                onStepReached: (index) => setState(() => activeStep = index),
              ),
              const Gap(30),
              activeStep == 0
                  ? const PersonalInfoForm()
                  : (activeStep == 1
                      ? const AccountSetup()
                      : const ReadyScreen()),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: activeStep != 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: (() => setState(() {
                                activeStep = activeStep - 1;
                              })),
                          child: Row(children: [
                            Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text("Back",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor)),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: activeStep != totalStep - 1,
                    child: InkWell(
                      onTap: (() => setState(() {
                            activeStep += 1;
                          })),
                      child: Container(
                        child: Row(children: [
                          Text("Next",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
                          Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).primaryColor,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

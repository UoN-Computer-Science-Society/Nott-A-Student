import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/submission_status.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/_showLoginButton.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/inputLabel.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  bool proceed = false;

  String name = '';
  String year = '';
  String school = '';
  String program = '';

  TextEditingController _namecontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _initializeName();
  }

  void _initializeName() {
    setState(() {
      _namecontroller.text = context.read<SignupCubit>().state.name; // Set the counter to your desired initial value.
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Step 1: Personal Infomation",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 20),
                  )
                ],
              ),
              const Gap(20),
              const InputLabel(label: "Name"),
              const Gap(10),
              _nameField(controller: _namecontroller),
              const Gap(20),
              _yearSelect(context),
              const Gap(20),
              _schoolSelect(context, state.school),
              const Gap(20),
              _programSelect(context),
              const Gap(10),
              const ShowLoginButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocListener<SignupCubit, SignupState>(
                    listenWhen:(previous, current) => previous.status != current.status,
                    listener: (context, state) {
                      if (state.status is ProceedSuccess && state.step == 0) {
                        context.read<SignupCubit>().onStepChanged(1);
                      } else if (state.status is ProceedFailed) {
                        // Show an error message to the user.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login failed: ${state.status}'),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    child: InkWell(
                      onTap: (() => {
                            context.read<SignupCubit>().onNextStep(0),
                          }),
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
        );
      },
    );
  }

  

  Widget _yearSelect(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = screenWidth - 48;
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return DropdownMenu(
          width: inputWidth,
          label: Text("Select Your Year",
              style: Theme.of(context).textTheme.labelLarge),
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: "Year 1", label: "Year 1"),
            DropdownMenuEntry(value: "Year 2", label: "Year 2"),
            DropdownMenuEntry(value: "Year 3", label: "Year 3")
          ],
          initialSelection: context.read<SignupCubit>().state.year,
          onSelected: (value) {
            year = value!;
            context.read<SignupCubit>().onYearChanged(value);
          },
        );
      },
    );
  }

  Widget _schoolSelect(BuildContext context, String storedSchool) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = screenWidth - 48;
    return DropdownMenu(
      width: inputWidth,
      label: Text("Select Your School",
          style: Theme.of(context).textTheme.labelLarge),
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: "Year 1", label: "Year 1"),
        DropdownMenuEntry(value: "Year 2", label: "Year 2"),
        DropdownMenuEntry(value: "Year 3", label: "Year 3")
      ],
      initialSelection: context.read<SignupCubit>().state.school,
      onSelected: (value) {
        school = value!;
        context.read<SignupCubit>().onSchoolChanged(value);
      },
    );
  }

  Widget _programSelect(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = screenWidth - 48;
    return DropdownMenu(
      width: inputWidth,
      label: Text("Select Your Program",
          style: Theme.of(context).textTheme.labelLarge),
      dropdownMenuEntries: const [
        DropdownMenuEntry(value: "Year 1", label: "Year 1"),
        DropdownMenuEntry(value: "Year 2", label: "Year 2"),
        DropdownMenuEntry(value: "Year 3", label: "Year 3"),
      ],
      initialSelection: context.read<SignupCubit>().state.program,
      onSelected: (value) {
        program = value!;
        context.read<SignupCubit>().onProgramChanged(value);
      },
      
    );
  }
}


class _nameField extends StatelessWidget {
  const _nameField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintStyle: Theme.of(context).textTheme.labelLarge,
            hintText: 'Enter your name',
          ),
          onChanged: (value) {
            //name = value;
            context.read<SignupCubit>().onNameChanged(value);
          },
               validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                    ])
        );
      },
    );
  }
}


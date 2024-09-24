import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/auth/domain/model/dept.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/submission_status.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/widget/_showLoginButton.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/widget/inputLabel.dart';
import 'package:Nott_A_Student/src/utils/constants/program.dart';

Future<List<DeptItem>> loadDropdownItems() async {
  final String jsonString =
      await rootBundle.loadString('lib/src/utils/constants/dept.json');
  final Map<String, dynamic> jsonMap = json.decode(jsonString);

  return jsonMap.entries
      .map((entry) => DeptItem.fromJson({
            'label': entry.key,
            'value': entry.value,
          }))
      .toList();
}

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

  List<DropdownMenuEntry<String>> deptList = [];
  List<DropdownMenuEntry<String>> programList = [];

  Future<List<DropdownMenuEntry<String>>> dropdownMenuEntries() async {
    final List<DeptItem> items = await loadDropdownItems();
    deptList = items.map((item) {
      return DropdownMenuEntry(value: item.value, label: item.label);
    }).toList();

    return deptList;
  }

  final TextEditingController _namecontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _initializeName();
    // dropdownMenuEntries().then((_) {
    //   // After the dropdown entries are loaded, rebuild the widget
    //   if (mounted) {
    //     setState(() {});
    //   }
    // });
  }

  void _initializeName() {
    setState(() {
      _namecontroller.text = context
          .read<SignupCubit>()
          .state
          .name; // Set the counter to your desired initial value.
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
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
              const Gap(10),
              const InputLabel(label: "Name"),
              _nameField(controller: _namecontroller),
              const Gap(10),
              const InputLabel(label: "School"),
              _schoolSelect(context),
              const Gap(10),
              const InputLabel(label: "Program"),
              _programSelect(context),
              const Gap(10),
              const InputLabel(label: "Year"),
              _yearSelect(context),
              const Gap(10),
              const ShowLoginButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocListener<SignupCubit, SignupState>(
                    listenWhen: (previous, current) =>
                        previous.status != current.status,
                    listener: (context, state) {
                      if (state.status is ProceedSuccess && state.step == 0) {
                        context.read<SignupCubit>().onStepChanged(1);
                      } else if (state.status is ProceedFailed) {
                        // Show an error message to the user.
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${state.status.props[0]}'),
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
                        margin: const EdgeInsets.symmetric(vertical: 24),
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
          inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.all(12),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF3F3F3F), width: 1)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF3F3F3F), width: 1))),
          width: inputWidth,
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: "Year 1", label: "Year 1"),
            DropdownMenuEntry(value: "Year 2", label: "Year 2"),
            DropdownMenuEntry(value: "Year 3", label: "Year 3"),
            DropdownMenuEntry(value: "Year 4", label: "Year 4"),
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

  Widget _schoolSelect(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double inputWidth = screenWidth - 48;
    return FutureBuilder(
        future: dropdownMenuEntries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            deptList = snapshot.data!;
            return DropdownMenu(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                inputDecorationTheme: InputDecorationTheme(
                    contentPadding: const EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color(0xFF3F3F3F), width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color(0xFF3F3F3F), width: 1))),
                width: inputWidth,
                menuHeight: screenHeight / 4,
                dropdownMenuEntries: deptList,
                initialSelection: context.read<SignupCubit>().state.school,
                onSelected: (value) {
                  school = value!;
                  context.read<SignupCubit>().onSchoolChanged(value);
                });
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget _programSelect(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double inputWidth = screenWidth - 48;

    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.school != current.school,
      builder: (context, state) {
        log("${state.school} test");
        programList = getProgramsForSchool(state.school);
        log("$programList");
        return DropdownMenu(
          key: Key(state.school),
          textStyle: Theme.of(context).textTheme.bodyMedium,
          inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.all(12),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF3F3F3F), width: 1)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF3F3F3F), width: 1))),
          width: inputWidth,
          menuHeight: screenHeight / 4,
          dropdownMenuEntries: programList.toList(),
          initialSelection: context.read<SignupCubit>().state.program,
          onSelected: (value) {
            program = value!;
            context.read<SignupCubit>().onProgramChanged(value);
          },
        );
      },
    );
  }

  List<DropdownMenuEntry<String>> getProgramsForSchool(String school) {
    // Load programs for school
    String selectedKey = school;
    Map<String, String> selectedData = data[selectedKey] ?? {};

    return createDropdownItems(selectedKey, selectedData);
  }
}

class _nameField extends StatelessWidget {
  const _nameField({
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextFormField(
            controller: _controller,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF3F3F3F), width: 1)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xFF3F3F3F), width: 1)),
              hintStyle: Theme.of(context).textTheme.labelLarge,
              hintText: 'Enter your name',
            ),
            onChanged: (value) {
              //name = value;
              context.read<SignupCubit>().onNameChanged(value);
            },
            validator: MultiValidator([
              RequiredValidator(errorText: "* Required"),
            ]));
      },
    );
  }
}

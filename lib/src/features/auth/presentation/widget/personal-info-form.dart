import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/_showLoginButton.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/inputLabel.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
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
          _nameField(context),
          const Gap(20),
          _yearSelect(context),
          const Gap(20),
          _schoolSelect(context),
          const Gap(20),
          _programSelect(context),
          const Gap(10),
          const ShowLoginButton(),
        ],
      ),
    );
  }
}


Widget _nameField(BuildContext context) {
  return TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintStyle: Theme.of(context).textTheme.labelLarge,
      hintText: 'Enter your name',
    ),
  );
}

Widget _yearSelect(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double inputWidth = screenWidth - 48;
  return DropdownMenu(
    width: inputWidth,
    label:
        Text("Select Your Year", style: Theme.of(context).textTheme.labelLarge),
    dropdownMenuEntries: const [
      DropdownMenuEntry(value: "Year 1", label: "Year 1"),
      DropdownMenuEntry(value: "Year 2", label: "Year 2"),
      DropdownMenuEntry(value: "Year 3", label: "Year 3")
    ],
  );
}

Widget _schoolSelect(BuildContext context) {
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
      DropdownMenuEntry(value: "Year 3", label: "Year 3")
    ],
  );
}

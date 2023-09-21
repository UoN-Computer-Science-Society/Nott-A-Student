import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
   // double screenWidth = 430;
    print(screenWidth);
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Step 1: Personal Infomation",
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const Gap(10),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Enter your name',
              focusColor: Theme.of(context).primaryColor,
            ),
          ),
          const Gap(20),
          DropdownMenu(
            label: const Text("Select Your Year"),
            width: screenWidth -16 ,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "Year 1", label: "Year 1"),
              DropdownMenuEntry(value: "Year 2", label: "Year 2"),
              DropdownMenuEntry(value: "Year 3", label: "Year 3")
            ],
          ),
          const Gap(20),
          DropdownMenu(
            label: const Text("Select your school"),
            width: screenWidth - 16,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "Year 1", label: "Year 1"),
              DropdownMenuEntry(value: "Year 2", label: "Year 2"),
              DropdownMenuEntry(value: "Year 3", label: "Year 3")
            ],
          ),
          const Gap(20),
          DropdownMenu(
            label: const Text("Select Your Program"),
            width: screenWidth - 16,
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "Year 1", label: "Year 1"),
              DropdownMenuEntry(value: "Year 2", label: "Year 2"),
              DropdownMenuEntry(value: "Year 3", label: "Year 3")
            ],
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Already have an account ? ',
                  style: Theme.of(context).textTheme.labelLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log In',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

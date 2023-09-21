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
    double inputWidth = screenWidth - 48;
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

        TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintStyle: Theme.of(context).textTheme.labelLarge,
              hintText: 'Enter your name',
            ),
          ),

          const Gap(20),
          // Wrap the DropdownMenu in a Container with the desired width

          DropdownMenu(
            width: inputWidth,
            label: Text("Select Your Year",style: Theme.of(context).textTheme.labelLarge),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "Year 1", label: "Year 1"),
              DropdownMenuEntry(value: "Year 2", label: "Year 2"),
              DropdownMenuEntry(value: "Year 3", label: "Year 3")
            ],
          ),
          const Gap(20),
          DropdownMenu(
            width: inputWidth,
            label: const Text("Select Your School",style: TextStyle(color: Colors.black),),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: "Year 1", label: "Year 1"),
              DropdownMenuEntry(value: "Year 2", label: "Year 2"),
              DropdownMenuEntry(value: "Year 3", label: "Year 3")
            ],
          ),
          const Gap(20),
          DropdownMenu(
            width: inputWidth,
            label: const Text("Select Your Program",style: TextStyle(color: Colors.black),),
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

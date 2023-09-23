import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/_showLoginButton.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/inputLabel.dart';

class AccountSetup extends StatelessWidget {
  const AccountSetup({super.key});

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
                "Step 2: Account Setup",
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
          const Gap(20),
          const InputLabel(label: "Username"),
          const Gap(10),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Create an username',
              hintStyle: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const Gap(20),
          const InputLabel(label: "Password"),
          const Gap(10),
          _passwordField(context),
          const Gap(20),
           const InputLabel(label: "Confirm Password"),
          const Gap(10),
          _confirmPasswordField(context),
          const Gap(10),
          const ShowLoginButton(),
        ],
      ),
    );
  }

  TextFormField _passwordField(BuildContext context) {
    return TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Enter your Password',
            hintStyle: Theme.of(context).textTheme.labelLarge,
          ),
        );
  }

  TextFormField _confirmPasswordField(BuildContext context) {
    return TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Confirm your password',
            hintStyle: Theme.of(context).textTheme.labelLarge,
          ),
        );
  }
}


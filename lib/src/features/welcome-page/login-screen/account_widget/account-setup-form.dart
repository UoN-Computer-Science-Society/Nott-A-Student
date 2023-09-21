import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Username",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const Gap(10),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Create an username',
              hintStyle: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const Gap(10),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter your Password',
              hintStyle: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Confirm password",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const Gap(10),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Confirm your password',
             hintStyle: Theme.of(context).textTheme.labelLarge,
            ),
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

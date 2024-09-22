import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/submission_status.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/widget/show_login_button.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/widget/input_label.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmPasswordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeField();
  }

  void _initializeField() {
    setState(() {
      _emailcontroller.text = context
          .read<SignupCubit>()
          .state
          .email; // Set the counter to your desired initial value.
      _passwordcontroller.text = context
          .read<SignupCubit>()
          .state
          .password; // Set the counter to your desired initial value.
      _confirmPasswordcontroller.text = context
          .read<SignupCubit>()
          .state
          .confirmPassword; // Set the counter to your desired initial value.
    });
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Step 2: Account Setup",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 20),
                )
              ],
            ),
            const Gap(10),
            const InputLabel(label: "Email"),
            EmailField(emailcontroller: _emailcontroller),
            const Gap(10),
            const InputLabel(label: "Password"),
            PasswordField(passwordcontroller: _passwordcontroller),
            const Gap(10),
            const InputLabel(label: "Confirm Password"),
            ConfirmPasswordField(
                confirmPasswordcontroller: _confirmPasswordcontroller),
            const Gap(10),
            const ShowLoginButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (() => {
                            context
                                .read<SignupCubit>()
                                .onStatusChanged(ProceedInitial()),
                            context.read<SignupCubit>().onStepChanged(0),
                          }),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 24),
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
                    ),
                  ],
                ),
                BlocListener<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state.status is ProceedSuccess &&
                        state.step == 1 &&
                        !state.isAccountSetupEmpty) {
                      context.read<SignupCubit>().onStepChanged(2);
                    } else if (state.status is ProceedFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login failed: ${state.status}'),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    } else {
                      log("error");
                    }
                  },
                  child: InkWell(
                    onTap: (() => {
                          if (formkey.currentState!.validate())
                            {
                              context.read<SignupCubit>().onNextStep(1),
                              log("Validated"),
                            }
                          else
                            {
                              log("Not Validated"),
                            }
                        }),
                    child: Row(children: [
                      Text("Next",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor)),
                      Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).primaryColor,
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmPasswordField extends StatefulWidget {
  const ConfirmPasswordField({
    super.key,
    required TextEditingController confirmPasswordcontroller,
  }) : _confirmPasswordcontroller = confirmPasswordcontroller;

  final TextEditingController _confirmPasswordcontroller;

  @override
  State<ConfirmPasswordField> createState() => ConfirmPasswordFieldState();
}

class ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool confirmPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !confirmPasswordVisible,
      controller: widget._confirmPasswordcontroller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF3F3F3F), width: 1)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF3F3F3F), width: 1)),
        hintText: 'Confirm your password',
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        suffixIcon: IconButton(
          icon: Icon(
              confirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(
              () {
                confirmPasswordVisible = !confirmPasswordVisible;
              },
            );
          },
        ),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return "* Required";
        }
        if (val != context.read<SignupCubit>().state.password) {
          return "Passwords do not match";
        }
        return null; // Validation passed
      },
      onChanged: (value) {
        context.read<SignupCubit>().onConfirmPasswordChanged(value);
        //confirmPassword = value;
      },
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required TextEditingController passwordcontroller,
  }) : _passwordcontroller = passwordcontroller;

  final TextEditingController _passwordcontroller;

  @override
  State<PasswordField> createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !passwordVisible,
      controller: widget._passwordcontroller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF3F3F3F), width: 1)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF3F3F3F), width: 1)),
        hintText: 'Enter your Password',
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(
              () {
                passwordVisible = !passwordVisible;
              },
            );
          },
        ),
      ),
      validator: MultiValidator(
        [
          RequiredValidator(errorText: "* Required"),
          MinLengthValidator(8,
              errorText: "Password should be atleast 8 characters"),
          MaxLengthValidator(16,
              errorText: "Password should not be greater than 16 characters")
        ],
      ),
      onChanged: (value) {
        context.read<SignupCubit>().onPasswordChanged(value);
        // password = value;
      },
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required TextEditingController emailcontroller,
  }) : _emailcontroller = emailcontroller;

  final TextEditingController _emailcontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _emailcontroller,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF3F3F3F), width: 1)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF3F3F3F), width: 1)),
          hintText: 'Enter your email',
          hintStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        onChanged: (value) {
          context.read<SignupCubit>().onEmailChanged(value);
        },
        validator: MultiValidator([
          RequiredValidator(errorText: "* Required"),
          EmailValidator(errorText: "Enter valid email"),
        ]));
  }
}

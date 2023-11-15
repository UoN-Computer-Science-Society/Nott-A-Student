import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/account_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/widget/inputLabel.dart';
import 'package:logging/logging.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final log = Logger('Login');
  bool passwordVisible = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Nott A Student",
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const Gap(20),
              const InputLabel(label: "Email"),
              const Gap(20),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
                onChanged: (value) => {
                  BlocProvider.of<LoginCubit>(context).onUserNameChanged(value),
                  email = value,
                },
                validator: MultiValidator(
                  [
                    RequiredValidator(errorText: "* Required"),
                    EmailValidator(errorText: "Enter valid email"),
                  ],
                ),
              ),
              const Gap(20),
              const InputLabel(label: "Password"),
              const Gap(20),
              TextFormField(
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
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
                      /*    MaxLengthValidator(15,
                          errorText:
                              "Password should not be greater than 15 characters") */
                    ],
                  ),
                  onChanged: (value) => {
                        BlocProvider.of<LoginCubit>(context)
                            .onPasswordChanged(value),
                        password = value
                      }),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Not your account ? ',
                      style: Theme.of(context).textTheme.labelLarge,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Sign In',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed(
                                  '/signup',
                                );
                              }),
                      ],
                    ),
                  )
                ],
              ),
              const Gap(20),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) async {
                  if (state is LoginSuccess) {
                    await context.read<AuthCubit>().attemptAutoLogin();
                    context.read<AccountCubit>().initializeAccountInfo();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login success: Welcome ${state.userId}'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    Navigator.of(context).pushNamed(
                      '/dashboard',
                    );
                  } else if (state is LoginFailed) {
                    // Show an error message to the user.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login failed: ${state.errorMessage}'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                child: InkWell(
                  onTap: (() {
                    if (formkey.currentState!.validate()) {
                      context.read<LoginCubit>().onUserNameChanged(email);
                      context.read<LoginCubit>().onPasswordChanged(password);
                      context.read<LoginCubit>().onFormSubmit(context);
                      log.info("Validated Information");
                    } else {
                      log.info("Not Validated");
                    }
                  }),
                  child: /* Container(
                    width: 250,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff005697),
                    ),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ), */
                      Container(
                    width: 328, // Width of 328px
                    height: 48, // Fixed height of 48px
                    padding: const EdgeInsets.all(10), // Padding of 10px
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff005697),
                    ),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/signup.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/inputLabel.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    String username = '';
    String password = '';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Gap(70),
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
              const InputLabel(label: "Username"),
              const Gap(20),
              TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Enter your username',
                    focusColor: Theme.of(context).primaryColor,
                  ),
                  onChanged: (value) => {
                        /*  BlocProvider.of<LoginCubit>(context)
                            .onUserNameChanged(value), */
                        username = value,
                      }),
              const Gap(20),
              const InputLabel(label: "Password"),
              const Gap(20),
              TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                  ),
                  onChanged: (value) => {
                        /*   BlocProvider.of<LoginCubit>(context)
                            .onPasswordChanged(value), */
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
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()),
                                );
                              }),
                      ],
                    ),
                  )
                ],
              ),
              const Gap(20),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login success: Welcome ${state.userId}'),
                        duration: Duration(seconds: 3),
                      ),
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
                    // context.read()<LoginCubit>().onFormSubmit(username,password);
                    context.read<LoginCubit>().onUserNameChanged(username);
                    context.read<LoginCubit>().onPasswordChanged(password);
                    context.read<LoginCubit>().onFormSubmit();
                  }),
                  child: Container(
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

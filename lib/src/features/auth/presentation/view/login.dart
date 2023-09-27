import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/inputLabel.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
/*     String username = '';
    String password = ''; */
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                ),
                onChanged: (value) => {
                  BlocProvider.of<LoginCubit>(context).onUserNameChanged(value),
                  // username = value,
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
                        //   password = value
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

                    if (formkey.currentState!.validate()) {
                      //   context.read<LoginCubit>().onUserNameChanged(username);
                      // context.read<LoginCubit>().onPasswordChanged(password);
                      context.read<LoginCubit>().onFormSubmit();
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
                    /*  context.read<LoginCubit>().onUserNameChanged(username);
                    context.read<LoginCubit>().onPasswordChanged(password);
                    context.read<LoginCubit>().onFormSubmit(); */
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

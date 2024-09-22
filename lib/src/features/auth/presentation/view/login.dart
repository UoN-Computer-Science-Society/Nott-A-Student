import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/account_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/widget/input_label.dart';
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(backgroundColor: Colors.white),
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Complete the personal details below",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 29),
                const InputLabel(label: "Email"),
                // const SizedBox(height: 16),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color(0xFF3F3F3F), width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color(0xFF3F3F3F), width: 1)),
                    // hintText: 'Enter your email',
                  ),
                  onChanged: (value) => {
                    BlocProvider.of<LoginCubit>(context)
                        .onUserNameChanged(value),
                    email = value,
                  },
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter a valid email"),
                    ],
                  ),
                ),
                const Gap(20),
                const InputLabel(label: "Password"),
                TextFormField(
                    style: Theme.of(context).textTheme.bodyLarge,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFF3F3F3F), width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFF3F3F3F), width: 1)),
                      // hintText: 'Enter your password',
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
                            errorText:
                                "Password should be atleast 8 characters"),
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
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.labelLarge,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sign Up',
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacementNamed(
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login success!'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                      //await context.read<AuthCubit>().attemptAutoLogin();
                      context.read<AccountCubit>().initializeAccountInfo();
                      Navigator.of(context).pushNamed(
                        '/dashboard',
                      );
                    } else if (state is LoginFailed) {
                      // Show an error message to the user.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login failed: ${state.errorMessage}'),
                          duration: const Duration(seconds: 3),
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
                    child: 
                        Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
             const Gap(20),
            TextFormField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Enter your username',
                focusColor: Theme.of(context).primaryColor,
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
             const Gap(20),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your password',
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Not your account ? ',
                   style: Theme.of(context).textTheme.labelLarge,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Gap(20),
            InkWell(
              onTap: (() {
                /*  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Signup()),
                    ); */
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

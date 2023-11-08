import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_status.dart';
import 'package:Nott_A_Student/src/features/auth/domain/session.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/account_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/widget/inputLabel.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Hero(
        tag: 'Acccount',
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      "Profile",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  children: [
                    const InputLabel(label: "Name"),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          context.read<AccountCubit>().state.name,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const InputLabel(label: "Email"),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          context.read<AccountCubit>().state.email,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const InputLabel(label: "Year"),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.read<AccountCubit>().state.year,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 20),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const InputLabel(label: "School"),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.read<AccountCubit>().state.school,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 20),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const InputLabel(label: "Program"),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.read<AccountCubit>().state.program,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state.authStatus is AuthUnauthorized) {
                      Navigator.of(context).popAndPushNamed(
                        '/login',
                      );
                    }
                  },
                  child: InkWell(
                    onTap: (() {
                      context.read<AuthCubit>().logout();
                    }),
                    child: Container(
                      width: 328, // Width of 328px
                      height: 48, // Fixed height of 48px
                      padding: const EdgeInsets.all(10), // Padding of 10px
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(50), // Border-radius of 50px
                        border: Border.all(
                          color: Color(0xFFC50243), // Border color
                          width: 2, // Border width of 2px
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            color: Color(0xFFC50243), // Text color
                            fontSize: 16, // Text font size
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_cubit.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_status.dart';
import 'package:nott_a_student/src/features/auth/domain/session.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/account_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/widget/inputLabel.dart';
import 'package:nott_a_student/src/presentation/widget/nav-bar.dart';
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
      body: BlocBuilder<AccountCubit, AccountState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return Hero(
            tag: 'Acccount',
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Account",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                const Gap(15),
                const InputLabel(label: "Name"),
                const Gap(15),
                TextFormField(
                  initialValue: context.read<AccountCubit>().state.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // hintText: 'Enter your email',
                  ),
                  readOnly: true,
                ),
                const Gap(15),
                const InputLabel(label: "Email"),
                const Gap(15),
                TextFormField(
                  initialValue: context.read<AccountCubit>().state.email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    // hintText: 'Enter your email',
                  ),
                  readOnly: true,
                ),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Details",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.read<AccountCubit>().state.year,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 20),
                  ],
                ),
                const Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.read<AccountCubit>().state.school,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 20),
                  ],
                ),
                const Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.read<AccountCubit>().state.program,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ],
                ),
                const Gap(35),
                InkWell(
                  onTap: (() {
                    context.read<AuthCubit>().logout();
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
                        "Manage Account",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const Gap(15),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state.authStatus is AuthUnauthorized) {
                      Navigator.of(context).pushNamed(
                        '/login',
                      );
                    }
                  },
                  child: InkWell(
                    onTap: (() {
                      context.read<AuthCubit>().logout();
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
                          "Logout",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(context.read<AccountCubit>().state.year),
                Text(context.read<AccountCubit>().state.school),
                Text(context.read<AccountCubit>().state.program),
              ]),
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

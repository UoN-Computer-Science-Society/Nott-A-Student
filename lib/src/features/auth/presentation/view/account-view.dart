import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_cubit.dart';
import 'package:nott_a_student/src/presentation/widget/nav-bar.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Column(children: [
        const Text('Name'),
        Text(context.read<AuthCubit>().state.name),
         Text(context.read<AuthCubit>().state.email),
          Text(context.read<AuthCubit>().state.year),
           Text(context.read<AuthCubit>().state.school),
            Text(context.read<AuthCubit>().state.program),

        

      ]),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

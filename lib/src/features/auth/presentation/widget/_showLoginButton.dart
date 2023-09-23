import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_repo.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:nott_a_student/src/features/auth/presentation/view/login.dart';

class ShowLoginButton extends StatelessWidget {
  const ShowLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => RepositoryProvider(
                                  create: (context) => AuthRepository(),
                                  child: BlocProvider(
                                    create: (context) => LoginCubit(
                                        authRepo:
                                            context.read<AuthRepository>()),
                                    child: Login(),
                                  ),
                                )),
                      );
                    }),
            ],
          ),
        )
      ],
    );
  }
}

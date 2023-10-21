import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


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
                      Navigator.of(context).pushNamed(
                        '/login',
                      );
                    }),
            ],
          ),
        )
      ],
    );
  }
}

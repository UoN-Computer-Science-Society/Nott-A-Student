import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    //final Size screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Nott-A-Bus",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

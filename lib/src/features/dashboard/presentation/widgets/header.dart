import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nott-A-News",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            const Gap(5),
            Text(DateFormat('EEEE, d MMMM y').format(DateTime.now()),
                style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
     
      ],
    );
  }
}

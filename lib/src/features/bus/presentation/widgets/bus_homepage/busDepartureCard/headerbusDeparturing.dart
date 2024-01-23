import 'package:flutter/material.dart';

class HeaderBusDepartureCard extends StatelessWidget {
  const HeaderBusDepartureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize:
              MainAxisSize.min, // This makes the Row occupy minimal space
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.timer_sharp, color: Colors.black),
            ),
            Text(
              "Departing Soon",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}

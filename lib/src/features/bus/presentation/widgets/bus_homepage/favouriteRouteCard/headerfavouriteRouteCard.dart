import 'package:flutter/material.dart';

class HeaderFavouriteRouteCard extends StatelessWidget {
  const HeaderFavouriteRouteCard({super.key});

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
              icon: const Icon(Icons.star, color: Colors.yellow),
            ),
            Text(
              "Favourite Route",
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

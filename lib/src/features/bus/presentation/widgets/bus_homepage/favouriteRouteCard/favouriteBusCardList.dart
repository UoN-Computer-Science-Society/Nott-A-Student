import 'package:flutter/material.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteBusCarddetails.dart';

class FavouriteBusCardList extends StatelessWidget {
  final int itemCount; // Number of cards to display

  const FavouriteBusCardList({
    super.key,
    this.itemCount = 5, // Default to 5 cards
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190, // Adjust the height to fit the content of the cards
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                left: index == 0 ? 16 : 8,
                right: index == itemCount - 1 ? 16 : 8),
            child: const FavouriteBusCardDetails(),
          );
        },
      ),
    );
  }
}

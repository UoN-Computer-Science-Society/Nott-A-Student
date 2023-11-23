import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteBusCardList.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/headerfavouriteRouteCard.dart';

// ignore: camel_case_types
class favouriteRouteCard extends StatelessWidget {
  const favouriteRouteCard({super.key});

  @override
  Widget build(BuildContext context) {
    //final Size screenSize = MediaQuery.of(context).size;
    return Container(
      //color: const Color(0xFF1C3064), // Set the color of the Container
      padding: const EdgeInsets.all(10.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderFavouriteRouteCard(),
          Gap(5),
          FavouriteBusCardList(),
        ],
      ),
    );
  }
}

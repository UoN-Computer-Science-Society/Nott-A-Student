import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/header.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/searchBar.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/searchButton.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //final Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF1C3064), // Set the color of the Container
      padding: const EdgeInsets.all(16.0),
/*       decoration: const ShapeDecoration(
        //color: Color(0xFF1C3064),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x33454745),
            blurRadius: 20,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ), */
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          const Gap(5),
          Row(children: [
            Text(
              'From:',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.white),
            ),
          ]),
          const Gap(5),
          const searchBar(),
          const Gap(5),
          Row(children: [
            Text(
              'To:',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.white),
            ),
          ]),
          const Gap(5),
          const searchBar(),
          const Gap(15),
          const searchButton()
        ],
      ),
    );
  }
}

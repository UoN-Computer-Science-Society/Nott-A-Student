import 'package:flutter/material.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/busDepartureCard.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteRouteCard.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/headerContainer.dart';
import 'package:nott_a_student/src/presentation/widget/nav-bar.dart';

class Bus extends StatefulWidget {
  const Bus({super.key});

  @override
  State<Bus> createState() => _BusState();
}

class _BusState extends State<Bus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          const HeaderContainer(),
          Expanded(
            child: ListView(
                scrollDirection: Axis.vertical,
                children: const [favouriteRouteCard(), BusDepartureCard()]),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

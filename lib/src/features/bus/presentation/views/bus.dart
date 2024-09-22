import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/bus_departing_header.dart';
import 'package:flutter/material.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/bus_departure_card.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteBusCardList.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/headerfavouriteRouteCard.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/header_container.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav_bar.dart';

class Bus extends StatefulWidget {
  const Bus({Key? key});

  @override
  State<Bus> createState() => _BusState();
}

class _BusState extends State<Bus> {
  final GlobalKey<FavouriteBusCardListState> _favouriteBusCardListKey =
      GlobalKey<FavouriteBusCardListState>();

  @override
  void initState() {
    super.initState();
    _favouriteBusCardListKey.currentState?.rebuild();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _favouriteBusCardListKey.currentState?.rebuild();
          // Simulate a delay
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const HeaderContainer(),
              const HeaderFavouriteRouteCard(),
              FavouriteBusCardList(
                key: _favouriteBusCardListKey,
              ),
               const HeaderBusDepartureCard(),
              const BusDepartureCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

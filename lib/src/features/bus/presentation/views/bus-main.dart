import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/busDepartureCard.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteRouteCard.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/headerContainer.dart';
import 'package:nott_a_student/src/presentation/widget/nav-bar.dart';

class BusMain extends StatefulWidget {
  const BusMain({super.key});

  @override
  State<BusMain> createState() => _BusMainState();
}

class _BusMainState extends State<BusMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const HeaderContainer(),
          BlocListener<LocationCubit, LocationState>(
            listener: (context, state) {
              if (state.route != "") {
                Navigator.of(context).pushNamed("/bus");
              }
            },
            child: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const favouriteRouteCard(),
                  const BusDepartureCard(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

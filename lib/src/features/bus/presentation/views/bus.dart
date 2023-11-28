
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/bus/data/data%20source/retrieveTimetable.dart';
import 'package:nott_a_student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/headerContainer.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/route_detail_table.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/single_day_route_detail_table.dart';
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
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[const HeaderContainer()];
            },
            body: FutureBuilder<Map<String, List<String>>>(
              future: getTimeTable(context.read<LocationCubit>().state.route),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text('Press button to start.');
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return const Text('Awaiting result...');
                  case ConnectionState.done:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    return PageView(
                      children: <Widget>[
                        RouteDetailTable(
                          timetableData: snapshot.data!,
                          route: context.read<LocationCubit>().state.route,
                        ),
                        SingleDayRouteDetailTable(
                          timetableData: snapshot.data!,
                          route: context.read<LocationCubit>().state.route,
                        ),
                      ],
                    );
                }
              },
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

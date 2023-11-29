import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:Nott_A_Student/src/features/bus/data/data%20source/retrieveTimetable.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/views/route_details_page.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/busDepartureCard.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteRouteCard.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/header_homepage/headerContainer.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/route_detail_table.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/single_day_route_detail_table.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-bar.dart';

class Bus extends StatefulWidget {
  const Bus({super.key});

  @override
  State<Bus> createState() => _BusState();
}

class _BusState extends State<Bus> {
  String currentDay = DateFormat('EEEE').format(DateTime.now());
  String viewType = "single";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          return Column(
            children: [
              const HeaderContainer(),
              context.read<LocationCubit>().state.route == ""
                  ? Expanded(
                      child: ListView(
                        children: [
                          const favouriteRouteCard(),
                          const BusDepartureCard()
                        ],
                      ),
                    )
                  : Expanded(
                      child: FutureBuilder<Map<String, List<String>>>(
                        future: getTimeTable(
                            context.read<LocationCubit>().state.route),
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
                              return ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  context
                                                      .read<LocationCubit>()
                                                      .state
                                                      .route,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                      builder: (context) => RouteDetailsPage(
                                                          departure: context
                                                              .read<
                                                                  LocationCubit>()
                                                              .state
                                                              .depature,
                                                          destination: context
                                                              .read<
                                                                  LocationCubit>()
                                                              .state
                                                              .destination,
                                                          timetableData:
                                                              snapshot.data![
                                                                  currentDay]!),
                                                    ));
                                                  },
                                                  child: Text(
                                                    "Route Details",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              viewType = viewType == "single"
                                                  ? "all"
                                                  : "single";
                                            });
                                          },
                                          icon: viewType == "single"
                                              ? const Icon(Icons.grid_view)
                                              : const Icon(
                                                  Icons.view_column_outlined),
                                        ),
                                      ],
                                    ),
                                  ),
                                  viewType == "single"
                                      ? SingleDayRouteDetailTable(
                                          timetableData: snapshot.data!,
                                          route: context
                                              .read<LocationCubit>()
                                              .state
                                              .route)
                                      : RouteDetailTable(
                                          timetableData: snapshot.data!,
                                          route: context
                                              .read<LocationCubit>()
                                              .state
                                              .route),
                                ],
                              );
                          }
                        },
                      ),
                    ),
            ],
          );
        },
      ),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}

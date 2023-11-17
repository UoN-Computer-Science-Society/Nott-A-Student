import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nott_a_student/src/features/bus/data/data%20source/retrieveTimetable.dart';
import 'package:nott_a_student/src/features/bus/presentation/views/route_details_page.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/busDepartureCard.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteRouteCard.dart';
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
  Future<Map<String, List<String>>> _timetableData =
      getTimeTable("KTM to Campus");
  String currentDay = DateFormat('EEEE').format(DateTime.now());
  String viewType = "single";
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
            child: FutureBuilder<Map<String, List<String>>>(
              future: getTimeTable("KTM to Campus"),
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
                        //    const favouriteRouteCard(),
                        //    const BusDepartureCard(),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "KTM to Campus",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                RouteDetailsPage(
                                                  departure: "KTM",
                                                  destination: "Campus",
                                                    timetableData:
                                                        snapshot.data![currentDay]!),
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
                                    viewType =
                                        viewType == "single" ? "all" : "single";
                                  });
                                },
                                icon: viewType == "single"
                                    ? const Icon(Icons.grid_view)
                                    : const Icon(Icons.view_column_outlined),
                              ),
                            ],
                          ),
                        ),
                        viewType == "single"
                            ? SingleDayRouteDetailTable(
                                timetableData: snapshot.data!,
                                route: "KTM to Campus")
                            : RouteDetailTable(
                                timetableData: snapshot.data!,
                                route: "KTM to Campus"),
                      ],
                    );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

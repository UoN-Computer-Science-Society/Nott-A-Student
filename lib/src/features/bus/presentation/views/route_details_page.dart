import 'package:Nott_A_Student/src/features/bus/data/data%20source/retrieveTimetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/bus/data/data%20source/local/favouriteRoute.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteBusCarddetails.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RouteDetailsPage extends StatefulWidget {
  final List<String> timetableData;
  final String departure;
  final String destination;

  const RouteDetailsPage(
      {super.key,
      required this.timetableData,
      required this.departure,
      required this.destination});

  @override
  State<RouteDetailsPage> createState() => _RouteDetailsPageState();
}

class _RouteDetailsPageState extends State<RouteDetailsPage> {
  bool routeExists = false;
  int duration = 0;

  @override
  void initState() {
    super.initState();
    _initializeIcons();
  }

  Future<void> _initializeIcons() async {
    String route = '${widget.departure} to ${widget.destination}';
    bool exists = await checkIsRouteExists(route);
    setState(() {
      routeExists = exists;
      duration = getEstimateTripDuration(route);
    });
  }

  Future<void> _updateIcons() async {
    String route = '${widget.departure} to ${widget.destination}';
    setState(() {
      // Assuming addToFavourite returns a Future<void>
      context.read<LocationCubit>().addOrRemoveFavourite(route);
      routeExists = !routeExists;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth * 0.1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  icon: const Icon(Icons.arrow_back)),
              IconButton(
                onPressed: (() {
                  _updateIcons();
                }),
                icon: (routeExists)
                    ? const Icon(Icons.star, color: Colors.yellow)
                    : const Icon(Icons.star_border, color: Colors.yellow),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "From",
                        style: TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        widget.departure,
                        style: const TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const BusInfo(busId: 'VCK2020')
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "From",
                        style: TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        widget.destination,
                        style: const TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Estimated Trip Duration",
                        style: TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${duration.toString()} minutes',
                        style: const TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Remind Departure Time",
                    style: TextStyle(
                      color: Color(0xFF3E3E3E),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //buildTimetable(context),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 2.0, // spacing between boxes
                runSpacing: 3.0, // spacing between rows
                children: widget.timetableData.map((item) {
                  return Container(
                    margin: const EdgeInsets.all(2.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(item,
                        style: Theme.of(context).textTheme.labelMedium),
                  );
                }).toList(),
              ),

              const SizedBox(height: 10),
              Container(
                width: screenWidth * 0.8,
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 12), // doesn't fix the size of the screen
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFF059CC0),
                ),
                child: const Text(
                  'Remind Me',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Route Map",
                    style: TextStyle(
                      color: Color(0xFF3E3E3E),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

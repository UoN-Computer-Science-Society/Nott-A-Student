import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/bus_homepage/favouriteRouteCard/favouriteBusCarddetails.dart';
import 'package:nott_a_student/src/presentation/widget/nav-bar.dart';

class RouteDetailsPage extends StatefulWidget {
  final List<String> timetableData;
  final String departure;
  final String destination;
  RouteDetailsPage({super.key, required this.timetableData, required this.departure, required this.destination});

  @override
  State<RouteDetailsPage> createState() => _RouteDetailsPageState();
}

class _RouteDetailsPageState extends State<RouteDetailsPage> {
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
              const Icon(Icons.star_border, color: Colors.yellow),
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Estimated Trip Duration",
                        style: TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "15 mins",
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
              buildTimetable(context),
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

  Widget buildTimetable(BuildContext context) {
    List<Widget> rows = [];
    for (int i = 0; i < widget.timetableData.length; i += 4) {
      List<String> rowTimes = widget.timetableData.sublist(
          i, i + 4 < widget.timetableData.length ? i + 4 : widget.timetableData.length);
      rows.add(buildRow(rowTimes, context));
    }

    return Column(
      children: rows,
    );
  }

  Widget buildRow(List<String> rowTimes, BuildContext context) {
    return Row(
      children: rowTimes
          .map((time) => Container(
                margin: const EdgeInsets.all(2.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(100),
                ),
                child:
                    Text(time, style: Theme.of(context).textTheme.titleSmall),
              ))
          .toList(),
    );
  }
}

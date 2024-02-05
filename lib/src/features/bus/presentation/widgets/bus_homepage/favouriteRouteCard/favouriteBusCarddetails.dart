import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/views/route_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:Nott_A_Student/src/features/bus/data/data%20source/retrieveTimetable.dart';

class FavouriteBusCardDetails extends StatefulWidget {
  final String route;

  const FavouriteBusCardDetails({super.key, required this.route});

  @override
  State<FavouriteBusCardDetails> createState() =>
      _FavouriteBusCardDetailsState();
}

class _FavouriteBusCardDetailsState extends State<FavouriteBusCardDetails> {
   String departure = "";
   String destination= "";
  String currentDay = DateFormat('EEEE').format(DateTime.now());
  bool visible = true;

  @override
  void initState() {
    super.initState();
    List<String> parts = widget.route.split(' to ');

    if (parts.length == 2) {
      departure = parts[0];
      destination = parts[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<String>>>(
        future: getTimeTable('${departure} to ${destination}'),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return Visibility(
                visible: visible,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RouteDetailsPage(
                        departure: departure,
                        destination: destination,
                        timetableData: snapshot.data![currentDay]!,
                      ),
                    ));
                  },
                  child: Container(
                    width: 284,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF4252B1),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LocationInfo(
                            title: 'From',
                            location: departure,
                            icon: IconButton(
                              icon: const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              onPressed: () {
                                setState(() {
                                  visible = false;
                                });
                                context
                                    .read<LocationCubit>()
                                    .addOrRemoveFavourite(widget.route);
                              },
                            )),
                        const SizedBox(height: 10),
                        LocationInfo(
                          title: 'To',
                          location: destination,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BusInfo(busId: 'VCK2020'),
                            FutureBuilder<Map<String, List<String>>>(
                                future: getTimeTable(widget.route),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.none:
                                      return const Text(
                                          'Press button to start.');
                                    case ConnectionState.active:
                                    case ConnectionState.waiting:
                                      return const Text('Awaiting result...');
                                    case ConnectionState.done:
                                      if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      }
                                      return ArrivalInfo(
                                          timetableData:
                                              snapshot.data![currentDay]!);
                                  }
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
          }
        });
  }
}

class LocationInfo extends StatelessWidget {
  final String title;
  final String location;
  final IconButton? icon; // Optional icon

  const LocationInfo({
    Key? key,
    required this.title,
    required this.location,
    this.icon, // Optional icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF3E3E3E),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                location,
                style: const TextStyle(
                  color: Color(0xFF3E3E3E),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (icon != null) icon!, // Only display the icon if it's not null
      ],
    );
  }
}

class BusInfo extends StatelessWidget {
  final String busId;

  const BusInfo({
    Key? key,
    required this.busId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF3E3E3E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        busId,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

String findNearestArrivalTime(List<String> arrivalTimes) {
  DateTime currentTime = DateTime.now();
  DateTime nearestBusTime = DateTime(2100);
  bool found = false;

  for (String arrivalTime in arrivalTimes) {
    if (arrivalTime == "No BusM") {
      return "No bus today";
    }

    try {
      DateTime busTime = DateFormat('h.mm a').parse(arrivalTime);
      busTime = DateTime(currentTime.year, currentTime.month, currentTime.day,
          busTime.hour, busTime.minute);
      if (busTime.compareTo(currentTime) >= 0 &&
          busTime.compareTo(nearestBusTime) < 0) {
        nearestBusTime = busTime;
        found = true;
      }
    } catch (e) {
      // Handle invalid time format or other exceptions
      print('Invalid time format: $arrivalTime');
    }
  }
  if (!found) {
    return "Last bus has gone";
  }

  return DateFormat('h:mm a').format(nearestBusTime);
}

class ArrivalInfo extends StatelessWidget {
  final List<String> timetableData;

  const ArrivalInfo({
    Key? key,
    required this.timetableData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nearestArrivalTime = findNearestArrivalTime(timetableData);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Arriving in',
          style: TextStyle(
            color: Color(0xFF3E3E3E),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          nearestArrivalTime,
          style: const TextStyle(
            color: Color(0xFFC50243),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

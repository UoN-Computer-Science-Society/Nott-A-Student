import 'package:Nott_A_Student/src/features/bus/data/data%20source/retrieveTimetable.dart';
import 'package:flutter/material.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/busDepartureCardDetails.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/bus_homepage/busDepartureCard/headerbusDeparturing.dart';

class BusDepartureCard extends StatelessWidget {
  const BusDepartureCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: getDepartingSoonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // or any other loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Map<String, String>> departingSoonData =
              snapshot.data ?? [];
          if (departingSoonData.isEmpty) {
            return const Text('No departing soon data available');
          } else {
            final validDepartingSoonData = departingSoonData
                .where((data) =>
                    data['time'] != "Last bus has gone" &&
                    data['time'] != "No bus today")
                .toList();

            if (validDepartingSoonData.isEmpty) {
              return const Text('No buses available at the moment');
            } else {
              // Sort the validDepartingSoonData list by time
              validDepartingSoonData.sort((a, b) {
                final timeA = _parseTime(a['time']!);
                final timeB = _parseTime(b['time']!);

                return timeA.compareTo(timeB);
              });

              return Container(
                padding: const EdgeInsets.all(10.0),
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: validDepartingSoonData.map((data) {
                    return BusDepartureCardDetails(
                      time: data['time'] ?? '',
                      route: data['route'] ?? '',
                    );
                  }).toList(),
                ),
              );
            }
          }
        }
      },
    );
  }

  // Function to parse time string into a comparable format
  DateTime _parseTime(String time) {
    final parts = time.split(' ');
    final timeParts = parts[0].split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    
     //handle the case that the time is pm but exclude the 12 
    if (parts[1].toLowerCase() == 'pm' && hour != 12) {
      hour += 12;
    }
    //handle the case that the time is 12am
    if (parts[1].toLowerCase() == 'am' && hour == 12) {
      hour = 0;
    }
    return DateTime(0, 1, 1, hour, minute);
  }
}

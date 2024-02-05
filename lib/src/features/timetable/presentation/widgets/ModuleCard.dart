import 'package:flutter/material.dart';
import 'dart:core';
import 'package:Nott_A_Student/src/features/timetable/presentation/views/RedLine.dart';

// ignore: must_be_immutable
class ModuleCard extends StatelessWidget {
  final String courseCode;
  final String moduleConvener;
  final String timeStart;
  final String timeEnd;
  final String time;
  final String module;
  final String room;
  final String day;
  final bool isExpanded;

  ModuleCard({
    super.key,
    required this.courseCode,
    required this.moduleConvener,
    required this.timeStart,
    required this.timeEnd,
    required this.time,
    required this.module,
    required this.room,
    required this.day,
    required this.isExpanded,
  });

  late String courseTitle;
  late String lecturer;
  late String roomName;

  @override
  Widget build(BuildContext context) {
    DateTime? parseTimeString(String timeString) {
      try {
        // Assuming timeString is in the format "HH:mm"
        List<String> parts = timeString.split(":");
        if (parts.length == 2) {
          int hours = int.parse(parts[0]);
          int minutes = int.parse(parts[1]);

          // Create a DateTime object with today's date and the specified time
          return DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, hours, minutes);
        }
      } catch (e) {
        print("Error parsing time string: $e");
      }

      return null;
    }

    DateTime? start = parseTimeString(timeStart);
    DateTime? end = parseTimeString(timeEnd);

    int timeDiff = end!.difference(start!).inHours;
    double cardHeight = timeDiff <= 1 ? 50.0 : 100.0;

    courseTitle =
        '${courseCode.split('/')[0]}${courseCode.split('/')[1]} $module';

    roomName = "empty";
    if (room.contains("BB") || room.contains("DA")) {
      RegExp regExp = RegExp(
          r'(?<=-)([A-Z]{2}\d{2})(?=-)'); // Matches the pattern '-<two capital letters><two digits>-'
      Match? match = regExp.firstMatch(room);

      if (match != null) {
        String extractedText = match.group(1)!;
        roomName = extractedText;
      }
    } else {
      RegExp regExp =
          RegExp(r'(?<=-)([A-Z]\d[A-Z]\d{2})(?=\+)'); // Updated pattern
      Match? match = regExp.firstMatch(room);

      if (match != null) {
        String extractedText = match.group(1)!;
        roomName = extractedText;
      }
    }

    return Stack(children: [
      Column(
        children: [
          //added
          Row(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 0, top: 10),
                child: Text(
                  timeStart,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isExpanded
                        ? Colors.black.withOpacity(0.3)
                        : Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: isExpanded
                    ? Colors.grey[400]?.withOpacity(0.3)
                    : Colors.grey[400], // Adjust the color as needed
                margin: const EdgeInsets.only(left: 10, right: 20, top: 7),
              ),
            ),
          ]),
          Card(
            margin: const EdgeInsets.only(left: 10, top: 10),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isExpanded
                        ? const Color(0xFF3B7DB0)
                            .withOpacity(0.3) // Adjust the opacity as needed
                        : const Color(0xFF3B7DB0),
                  ),
                  width: 350,
                  // height: cardHeight,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 5),
                                  child: Text(
                                    time,
                                    style: const TextStyle(
                                      // fontSize: timeDiff <= 1 ? 8 : 16,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text(
                                    roomName,
                                    style: const TextStyle(
                                      // fontSize: timeDiff <= 1 ? 8 : 16,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 5, right: 10, bottom: 5),
                        child: Text(
                          courseTitle,
                          style: const TextStyle(
                              // fontSize: timeDiff <= 1 ? 8 : 16,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          maxLines: 1, // Limiting to 1 line
                          overflow:
                              TextOverflow.fade, // Truncating overflowing text
                          softWrap: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          moduleConvener,
                          style: const TextStyle(
                            // fontSize: timeDiff <= 1 ? 8 : 16,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Align widget for displaying timeStart
        ],
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'dart:core';

// ignore: must_be_immutable
class ModuleCard extends StatelessWidget {
  final String courseCode;
  final String moduleConvener;
  final String time;
  final String module;
  final String room;
  final String day;

  ModuleCard({
    super.key,
    required this.courseCode,
    required this.moduleConvener,
    required this.time,
    required this.module,
    required this.room,
    required this.day,
  });

  late String courseTitle;
  late String lecturer;
  late String roomName;

  @override
  Widget build(BuildContext context) {
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

    return Card(
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
              color: const Color(0xFF3B7DB0),
            ),
            width: 360,
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
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: Text(
                              time,
                              style: const TextStyle(
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
                            padding: EdgeInsets.only(right: 15),
                            child: Text(
                              roomName,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5, right: 10),
                  child: Text(
                    courseTitle,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    maxLines: 1, // Limiting to 1 line
                    overflow: TextOverflow.fade, // Truncating overflowing text
                    softWrap: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    moduleConvener,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

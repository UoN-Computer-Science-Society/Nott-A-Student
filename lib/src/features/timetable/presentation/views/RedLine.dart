import 'package:flutter/material.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/views/RedLine_view.dart';

class RedLine extends StatefulWidget {
  // const RedLine({super.key});
  // final List<String> cardTimeSlots;

  // const RedLine({Key? key, required this.cardTimeSlots}) : super(key: key);

  final double linePosition;

  const RedLine({Key? key, required this.linePosition}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RedLineState();
}

class _RedLineState extends State<RedLine> {
  // final List<String> cardTimeSlots;
  // // double top = 0;
  // _RedLineState({required this.cardTimeSlots});

  double top = 0;
  final double left = 10;
  final double height = 100;

  // double calculateTop() {
  //   DateTime now = DateTime.now();

  //   for (String timeSlot in cardTimeSlots) {
  //     List<String> parts = timeSlot.split('-');
  //     if (parts.length == 2) {
  //       DateTime startTime = parseTimeString(parts[0]);
  //       DateTime endTime = parseTimeString(parts[1]);

  //       if (now.isAfter(startTime) && now.isBefore(endTime)) {
  //         double minutesPerSlot =
  //             30; // Assuming each time slot represents 30 minutes
  //         double top = (now.hour * 60 + now.minute) / minutesPerSlot * 100;
  //         return top;
  //       }
  //     }
  //   }

  //   return 0;
  // }

  // DateTime parseTimeString(String timeString) {
  //   List<String> parts = timeString.split(":");
  //   if (parts.length == 2) {
  //     int hours = int.parse(parts[0]);
  //     int minutes = int.parse(parts[1]);
  //     return DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day, hours, minutes);
  //   }
  //   throw FormatException("Invalid time string format");
  // }

  @override
  Widget build(BuildContext context) {
    // Example time slots for a card
    // List<String> cardTimeSlots = ["9:00-11:00", "12:00-13:00", "16:00-18:00"];

    return Stack(
      children: [
        Expanded(
          child: RedLine_view(
            top: widget.linePosition,
            left: left,
            height: 2.0,
            width: 100.0,
          ),
        )
      ],
    );
  }
}

import 'package:Nott_A_Student/src/presentation/widget/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/widgets/timetable_card.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  DateTime _focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Nott-A-TimeTable",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Nimbus",
              ),
            ),
          ),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010, 10, 23),
            lastDay: DateTime.utc(2040, 10, 23),
            calendarFormat: calendarFormat,
            onFormatChanged: (CalendarFormat format) {
              setState(() {
                calendarFormat = format;
              });
            },
          ),
          const NewsCard()
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

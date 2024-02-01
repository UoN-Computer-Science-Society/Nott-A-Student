// dayView.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/bloc/timetable/ModuleRequestBloc.dart'; // Import your ModuleRequestBloc
import 'package:Nott_A_Student/src/features/timetable/domain/models/Activity.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/widgets/ModuleCard.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-bar.dart';
import 'package:table_calendar/table_calendar.dart';

class dayView extends StatefulWidget {
  const dayView({super.key});

  @override
  State<dayView> createState() => _dayViewState();
}

class _dayViewState extends State<dayView> {
  final ModuleRequestBloc bloc = ModuleRequestBloc();
  String currentDay = DateFormat('EEEE').format(DateTime.now());
  DateTime selectedDay = DateTime.now();
  String selectedDayString = "";
  void _OnDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
      selectedDayString = DateFormat('EEEE').format(selectedDay);
    });
  }




  bool _isWeekend(DateTime day) {
    return day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
  }

  List<Activity> timetableData = [];

  @override
  void initState() {
    super.initState();
    fetchTimetableData();
  }

  Future<void> fetchTimetableData() async {
    final data = await bloc.fetchTimetableData();
    setState(() {
      timetableData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nott-A-Timetable",
          style: TextStyle(
            color: Color(0xFF3B7DB0),
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  selectedDayString,
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                )),
            TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2050, 1, 1),
              calendarFormat: CalendarFormat.week,
              selectedDayPredicate: (day) => isSameDay(day, selectedDay),
              onDaySelected: _OnDaySelected,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: timetableData.length,
                    itemBuilder: (context, index) {
                      Activity act = timetableData[index];
                      if (act.day == selectedDayString) {
                        return ModuleCard(
                          courseCode: act.activity ?? 'N/A',
                          moduleConvener: act.staff ?? 'N/A',
                          module: act.module ?? 'N/A',
                          time: '${act.start} - ${act.end}',
                          room: act.room ?? 'N/A',
                          day: act.day ?? 'N/A',
                        );
                        } else {
                          return Container();
                        }
                      }
                )
                    )]
                    )
      ),
      bottomNavigationBar: const BottomNavBar()
    );
  }
}
// dayView.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/bloc/timetable/ModuleRequestBloc.dart'; // Import your ModuleRequestBloc
import 'package:Nott_A_Student/src/features/timetable/domain/models/Activity.dart';
// import 'package:Nott_A_Student/src/features/timetable/presentation/views/RedLine.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/widgets/ModuleCard.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/views/ShowEvents.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/views/NewTasks.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/views/Filter.dart';

class DayView extends StatefulWidget {
  const DayView({super.key});

  @override
  State<DayView> createState() => _dayViewState();
}

class _dayViewState extends State<DayView> {
  bool isExpanded = false;
  bool isAddTaskExpanded = false; //not clicked
  bool isFilterExpanded = false; //not clicked
  bool isEventExpanded = false; //not clicked

  final ModuleRequestBloc bloc = ModuleRequestBloc();
  // String currentDay = DateFormat('EEEE').format(DateTime.now());
  String currentDate = DateFormat('EEEE, d MMMM y').format(DateTime.now());
  String currentDay = DateFormat('EEEE').format(DateTime.now());
  DateTime selectedDay = DateTime.now();
  String selectedDayString = "";
  String selectedDateString = "";
  // ignore: non_constant_identifier_names
  void _OnDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
      String selectedDateString = DateFormat('EEEE, d MMMM y').format(day);
      if (selectedDateString == currentDate) {
        selectedDayString = "Today";
      } else {
        selectedDayString = DateFormat('EEEE').format(selectedDay);
      }
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

  List<String> getCardTimeSlots(Activity act) {
    List<String> timeSlots = [];
    if (act.start != null && act.end != null) {
      timeSlots.add('${act.start}-${act.end}');
    }
    return timeSlots;
  }

  double calculateLinePosition() {
    DateTime now = DateTime.now();
    int totalMinutes = now.hour * 60 + now.minute;
    double totalMinutesInDay =
        9 * 60; // Assuming time slots are from 9 AM to 6 PM

    // Calculate the position as a percentage of the total height
    double positionPercentage = totalMinutes / totalMinutesInDay;

    // // Calculate the actual position based on the screen height
    // double screenHeight = MediaQuery.of(context).size.height;
    // double linePosition = screenHeight * positionPercentage;

    // return linePosition;
    // Calculate the actual position based on the screen height
    double screenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.height -
            (timetableData.length * 100 + (10 * timetableData.length)));

    double linePosition = screenHeight * positionPercentage;

    return linePosition;
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
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  selectedDayString,
                  // selectedDateString,
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2050, 1, 1),
                calendarFormat: CalendarFormat.week,
                headerStyle: HeaderStyle(
                    titleTextFormatter: (date, locale) =>
                        DateFormat('EEEE, d MMMM y', locale)
                            .format(selectedDay),
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    formatButtonVisible: false,
                    titleTextStyle: const TextStyle(
                      color: Color(0xFF3B7DB0),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    )),
                selectedDayPredicate: (day) => isSameDay(day, selectedDay),
                onDaySelected: _OnDaySelected,
                daysOfWeekStyle: DaysOfWeekStyle(
                  dowTextFormatter: (date, locale) =>
                      DateFormat.E(locale).format(date).substring(0, 1),
                  weekdayStyle: const TextStyle(fontWeight: FontWeight.bold),
                  weekendStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: Builder(builder: (BuildContext context) {
                return Stack(
                  children: [
                    // Wrap the RedLine widget with Builder
                    // Builder(
                    //   builder: (BuildContext context) {
                    //     return RedLine(linePosition: calculateLinePosition());
                    //   },
                    // ),
                    // RedLine(linePosition: calculateLinePosition()),
                    // RedLine(linePosition: calculateLinePosition()),
                    ListView.builder(
                      itemCount: timetableData.length,
                      itemBuilder: (context, index) {
                        Activity act = timetableData[index];
                        if (act.day == selectedDayString) {
                          return ModuleCard(
                            courseCode: act.activity ?? 'N/A',
                            moduleConvener: act.staff ?? 'N/A',
                            module: act.module ?? 'N/A',
                            timeStart: act.start ?? 'N/A',
                            timeEnd: act.end ?? 'N/A',
                            time: '${act.start} - ${act.end}',
                            room: act.room ?? 'N/A',
                            day: act.day ?? 'N/A',
                            isExpanded: isExpanded,
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            color: const Color.fromARGB(246, 202, 230, 255),
                            child: IconButton(
                              icon: Icon(
                                isExpanded ? Icons.close : Icons.add,
                                size: 30.0,
                              ),
                              color: const Color.fromARGB(255, 59, 125, 176),
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Positioned widget to place the FilterButton above Icons.add container
                    // Conditionally include the Positioned widget
                    if (isExpanded)
                      const Positioned(
                        // Adjust the values as needed
                        bottom: 60.0,
                        right: 0.0,
                        child: ShowEvents(),
                      ),
                    if (isExpanded)
                      const Positioned(
                        // Adjust the values as needed
                        bottom: 120.0,
                        right: 0.0,
                        child: NewTasks(),
                      ),
                    if (isExpanded)
                      const Positioned(
                        // Adjust the values as needed
                        bottom: 180.0,
                        right: 0.0,
                        child: Filter(),
                      ),
                  ],
                );
              })),
            ])),
        bottomNavigationBar: const BottomNavBar());
  }
}

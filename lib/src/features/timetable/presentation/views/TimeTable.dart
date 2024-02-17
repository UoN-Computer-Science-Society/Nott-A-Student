import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/bloc/timetable/timetable_bloc.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/widgets/timetable_card.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-bar.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/date_symbol_data_local.dart';

// import 'package:nott_a_student/src/features/timetable/presentation/bloc/news/appWrite.dart'; //insert appwrite function
import 'package:appwrite/appwrite.dart'; // Add this import statement

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  final DateTime _selectedDay = DateTime.now();
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nott-A-Timetable",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Nimbus",
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                "Today",
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          CalendarWeek(
            controller: CalendarWeekController(),
            height: 110,
            showMonth: true,
            minDate: DateTime.now().add(
              const Duration(days: -365),
            ),
            maxDate: DateTime.now().add(
              const Duration(days: 365),
            ),
            onDatePressed: (DateTime datetime) {
              // Do something
            },
            onDateLongPressed: (DateTime datetime) {
              // Do something
            },
            onWeekChanged: () {
              // Do something
            },
            monthViewBuilder: (DateTime time) => Align(
              alignment: FractionalOffset.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                child: Text(
                  DateFormat('EEEE, d MMMM y').format(_selectedDay),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xFF3F3F3F),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            dayOfWeekStyle: const TextStyle(
              color: Color(0xFF3F3F3F),
            ),
            dateStyle: const TextStyle(
              color: Color(0xFF3F3F3F),
            ),
            weekendsStyle: const TextStyle(color: Color(0xFF3F3F3F)),
            decorations: [
              DecorationItem(
                decorationAlignment: FractionalOffset.bottomRight,
                date: DateTime.now(),
                decoration: const Icon(
                  Icons.today,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          // const NewsCard(
          //   //make it not built in, take from timetable then, display and read the time and end time, and then make space for event you want to accomplish
          //   time: "9:00",
          //   endTime: "11:00",
          //   room: "F3A08",
          //   course: "COMP1023 Software Engineering",
          //   description: "Lecture - Dr Radu Muschevici",
          // ),
          // const NewsCard(
          //   time: "11:00",
          //   endTime: "13:00",
          //   room: "F3A08",
          //   course: "COMP1023 Software Engineering",
          //   description: "Lecture - Dr Radu Muschevici",
          // ),
          // const NewsCard(
          //   time: "15:00",
          //   endTime: "17:00",
          //   room: "F3A08",
          //   course: "COMP1023 Software Engineering",
          //   description: "Lecture - Dr Radu Muschevici",
          // ),
          // Fetch timetable data and display cards
          
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        color: const Color.fromARGB(246, 202, 230, 255),
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
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
                    // Conditionally include the Positioned widget
                    if (isExpanded)
                      const Positioned(
                        top: 20,
                        // Add the content of the Positioned widget here
                        child: YourExpandedWidget(),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class YourExpandedWidget extends StatelessWidget {
  const YourExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Your expanded widget content goes here
    return Container(
      color: Colors.red,
      width: 100,
      height: 100,
      child: const Text('Expanded Content'),
    );
  }
}

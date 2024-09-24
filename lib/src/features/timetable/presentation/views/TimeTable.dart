import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/widget/inputLabel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/widgets/timetable_card.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-bar.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}


class _TimeTableState extends State<TimeTable> {
  final DateTime _focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;


  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("ur mum"),
      // ),R
      body:
        Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text("Nott-A-TimeTable",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Nimbus",
                ),
              ),
            ),
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2010,10,23),
              lastDay: DateTime.utc(2040,10,23),
              calendarFormat: calendarFormat,
              onFormatChanged: (CalendarFormat format) {
                setState(() {
                  calendarFormat = format;
                });
              },
            
              // locale: 'en_US',
              
              
              // formatAnimationCurve: Curves.fastLinearToSlowEaseIn,
              // availableCalendarFormats: { CalendarFormat.month: 'Month', CalendarFormat.week: 'Week',},
              // calendarStyle: const CalendarStyle(
              //   defaultTextStyle: TextStyle(
              //     fontSize: 20,
              //   ),

              // ),
              // headerVisible: true,
              // daysOfWeekStyle: const DaysOfWeekStyle(
              // weekdayStyle: TextStyle(color: Colors.blueAccent),
              // weekendStyle: TextStyle(color: Colors.redAccent),
              // ),
              // headerStyle: HeaderStyle(
              //   leftChevronVisible: false,
              //   rightChevronVisible: false,
              //   decoration: BoxDecoration(color: Colors.red[100]),
              //   titleTextStyle: const TextStyle(fontSize: 50),
              //   headerPadding: const EdgeInsets.all(50),
              //   formatButtonShowsNext: true
              // ),
            //   calendarBuilders: CalendarBuilders(
            //     selectedBuilder: (context, date, _){
            //       return Container( //when click on day it turns blue
            //         decoration: new BoxDecoration(
            //         color: Colors.white,
            //         shape: BoxShape.rectangle,
            //         borderRadius: const BorderRadius.all(Radius.circular(8)),
            //       ),
            //         margin: const EdgeInsets.all(4),
            //         width: 100,
            //         height: 100,
            //         child:
            //         Center(
            //           child: Text(
            //             '${date.day}',
            //             style: const TextStyle(
            //               fontSize: 20,
            //               color:Colors.blueAccent,
            //             )
            //           ),
            //         )
            //     );
            //   }
            // ),
            // selectedDayPredicate: (day) {
            //   // Use `selectedDayPredicate` to determine which day is currently selected.
            //   // If this returns true, then `day` will be marked as selected.

            //   // Using `isSameDay` is recommended to disregard
            //   // the time-part of compared DateTime objects.
            //   return isSameDay(_selectedDay, day);
            // },
            // onDaySelected: (selectedDay, focusedDay) {
            //   if (!isSameDay(_selectedDay, selectedDay)) {
            //     // Call `setState()` when updating the selected day
            //     setState(() {
            //       _selectedDay = selectedDay;
            //       _focusedDay = focusedDay;
            //     });
            //   }
            // },
            // onPageChanged: (focusedDay) {
            //   // No need to call `setState()` here
            //   focusedDay = focusedDay;
            //   },
            ),
            
            const NewsCard()
          ],
          
        ),
        bottomNavigationBar: const BottomNavBar(),
    );
  }
}

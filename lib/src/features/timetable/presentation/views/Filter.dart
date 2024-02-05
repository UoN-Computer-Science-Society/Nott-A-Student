// // dayView.dart
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:nott_a_student/src/features/timetable/presentation/bloc/news/ModuleRequestBloc.dart'; // Import your ModuleRequestBloc
// import 'package:nott_a_student/src/features/timetable/domain/models/Activity.dart';
// import 'package:nott_a_student/src/features/timetable/presentation/widgets/ModuleCard.dart';
// import 'package:nott_a_student/src/presentation/widget/nav-bar.dart';
// import 'package:table_calendar/table_calendar.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Positioned(
          bottom: 80.0, // Adjust the value to position the FilterButton
          right: 5.0,
          child: Text(
            'Filter',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 15.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              height: 50.0,
              width: 50.0,
              color: const Color.fromARGB(255, 59, 125, 176),
              child: IconButton(
                icon: const Icon(
                  Icons.filter_list_rounded,
                  size: 30.0,
                ),
                color: const Color.fromARGB(246, 202, 230, 255),
                onPressed: () {
                  // Handle onPressed logic here
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

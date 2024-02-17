// // dayView.dart
import 'package:Nott_A_Student/src/features/timetable/presentation/views/FilterContainer.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:nott_a_student/src/features/timetable/presentation/bloc/news/ModuleRequestBloc.dart'; // Import your ModuleRequestBloc
// import 'package:nott_a_student/src/features/timetable/domain/models/Activity.dart';
// import 'package:nott_a_student/src/features/timetable/presentation/widgets/ModuleCard.dart';
// import 'package:nott_a_student/src/presentation/widget/nav-bar.dart';
// import 'package:table_calendar/table_calendar.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Filter',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 15.0,
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(23.0),
                                    child: FilterContainer()),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

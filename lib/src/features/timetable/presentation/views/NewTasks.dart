// // dayView.dart
import 'package:Nott_A_Student/src/features/timetable/presentation/views/addTaskContainer.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:nott_a_student/src/features/timetable/presentation/bloc/news/ModuleRequestBloc.dart'; // Import your ModuleRequestBloc
// import 'package:nott_a_student/src/features/timetable/domain/models/Activity.dart';
// import 'package:nott_a_student/src/features/timetable/presentation/widgets/ModuleCard.dart';
// import 'package:nott_a_student/src/presentation/widget/nav-bar.dart';
// import 'package:table_calendar/table_calendar.dart';

class NewTasks extends StatelessWidget {
  const NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'New Task',
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
                      Icons.task_outlined,
                      size: 30.0,
                    ),
                    color: const Color.fromARGB(246, 202, 230, 255),
                    onPressed: () {
                      // Handle onPressed logic here
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        isDismissible: true,
                        isScrollControlled: true,
                        // enableDrag: true,
                        context: context,
                        builder: (BuildContext context) {
                          return GestureDetector(
                            // Handle dragging manually
                            onVerticalDragStart: (details) {
                              Navigator.of(context).pop();
                            },
                            child: Material(
                              child: AddTaskForm(),
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

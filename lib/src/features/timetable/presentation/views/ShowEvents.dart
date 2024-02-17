// // dayView.dart
import 'package:flutter/material.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/views/NewTasks.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/views/addTaskContainer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ShowEvents extends StatelessWidget {
  const ShowEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Show Events',
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
                      Icons.calendar_month_outlined,
                      size: 30.0,
                    ),
                    color: const Color.fromARGB(246, 202, 230, 255),
                    onPressed: () {
                      // Handle onPressed logic here

                      // AddTaskForm();
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

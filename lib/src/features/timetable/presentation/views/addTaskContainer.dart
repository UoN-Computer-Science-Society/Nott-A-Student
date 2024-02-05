//white container pops up when add task is pressed

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/widget/inputLabel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddTaskForm extends StatelessWidget {
  const AddTaskForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    return SingleChildScrollView(
        child: Stack(children: [
      Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 5),
          child: Center(
              child: Container(
                  height: 5,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(10),
                  )))),
      Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "New Task",
              style: TextStyle(
                color: Color(0xFF3B7DB0),
                fontFamily: 'Poppins',
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(20),
            Text(
              "Task Name",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
            Gap(10),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                labelStyle: TextStyle(
                  // backgroundColor: Colors.grey[200],
                  fontFamily: 'Poppins',
                  fontSize: 20.0, // Adjust the font size as needed
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Add circular border radius
                  borderSide: BorderSide.none, // Remove the border
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0, // Adjust the vertical padding as needed
                  horizontal: 12.0, // Adjust the horizontal padding as needed
                ),
              ),
            ),
            Gap(20),
            Text(
              "Task Details",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
            Gap(10),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                labelStyle: TextStyle(
                  // backgroundColor: Colors.grey[200],
                  fontFamily: 'Poppins',
                  fontSize: 20.0, // Adjust the font size as needed
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Add circular border radius
                  borderSide: BorderSide.none, // Remove the border
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0, // Adjust the vertical padding as needed
                  horizontal: 12.0, // Adjust the horizontal padding as needed
                ),
              ),
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Time",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(10),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "End Time",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(10),
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(20),
            Text(
              "Category",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
            Gap(10),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                labelStyle: TextStyle(
                  // backgroundColor: Colors.grey[200],
                  fontFamily: 'Poppins',
                  fontSize: 20.0, // Adjust the font size as needed
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Add circular border radius
                  borderSide: BorderSide.none, // Remove the border
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 30.0, // Adjust the vertical padding as needed
                  horizontal: 12.0, // Adjust the horizontal padding as needed
                ),
              ),
            ),
            Gap(20),
            Row(
              children: [
                //colour choice when press
                Column(
                  children: [
                    Text(
                      "Colour",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Gap(10),
                    GestureDetector(
                      onTap: () {
                        // Handle color selection logic here
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            Colors.blue[200], // You can set the default color
                        radius: 15.0, // Adjust the size as needed
                      ),
                    ),
                  ],
                ),

                //some empty label space
              ],
            ),
            Gap(20),
            Text(
              "Alert",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500),
            ),
            Gap(10),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                labelStyle: TextStyle(
                  // backgroundColor: Colors.grey[200],
                  fontFamily: 'Poppins',
                  fontSize: 20.0, // Adjust the font size as needed
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Add circular border radius
                  borderSide: BorderSide.none, // Remove the border
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0, // Adjust the vertical padding as needed
                  horizontal: 12.0, // Adjust the horizontal padding as needed
                ),
              ),
            ),
            Gap(20),
          ]))
    ]));
  }
}

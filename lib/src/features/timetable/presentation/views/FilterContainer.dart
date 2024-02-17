//filter view container
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilterContainer extends StatefulWidget {
  FilterContainer({Key? key}) : super(key: key);

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  String selectedCategory = 'None';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter',
          style: TextStyle(
            color: Color(0xFF3B7DB0),
            fontFamily: 'Poppins',
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        // ),

        Gap(10),

        // Category

        Text(
          "Category",
          style: TextStyle(
              color: Colors.grey[500],
              fontFamily: 'Poppins',
              fontSize: 18.0,
              fontWeight: FontWeight.w500),
        ),

        Gap(5),

        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 13.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey[200],
            ),
            child: DropdownButton<String>(
              value: selectedCategory,
              icon: SizedBox.shrink(),
              underline: SizedBox.shrink(),
              // backgroundColor: Colors.white,
              // backgroundRadius: BorderRadius.circular(15.0),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: [
                'None',
                'Lecture',
                'Lab',
                'Tutorial',
                'Personal Event',
                'Others', //module/specific lecturers/lecture room
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )),

        //Details
        Gap(10),

        Text(
          "Details",
          style: TextStyle(
              color: Colors.grey[500],
              fontFamily: 'Poppins',
              fontSize: 18.0,
              fontWeight: FontWeight.w500),
        ),

        Gap(5),

        TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.grey[200],
            filled: true,
            labelStyle: TextStyle(
              // backgroundColor: Colors.grey[200],
              fontFamily: 'Poppins',
              fontSize: 18.0, // Adjust the font size as needed
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

        //Submit
        Gap(15),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add onPressed logic here
              },
              child: Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
                size: 20.0,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3B7DB0),
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 12.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

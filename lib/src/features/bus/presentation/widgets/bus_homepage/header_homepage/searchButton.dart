import 'package:flutter/material.dart';

// ignore: camel_case_types
class searchButton extends StatelessWidget {
  const searchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth * 0.1;
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 12), // doesn't fix the size of the screen
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: const Color(0xFF059CC0),
        ),
        onPressed: () {
          // TODO: Add your onPressed code here
          print('Search button pressed');
        },
        child: const Text(
          'Search',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

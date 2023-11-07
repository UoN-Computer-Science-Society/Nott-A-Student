import 'package:flutter/material.dart';

// ignore: camel_case_types
class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      style: TextStyle(color: Colors.white), // Set the text color to white
      decoration: InputDecoration(
        filled: true, // This is important for fillColor to work
        fillColor: Colors.white, // Set the color of the TextField
        prefixIcon:
            Icon(Icons.search_rounded, color: Colors.black), // Icon color
        hintText: 'Search your location',
        hintStyle: TextStyle(
            fontFamily: 'Work Sans', color: Colors.black), // Hint text color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0), // Adjust the radius as needed
          ),
        ),
      ),
    );
  }
}

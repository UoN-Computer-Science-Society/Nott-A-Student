import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search_rounded),
        hintText: 'Search all events ...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0), // Adjust the radius as needed
          ),
        ),
      ),
    );
  }
}

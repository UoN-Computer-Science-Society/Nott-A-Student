import 'package:flutter/material.dart';

class FeaturedNewsCard extends StatelessWidget {
  const FeaturedNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}

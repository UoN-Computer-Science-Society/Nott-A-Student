import 'package:flutter/material.dart';

class busDepartureCardDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFF3E3E3E), width: 2),
      ),
      shadowColor: Color(0x33454745),
      elevation: 10,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '10:45 AM',
              style: TextStyle(
                color: Color(0xFF3E3E3E),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From',
                      style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Campus',
                      style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'To',
                      style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Lotus',
                      style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

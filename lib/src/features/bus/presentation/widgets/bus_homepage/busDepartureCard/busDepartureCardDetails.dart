import 'package:flutter/material.dart';

class BusDepartureCardDetails extends StatefulWidget {
  final String time;
  final String route;
  const BusDepartureCardDetails(
      {super.key,
      required this.time,
      required this.route});

  @override
  State<BusDepartureCardDetails> createState() => _BusDepartureCardDetailsState();
}

class _BusDepartureCardDetailsState extends State<BusDepartureCardDetails> {
    String departure = "";
   String destination= "";

  @override
  void initState() {
    super.initState();
    List<String> parts = widget.route.split(' to ');

    if (parts.length == 2) {
      departure = parts[0];
      destination = parts[1];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFF3E3E3E), width: 2),
      ),
      shadowColor: const Color(0x33454745),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.time,
              style: const TextStyle(
                color: Color(0xFF3E3E3E),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'From',
                      style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      departure,
                      style: const TextStyle(
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
                    const Text(
                      'To',
                      style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      destination,
                      style: const TextStyle(
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

import 'package:flutter/material.dart';

class FavouriteBusCardDetails extends StatelessWidget {
  const FavouriteBusCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 284,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF4252B1),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationInfo(
              title: 'From',
              location: 'Campus',
              icon: const Icon(Icons.star, color: Colors.yellow)),
          SizedBox(height: 20),
          LocationInfo(title: 'To', location: 'Lotus'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BusInfo(busId: 'VCK2020'),
              ArrivalInfo(arrivalTime: '5 mins'),
            ],
          ),
        ],
      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  final String title;
  final String location;
  final Icon? icon; // Optional icon

  const LocationInfo({
    Key? key,
    required this.title,
    required this.location,
    this.icon, // Optional icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF3E3E3E),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                location,
                style: const TextStyle(
                  color: Color(0xFF3E3E3E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (icon != null) icon!, // Only display the icon if it's not null
      ],
    );
  }
}

class BusInfo extends StatelessWidget {
  final String busId;

  const BusInfo({
    Key? key,
    required this.busId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF3E3E3E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        busId,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ArrivalInfo extends StatelessWidget {
  final String arrivalTime;

  const ArrivalInfo({
    Key? key,
    required this.arrivalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'Arriving in',
          style: TextStyle(
            color: Color(0xFF3E3E3E),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          arrivalTime,
          style: const TextStyle(
            color: Color(0xFFC50243),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  final String courseCode;
  final String moduleConvener;
  final String time;
  final String module;
  final String room;
  final String day;

  ModuleCard({
    Key? key,
    required this.courseCode,
    required this.moduleConvener,
    required this.time,
    required this.module,
    required this.room,
    required this.day,
  }) : super(key: key);

  late String courseTitle;
  late String roomName;

  @override
  Widget build(BuildContext context) {
    courseTitle = '${courseCode.split('/')[0]}${courseCode.split('/')[1]} $module';

    roomName = "empty";
    if (room.contains("BB") || room.contains("DA")) {
      RegExp regExp = RegExp(r'(?<=-)([A-Z]{2}\d{2})(?=-)'); 
      Match? match = regExp.firstMatch(room);

      if (match != null) {
        roomName = match.group(1)!;
      }
    } else {
      RegExp regExp = RegExp(r'(?<=-)([A-Z]\d[A-Z]\d{2})(?=\+)'); 
      Match? match = regExp.firstMatch(room);

      if (match != null) {
        roomName = match.group(1)!;
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
       decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                width: 1,
              ),
            ),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            courseTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            "Module Convener: $moduleConvener",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Room: $room",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(
                Icons.room,
                color: Colors.blue,
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}

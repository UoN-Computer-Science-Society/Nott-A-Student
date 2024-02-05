// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// // class NewsCard extends StatelessWidget {
// //   final String time;
// //   final String endTime;
// //   final String room;
// //   final String course;
// //   final String description;

// //   const NewsCard({
// //     Key? key,
// //     required this.time,
// //     required this.endTime,
// //     required this.room,
// //     required this.course,
// //     required this.description,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     DateTime startTime = DateFormat("HH:mm").parse(time);
// //     DateTime endTime = DateFormat("HH:mm").parse(this.endTime);

// //     DateTime now = DateTime.now();
// //     String formattedTime = DateFormat('HH:mm').format(now);
// //     DateTime formattedDateTime = DateFormat('HH:mm').parse(formattedTime);

// // // Calculate the time difference in minutes
// //     int timeDifference =
// //         startTime.difference(formattedDateTime).inMinutes.abs();
// //     int timeDifferenceEnd =
// //         endTime.difference(formattedDateTime).inMinutes.abs();

// // // Check if the event is within 1 hour of the current time
// //     bool isWithinOneHour = timeDifference >= 0 && timeDifference <= 60;
// //     bool isWithinOneHourEnd = timeDifferenceEnd >= 0 && timeDifferenceEnd <= 60;
// //     print('Interpolation Value: $timeDifference');
// //     print('Time: $time');
// //     print('Current Time: $now');

// //     return Card(
// //       elevation: 3,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(10),
// //       ),
// //       color: isWithinOneHour
// //           ? const Color.fromARGB(173, 125, 177, 254)
// //           : isWithinOneHourEnd
// //               ? const Color.fromARGB(173, 125, 177, 254)
// //               : const Color.fromARGB(195, 170, 204, 254),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Expanded(
// //             child: Padding(
// //               padding: const EdgeInsets.only(
// //                   left: 12.0, right: 12.0, top: 2.0, bottom: 5.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Container(
// //                     margin: const EdgeInsets.only(top: 10, bottom: 10),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Text(
// //                           time + " - " + this.endTime,
// //                           style: const TextStyle(
// //                             color: Colors.white, // Text color for time
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                         Text(
// //                           room,
// //                           style: const TextStyle(
// //                             color: Colors.white, // Text color for room
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Text(
// //                     course,
// //                     style: const TextStyle(
// //                       color: Colors.white, // Text color for course
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 8.0),
// //                   Text(
// //                     description,
// //                     style: const TextStyle(
// //                       color: Colors.white, // Text color for description
// //                       fontSize: 16,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:nott_a_student/src/features/timetable/domain/models/Activity.dart';

// class NewsCard extends StatelessWidget {
//   final Activity activity;

//   const NewsCard({
//     Key? key,
//     required this.activity,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   left: 12.0, right: 12.0, top: 2.0, bottom: 5.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(top: 10, bottom: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           activity.start != null
//                               ? "${activity.start} - ${activity.end}"
//                               : "",
//                           style: const TextStyle(
//                             color: Colors.white, // Text color for time
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           activity.room != null ? "${activity.room}" : "",
//                           style: const TextStyle(
//                             color: Colors.white, // Text color for room
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     activity.module != null ? "${activity.module}" : "",
//                     style: const TextStyle(
//                       color: Colors.white, // Text color for course
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8.0),
//                   Text(
//                     activity.activity != null ? "${activity.activity}" : "",
//                     style: const TextStyle(
//                       color: Colors.white, // Text color for description
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

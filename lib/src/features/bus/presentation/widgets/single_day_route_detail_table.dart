import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/route_detail_row.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/single_day_route_detail_row.dart';

class SingleDayRouteDetailTable extends StatefulWidget {
  final Map<String, List<String>> timetableData;
  final String route;

  const SingleDayRouteDetailTable(
      {Key? key, required this.timetableData, required this.route})
      : super(key: key);

  @override
  State<SingleDayRouteDetailTable> createState() => _SingleDayRouteDetailTableState();
}

class _SingleDayRouteDetailTableState extends State<SingleDayRouteDetailTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.route,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                 "Route Details",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const Gap(20),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color(0xFFFBFBFB),
                border: Border.all(
                  color: Colors.black, // Set the border color
                  width: 2.0, // Set the border width
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ), // Set border radius for top-left and top-right corners
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Day", style: Theme.of(context).textTheme.titleMedium,), Text("Time", style: Theme.of(context).textTheme.titleMedium,)],
              ),
            ),
    
            Container(
           decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.black, // Set the left border color
                  width: 2.0, // Set the left border width
                ),
                right: BorderSide(
                  color: Colors.black, // Set the right border color
                  width: 2.0, // Set the right border width
                ),
                bottom: BorderSide(
                  color: Colors.black, // Set the bottom border color
                  width: 2.0, // Set the bottom border width
                ),
              ),
            ),
              padding: const EdgeInsets.all(24),
              child: Column(children: [
                  Column(
                    children: [
                      SingleDayRouteDetailRow(
                          timetableData: widget.timetableData["Monday"]!, day: "Monday"),
                      const Divider(),
                    ],
                  ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/route_detail_row.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/single_day_route_detail_row.dart';

class SingleDayRouteDetailTable extends StatefulWidget {
  final Map<String, List<String>> timetableData;
  final String route;

  const SingleDayRouteDetailTable(
      {Key? key, required this.timetableData, required this.route})
      : super(key: key);

  @override
  State<SingleDayRouteDetailTable> createState() =>
      _SingleDayRouteDetailTableState();
}

class _SingleDayRouteDetailTableState extends State<SingleDayRouteDetailTable> {
  DateTime currentDate = DateTime.now();
  String currentDay = DateFormat('EEEE').format(DateTime.now());

  DateTime currentDateReference = DateTime.now();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFFBFBFB),
              border: Border.all(
                color: Colors.black, // Set the border color
                width: 2.0, // Set the border width
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ), // Set border radius for top-left and top-right corners
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => {decrementDate()},
                ),
                Column(
                  children: [
                    DateFormat('dd/MM/yyyy').format(currentDateReference) ==
                            DateFormat('dd/MM/yyyy').format(currentDate)
                        ? const Text("Today")
                        : Text(DateFormat('EEEE').format(currentDate),
                            style: Theme.of(context).textTheme.bodyMedium),
                    Text(DateFormat('dd/MM/yyyy').format(currentDate),
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () => {incrementDate()},
                ),
              ],
            ),
          ),
          Container(
            height: 300,
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
            child: SingleChildScrollView(
              child: Column(children: [
                SingleDayRouteDetailRow(
                    timetableData: widget.timetableData[currentDay]!,
                    day: currentDay),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void incrementDate() {
    setState(() {
      currentDate = currentDate.add(const Duration(days: 1));
      currentDay = DateFormat('EEEE').format(currentDate);
    });
  }

  void decrementDate() {
    setState(() {
      currentDate = currentDate.subtract(const Duration(days: 1));
      currentDay = DateFormat('EEEE').format(currentDate);
    });
  }
}

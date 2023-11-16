import 'package:flutter/material.dart';

class SingleDayRouteDetailRow extends StatefulWidget {
  final String day;
  final List<String> timetableData;

  const SingleDayRouteDetailRow(
      {Key? key, required this.timetableData, required this.day})
      : super(key: key);

  @override
  State<SingleDayRouteDetailRow> createState() => _SingleDayRouteDetailRowState();
}

class _SingleDayRouteDetailRowState extends State<SingleDayRouteDetailRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.day),
          ],
        ),
        Column(
          children: [
            for (var time in widget.timetableData) Text(time.toString(),style: Theme.of(context).textTheme.titleSmall,)
          ],
        ),
      ],
    );
  }
}

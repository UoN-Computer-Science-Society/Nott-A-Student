import 'package:flutter/material.dart';

class RouteDetailRow extends StatefulWidget {
  final String day;
  final List<String> timetableData;

  const RouteDetailRow(
      {Key? key, required this.timetableData, required this.day})
      : super(key: key);

  @override
  State<RouteDetailRow> createState() => _RouteDetailRowState();
}

class _RouteDetailRowState extends State<RouteDetailRow> {
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

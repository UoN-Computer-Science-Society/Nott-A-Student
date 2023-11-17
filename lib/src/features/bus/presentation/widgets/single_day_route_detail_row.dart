import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SingleDayRouteDetailRow extends StatefulWidget {
  final String day;
  final List<String> timetableData;

  const SingleDayRouteDetailRow(
      {Key? key, required this.timetableData, required this.day})
      : super(key: key);

  @override
  State<SingleDayRouteDetailRow> createState() =>
      _SingleDayRouteDetailRowState();
}

class _SingleDayRouteDetailRowState extends State<SingleDayRouteDetailRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var time in widget.timetableData)
          Column(
            children: [
              const Gap(10),
              Text(
                time.toString(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal),
              ),
              const Gap(10),
              const Divider(),
             
            ],
          ),
      ],
    );
  }
}

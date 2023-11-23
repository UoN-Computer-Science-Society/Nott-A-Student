import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(widget.day, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        Column(
          children: [
            for (var time in widget.timetableData)
              Column(
                children: [
                  Text(
                    time.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.normal),
                  ),
                  const Gap(10),
                ],
              ),

              
          ],
        ),
      ],
    );
  }
}

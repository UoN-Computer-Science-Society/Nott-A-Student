import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:nott_a_student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:nott_a_student/src/features/bus/presentation/views/route_details_page.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/route_detail_row.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/single_day_route_detail_table.dart';

class RouteDetailTable extends StatefulWidget {
  final Map<String, List<String>> timetableData;
  final String route;

  const RouteDetailTable(
      {Key? key, required this.timetableData, required this.route})
      : super(key: key);

  @override
  State<RouteDetailTable> createState() => _RouteDetailTableState();
}

class _RouteDetailTableState extends State<RouteDetailTable> {
  DateTime currentDate = DateTime.now();
  String currentDay = DateFormat('EEEE').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<LocationCubit>().clearAllField();
                      Navigator.of(context).pushNamed("/bus-main");
                    },
                    child: const Text("Back"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              context.read<LocationCubit>().state.route,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RouteDetailsPage(
                                    departure: context
                                        .read<LocationCubit>()
                                        .state
                                        .depature,
                                    destination: context
                                        .read<LocationCubit>()
                                        .state
                                        .destination,
                                    timetableData:
                                        widget.timetableData[currentDay]!,
                                  ),
                                ));
                              },
                              child: Text(
                                "Route Details",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle icon button press
                      },
                      icon: const Icon(Icons.view_column_outlined),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFBFBFB),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Day",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Time",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    right: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.timetableData.keys.length,
                  itemBuilder: (context, index) {
                    var day = widget.timetableData.keys.toList()[index];
                    return Column(
                      children: [
                        RouteDetailRow(
                          timetableData: widget.timetableData[day]!,
                          day: day,
                        ),
                        const Divider(color: Colors.black),
                        const Gap(10),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:nott_a_student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:nott_a_student/src/features/bus/presentation/views/route_details_page.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/route_detail_row.dart';
import 'package:nott_a_student/src/features/bus/presentation/widgets/single_day_route_detail_row.dart';

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
                  icon: const Icon(Icons.grid_view),
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
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => decrementDate(),
                ),
                Column(
                  children: [
                    DateFormat('dd/MM/yyyy').format(currentDateReference) ==
                            DateFormat('dd/MM/yyyy').format(currentDate)
                        ? const Text("Today")
                        : Text(
                            DateFormat('EEEE').format(currentDate),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(currentDate),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () => incrementDate(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
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
              child: SingleDayRouteDetailRow(
                timetableData: widget.timetableData[currentDay]!,
                day: currentDay,
              ),
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

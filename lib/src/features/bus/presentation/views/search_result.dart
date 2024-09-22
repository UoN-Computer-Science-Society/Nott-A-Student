import 'package:flutter/material.dart';
import 'package:Nott_A_Student/src/features/bus/data/data%20source/retrieve_timetable.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/cubit/location_cubit.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/views/route_details_page.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/route_detail_table.dart';
import 'package:Nott_A_Student/src/features/bus/presentation/widgets/single_day_route_detail_table.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  String currentDay = DateFormat('EEEE').format(DateTime.now());
  String viewType = "single";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            context.read<LocationCubit>().selectedDeparture("");
            context.read<LocationCubit>().selectedDestination("");
            context.read<LocationCubit>().onChangedRoute("");

          },
        ),
      ),
      body: FutureBuilder<Map<String, List<String>>>(
        future: getTimeTable(context.read<LocationCubit>().state.route),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.read<LocationCubit>().state.route,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => RouteDetailsPage(
                                      departure: context
                                          .read<LocationCubit>()
                                          .state
                                          .departure,
                                      destination: context
                                          .read<LocationCubit>()
                                          .state
                                          .destination,
                                      timetableData:
                                          snapshot.data![currentDay]!,
                                    ),
                                  ));
                                },
                                child: Text(
                                  "Route Details",
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(decorationThickness: 2, fontWeight: FontWeight.bold,color:  const Color(0xFF059CC0),decoration: TextDecoration.underline,),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                viewType =
                                    viewType == "single" ? "all" : "single";
                              });
                            },
                            icon: viewType == "single"
                                ? const Icon(Icons.grid_view)
                                : const Icon(Icons.view_column_outlined),
                          ),
                        ],
                      ),
                    ),
                    if (viewType == "single")
                      SingleDayRouteDetailTable(
                        timetableData: snapshot.data!,
                        route: context.read<LocationCubit>().state.route,
                      )
                    else
                      RouteDetailTable(
                        timetableData: snapshot.data!,
                        route: context.read<LocationCubit>().state.route,
                      ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

// dayView.dart
import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/bloc/timetable/cubit/school_timetable_cubit.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:Nott_A_Student/src/features/timetable/domain/models/activity.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/widgets/ModuleCard.dart';
import 'package:table_calendar/table_calendar.dart';

class DayView extends StatefulWidget {
  const DayView({super.key});

  @override
  State<DayView> createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  DateTime selectedDay = DateTime.now();
  String selectedDayString = DateFormat('EEEE').format(DateTime.now());

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDay = day;
      selectedDayString = DateFormat('EEEE').format(selectedDay);
    });
  }

  @override
  void initState() {
    super.initState();
    context
        .read<SchoolTimetableCubit>()
        .onChangeSelectedDay(DateFormat('EEEE').format(DateTime.now()));

    context
        .read<SchoolTimetableCubit>()
        .fetchTimetableData(context.read<AuthCubit>().state.program, 'spring')
        .then((value) => {
              context.read<SchoolTimetableCubit>().onChangeTimeTableData(value),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          toolbarHeight: 0,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nott-A-Timetable",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const Gap(5),
              Text(DateFormat('EEEE, d MMMM y').format(DateTime.now()),
                  style: Theme.of(context).textTheme.bodyMedium),
              /*    Text(
                selectedDayString,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal),
              ), */
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2050, 1, 1),
                calendarFormat: CalendarFormat.week,
                selectedDayPredicate: (day) => isSameDay(day, selectedDay),
                onDaySelected: onDaySelected,
              ),
              BlocBuilder<SchoolTimetableCubit, SchoolTimetableState>(
                builder: (context, state) {
                  if (state.timetableData.isEmpty) {
                    return const CircularProgressIndicator();
                  }
                  return Expanded(
                      child: ListView.builder(
                          itemCount: context
                              .read<SchoolTimetableCubit>()
                              .state
                              .timetableData
                              .length,
                          itemBuilder: (context, index) {
                            Activity act = context
                                .read<SchoolTimetableCubit>()
                                .state
                                .timetableData[index];
                            if (act.day == selectedDayString) {
                              return ModuleCard(
                                courseCode: act.activity ?? 'N/A',
                                moduleConvener: act.staff ?? 'N/A',
                                module: act.module ?? 'N/A',
                                time: '${act.start} - ${act.end}',
                                room: act.room ?? 'N/A',
                                day: act.day ?? 'N/A',
                              );
                            } else {
                              return Container();
                            }
                          }));
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar());
  }
}

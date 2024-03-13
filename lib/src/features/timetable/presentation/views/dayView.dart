// dayView.dart
import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/bloc/timetable/cubit/school_timetable_cubit.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/bloc/timetable/ModuleRequestBloc.dart'; // Import your ModuleRequestBloc
import 'package:Nott_A_Student/src/features/timetable/domain/models/Activity.dart';
import 'package:Nott_A_Student/src/features/timetable/presentation/widgets/ModuleCard.dart';
import 'package:Nott_A_Student/src/presentation/widget/nav-bar.dart';
import 'package:table_calendar/table_calendar.dart';

class dayView extends StatefulWidget {
  const dayView({super.key});

  @override
  State<dayView> createState() => _dayViewState();
}

class _dayViewState extends State<dayView> {
  DateTime selectedDay = DateTime.now();
  String selectedDayString = DateFormat('EEEE').format(DateTime.now());

  void _OnDaySelected(DateTime day, DateTime focusedDay) {
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
          title: const Text(
            "Nott-A-Timetable",
            style: TextStyle(
              color: Color(0xFF3B7DB0),
              fontFamily: 'Poppins',
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              Text(
                selectedDayString,
                style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold),
              ),
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2050, 1, 1),
                calendarFormat: CalendarFormat.week,
                selectedDayPredicate: (day) => isSameDay(day, selectedDay),
                onDaySelected: _OnDaySelected,
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

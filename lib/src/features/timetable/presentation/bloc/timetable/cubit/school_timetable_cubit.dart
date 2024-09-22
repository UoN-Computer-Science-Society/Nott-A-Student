import 'package:Nott_A_Student/src/features/timetable/domain/models/Activity.dart';
import 'package:appwrite/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:appwrite/appwrite.dart';
import 'dart:convert';

import 'package:intl/intl.dart';
part 'school_timetable_state.dart';

class SchoolTimetableCubit extends Cubit<SchoolTimetableState> {
  SchoolTimetableCubit() : super(SchoolTimetableState());

  Future<List<Activity>> fetchTimetableData(
      String coursecode, String semester) async {
    Client client = Client();
    client
            .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
            .setProject('6507b9d722fa8ccd95eb') // Your project ID
        ;
    Functions functions = Functions(client);

    try {
      final execution = await functions.createExecution(
          functionId: '6512b5a466b1baa2a89c',
          path: '/timetable',
          method: ExecutionMethod.gET,
          headers: {
            "CourseCode": coursecode,
            "Day": "1-5",
            "Semester": semester
          });

      print(execution.toMap());
      final List<dynamic> data = json.decode(execution.responseBody);
      return data.map((json) => Activity.fromJson(json)).toList();
    } catch (exception) {
      print(exception.toString());
      throw exception;
    }
  }

  void onChangeSelectedDay(String selectedDay) {
    emit(state.copyWith(selectedDay: selectedDay));
  }

  void onChangeTimeTableData(List<Activity> timetableData){
    emit(state.copyWith(timetableData: timetableData));
  }
}

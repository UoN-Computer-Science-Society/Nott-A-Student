import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_status.dart';

// import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/timetable/domain/models/Activity.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
part 'Module_state.dart';

class ModuleRequestBloc extends Cubit<ModuleState> {
  List<Activity>? _cachedTimetableData;

  ModuleRequestBloc()
      : super(const ModuleState(
          activity: [], // Change to activity
          authStatus: AuthInitial(),
        ));

  Future<List<Activity>> fetchTimetableData(
      String coursecode, String semester) async {
    final cachedData = await _getCachedTimetableData();
    if (cachedData != null) {
      emit(state.copyWith(activity: cachedData)); // Change to activity
      return cachedData;
    }

    // Fetch timetable data manually from remote source
    try {
      final timetableData = await _fetchTimetableManually(coursecode, semester);
      emit(state.copyWith(activity: timetableData)); // Change to activity

      // Cache the fetched timetable data
      await _cacheTimetableData(timetableData);
      return timetableData;
    } catch (e) {
      // Handle error
      print('Error fetching timetable data: $e');
      return [];
    }
    
  }

  Future<void> _cacheTimetableData(List<Activity> timetableData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final encodedData = json
        .encode(timetableData.map((activity) => activity.toJson()).toList());
    await prefs.setString('timetable_data', encodedData);
  }

  Future<List<Activity>?> _getCachedTimetableData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final encodedData = prefs.getString('timetable_data');
    if (encodedData != null) {
      final decodedData = json.decode(encodedData) as List<dynamic>;
      final timetableData =
          decodedData.map((data) => Activity.fromJson(data)).toList();
      return timetableData;
    }
    return null;
  }

  Future<List<Activity>> _fetchTimetableManually(
      String coursecode, String semester) async {
    Client client = Client();
    client.setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
            .setProject('6507b9d722fa8ccd95eb'); // Your project ID


    Functions functions = Functions(client);
    try {
      final execution = await functions.createExecution(
        functionId: '6512b5a466b1baa2a89c',
        path: '/timetable',
        method: 'GET',
        headers: {"CourseCode": coursecode, "Day": "1-5", "Semester": semester},
      );

      final List<dynamic> data = json.decode(execution.responseBody);

      // Cache the fetched data
      _cachedTimetableData =
          data.map((json) => Activity.fromJson(json)).toList();

      return _cachedTimetableData!;
    } catch (exception) {
      print(exception.toString());
      throw exception;
    }
  }
}

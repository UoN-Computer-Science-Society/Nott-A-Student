import 'package:appwrite/appwrite.dart';
import 'package:Nott_A_Student/src/features/timetable/domain/models/Activity.dart';
import 'dart:convert';
// import 'package:flutter/material.dart';

class ModuleRequestBloc {
  Future<List<Activity>> fetchTimetableData() async {
    Client client = Client();
    client
        .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
        .setProject(
            '6507b9d722fa8ccd95eb'); // Your project ID.setSelfSigned(status: true); // For self signed certificates, only use for development

    Functions functions = Functions(client);

    try {
      final execution = await functions.createExecution(
        functionId: '6512b5a466b1baa2a89c',
        path: '/timetable',
        method: 'GET',
        headers: {
          "CourseCode": "UG/M1059/M6UCOMPAI/F/02",
          "Day": "1-5",
          "Semester": "spring"
        },
      );
      print(execution.toMap());

      final List<dynamic> data = json.decode(execution.responseBody);
      return data.map((json) => Activity.fromJson(json)).toList();
    } catch (exception) {
      print(exception.toString());
      throw exception;
    }
  }
}

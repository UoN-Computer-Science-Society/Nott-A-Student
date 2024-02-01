import 'package:appwrite/appwrite.dart';
import 'package:Nott_A_Student/src/features/timetable/domain/models/Activity.dart';
import 'dart:convert';

class ModuleRequestBloc {
  Future<List<Activity>> fetchTimetableData() async {
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
          method: 'GET',
          headers: {
            "CourseCode": "UG/M1059/M6UCOMPAI/F/02",
            "Day": "1-5",
            "Semester": "autumn"
          });

      print(execution.toMap());
      final List<dynamic> data = json.decode(execution.responseBody);
      return data.map((json) => Activity.fromJson(json)).toList();
    } catch (exception) {
      print(exception.toString());
      throw exception;
    }
  }
}

// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:nott_a_student/src/features/timetable/domain/models/Activity.dart';

// class ModuleRequestBloc {
//   final StreamController<Activity> _dataController =
//       StreamController<Activity>();

//   Stream<Activity> get dataStream => _dataController.stream;

//   Future<void> fetchDataFromAppwrite() async {
//     final url = Uri.parse(
//         'https://your-appwrite-api-endpoint-here'); // Replace with your actual Appwrite API URL

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = json.decode(response.body);
//       final data = responseData.map((json) => MyData.fromJson(json)).toList();
//       setState(() {
//         timetableData = data;
//       });
//     } else {
//       // Handle the error or non-200 response here
//       print('Failed to fetch data: ${response.statusCode}');
//     }
//   }

//   // Future<Activity> getDataFromAppwrite() async {
//   //   // Make the HTTP request and process the response
//   //   // Create and return a MyData object

//   //   return
//   // }
// }

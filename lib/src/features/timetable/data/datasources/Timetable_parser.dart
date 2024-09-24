import 'package:appwrite/enums.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  client = Client()
      .setEndpoint("https://cloud.appwrite.io/v1")
      .setProject("6507b9d722fa8ccd95eb");

  final functions = Functions(client);

  try {
    final execution = await functions.createExecution(
      functionId: '6512b5a466b1baa2a89c',
      path: '/timetable',
      method: ExecutionMethod.gET,
      headers:
      {
        "coursecode": "UG/M1059/M6UCOMPAI/F/02",
        "day": "1-5",
        "semester": "autumn",
      }

    );
//This is the function to get through the terminal
//  curl -X GET https://6512b5a4ec2f51eaa2d3.appwrite.global/timetable -H "coursecode: UG/M1059/M6UCOMPAI/F/02" -H "day: 1"  -H "semester: autumn" -H "Content-Type: application/json
    print(execution.toMap());
  } catch (e) {
    print(e.toString());
  }
}

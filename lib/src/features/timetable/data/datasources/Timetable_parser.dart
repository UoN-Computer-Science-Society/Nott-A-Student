import 'package:appwrite/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/config/router/app_router.dart';
import 'package:Nott_A_Student/src/config/themes/app_theme.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_repo.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_status.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/login_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/view/login.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/cubit/news_type_cubit.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/views/dashboard.dart';
import 'package:appwrite/appwrite.dart';
import 'dart:convert';


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

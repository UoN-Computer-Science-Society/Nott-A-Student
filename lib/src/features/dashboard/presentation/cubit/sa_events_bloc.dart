import 'dart:convert';

import 'package:Nott_A_Student/src/features/dashboard/domain/models/news_model.dart';
import 'package:Nott_A_Student/src/features/dashboard/domain/models/sa_events.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';

class SAEventsRequestBloc {
  // Method to retrieve the SA events information from the appwrite scraper
  Future<List<SAEvents>> retrieveSAEvents() async {
    Client client = Client();
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6507b9d722fa8ccd95eb');
    Functions functions = Functions(client);

    try {
      final execution = await functions.createExecution(
          functionId: '65bf9c91008da2a67097', method: ExecutionMethod.gET);

      final List<dynamic> data = json.decode(execution.responseBody);
      return data.map((json) => SAEvents.fromJson(json)).toList();
    } catch (exception) {
      print(exception.toString());
      throw exception;
    }
  }
}

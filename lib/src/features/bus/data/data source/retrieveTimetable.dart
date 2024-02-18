import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

var num;
Future<Map<String, List<String>>> getTimeTable(String route) async {
  int num = getRouteIndex(route);
  var url = Uri.https('whereismybus.nottingham.edu.my',
      '/mobile/www/api/get_schedule_new.php', {'q': num.toString()});
  var response = await http.get(url);
  var data;
  if (response.statusCode == 200) {
    // Remove BOM if present and then parse the JSON data
    var jsonResponse =
        convert.jsonDecode(response.body.replaceAll('\uFEFF', ''))
            as Map<String, dynamic>;
    data = jsonResponse;
    print(data);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  Map<String, List<String>> timetableMap = {};

  for (var entry in data['timetable']) {
    entry.forEach((day, time) {
      var fullDay = getFullDayName(day);

      if (!timetableMap.containsKey(fullDay)) {
        timetableMap[fullDay] = [];
      }
      timetableMap[fullDay]!.add(filterTime(time));
    });
  }
  return timetableMap;
}

String getRouteName(int num) {
  String route;
  switch (num) {
    case 0:
      route = 'KTM to Campus';
      break;
    case 1:
      route = 'Campus to KTM';
      break;
    case 2:
      route = 'Campus to TTS';
      break;
    case 3:
      route = 'TTS to Campus';
      break;
    case 4:
      route = 'Campus to TBS';
      break;
    case 5:
      route = 'TBS to Campus';
      break;
    case 6:
      route = 'Campus to Mosque';
      break;
    case 7:
      route = 'Mosque to Campus';
      break;
    case 8:
      route = 'LOTUS to Campus';
      break;
    case 9:
      route = 'Campus to LOTUS';
      break;
    case 10:
      route = 'KLTC to Campus';
      break;
    case 11:
      route = 'Campus to KLTC';
      break;
    case 12:
      route = 'Campus to IOI City Mall Putrajaya';
      break;
    case 13:
      route = 'IOI City Mall Putrajaya to Campus';
      break;
    default:
      route = "Unknown route";
      break;
  }
  return route;
}

Future<List<Map<String, String>>> getDepartingSoonData() async {
  List<Map<String, String>> list = [];

  for (int num = 0; num <= 13; num++) {
    var url = Uri.https('whereismybus.nottingham.edu.my',
        '/mobile/www/api/get_schedule_new.php', {'q': num.toString()});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body.replaceAll('\uFEFF', ''))
              as Map<String, dynamic>;
      var data = jsonResponse;

      Map<String, List<String>> timetableMap = {};

      for (var entry in data['timetable']) {
        entry.forEach((day, time) {
          var fullDay = getFullDayName(day);

          if (!timetableMap.containsKey(fullDay)) {
            timetableMap[fullDay] = [];
          }
          timetableMap[fullDay]!.add(time);
        });
      }

      String today = DateFormat('EEEE').format(DateTime.now());
      String nearestArrivalTime = findNearestArrivalTime(timetableMap[today]!);

      String routeName = getRouteName(num);

      if (nearestArrivalTime.isNotEmpty) {
        list.add({'route': routeName, 'time': nearestArrivalTime});
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  return list;
}

String findNearestArrivalTime(List<String> arrivalTimes) {
  DateTime currentTime = DateTime.now();
  DateTime nearestBusTime = DateTime(2100);
  bool found = false;

  for (String arrivalTime in arrivalTimes) {
    if (arrivalTime == "No BusM") {
      return "No bus today";
    }

    arrivalTime = filterTime(arrivalTime);

    try {
      DateTime busTime = DateFormat('h.mm a').parse(arrivalTime);
      busTime = DateTime(currentTime.year, currentTime.month, currentTime.day,
          busTime.hour, busTime.minute);
      if (busTime.compareTo(currentTime) >= 0 &&
          busTime.compareTo(nearestBusTime) < 0) {
        nearestBusTime = busTime;
        found = true;
      }
    } catch (e) {
      // Handle invalid time format or other exceptions
      print('Invalid time format: $arrivalTime');
    }
  }
  if (!found) {
    return "Last bus has gone";
  }

  return DateFormat('h:mm a').format(nearestBusTime);
}

String filterTime(String input) {
  // Define a regular expression pattern to match the time part
  RegExp regExp = RegExp(r'\b(\d{1,2}.\d{2})\s*([APM][MN])\s*(\d*)\b');

  // Use firstMatch to find the first occurrence of the pattern in the input string
  Match? match = regExp.firstMatch(input);

  // If a match is found, return the matched time part with a space between time and AM/PM
  if (match != null) {
    String time = match.group(1)!;
    String amPm = match.group(2)!;
    if (amPm == "MN") {
      amPm = "AM";
    }
    return '$time $amPm'; // Concatenate the parts with a space
  } else {
    // If no match is found, return an empty string or handle it as needed
    return '';
  }
}

// Function to convert abbreviated day to full day name
String getFullDayName(String abbreviatedDay) {
  switch (abbreviatedDay) {
    case 'mon':
      return 'Monday';
    case 'tues':
      return 'Tuesday';
    case 'wed':
      return 'Wednesday';
    case 'thurs':
      return 'Thursday';
    case 'fri':
      return 'Friday';
    case 'sat':
      return 'Saturday';
    case 'sun':
      return 'Sunday';
    default:
      return abbreviatedDay;
  }
}

int getRouteIndex(String route) {
  int num = -1;
  switch (route) {
    case 'KTM to Campus':
      num = 0;
      break;
    case 'Campus to KTM':
      num = 1;
      break;
    case 'Campus to TTS':
      num = 2;
      break;
    case 'TTS to Campus':
      num = 3;
      break;
    case 'Campus to TBS':
      num = 4;
      break;
    case 'TBS to Campus':
      num = 5;
      break;
    case 'Campus to Mosque':
      num = 6;
      break;
    case 'Mosque to Campus':
      num = 7;
      break;
    case 'LOTUS to Campus':
      num = 8;
      break;
    case 'Campus to LOTUS':
      num = 9;
      break;
    case 'KLTC to Campus ':
      num = 10;
      break;
    case 'Campus to KLTC':
      num = 11;
      break;
    case 'Campus to IOI City Mall Putrajaya':
      num = 12;
      break;
    case 'IOI City Mall Putrajaya to Campus':
      num = 13;
      break;
    default:
      print("fail");
  }
  return num;
}

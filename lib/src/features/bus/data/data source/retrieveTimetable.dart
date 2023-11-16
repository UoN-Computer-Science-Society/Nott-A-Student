import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<Map<String, List<String>>> getTimeTable(String route) async {
  var num;
  switch (route) {
    case 'KTM to Campus':
      num = 1;
      break;
    default:
  }
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

  for (var entry in data['timetable']) {
    entry.forEach((day, time) {
      var fullDay = getFullDayName(day);
      
      if (!timetableMap.containsKey(fullDay)) {
        timetableMap[fullDay] = [];
      }
      timetableMap[fullDay]!.add(time);
    });
  }
  return timetableMap;
}

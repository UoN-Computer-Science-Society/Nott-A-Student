import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

var num;
Future<Map<String, List<String>>> getTimeTable(String route) async {
  print(route);
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

  print(num);
  print("test");
  var url = Uri.https('whereismybus.nottingham.edu.my',
      '/mobile/www/api/get_schedule_new.php', {'q': num.toString()});
  print("test1");
  var response = await http.get(url);
  print("test2");
  var data;
  if (response.statusCode == 200) {
    // Remove BOM if present and then parse the JSON data
    print("test4");
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

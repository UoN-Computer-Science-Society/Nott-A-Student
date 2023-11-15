import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

//final LocalStorage storage = LocalStorage('storage');
// Obtain shared preferences.
Future<void> saveData(Session jsonObject) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // storage.setItem('id', jsonObject.$id);
  await prefs.setString('id', jsonObject.$id);
}

Future<String> getData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  /* await storage.ready; // Wait for storage to be ready
  String id = storage.getItem('id') ?? ''; */

  String id = prefs.getString('id') ?? '';
  print('getdata:$id');

  return id;
}

void clearLocalSession() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove('id');

  print("session clear");
}

Future<Session> getSession(String sessionId) async {
  // Init SDK
  Client client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('6507b9d722fa8ccd95eb');

  final account = Account(client);
  final response = await account.getSession(
    sessionId: sessionId,
  );

  return response;
}

Future<bool> checkSessionExpired(String sessionId) async {
  try {
    Session session = await getSession(sessionId);
    DateTime now = DateTime.now();
    DateTime sessionExpiredDate = DateTime.parse(session.expire);

    return now.isBefore(sessionExpiredDate);
  } catch (error) {
    // Handle the error here if needed
    print(error);
    return false; // Assuming an error means the session is expired
  }
}

import 'package:appwrite/models.dart';
import 'package:localstorage/localstorage.dart';

final LocalStorage storage = LocalStorage('storage');

void saveData(Session jsonObject) {
  storage.setItem('id', jsonObject.$id);
}

Future<String> getData() async {
  await storage.ready; // Wait for storage to be ready
  String id = storage.getItem('id') ?? '';
  print("getdata:" + id);

  return id;
}

 void clearSession() async {
  await storage.clear();

  print("session clear");
}

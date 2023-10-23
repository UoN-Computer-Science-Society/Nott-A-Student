import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:nott_a_student/src/features/auth/domain/session.dart';

class AuthRepository {
  Future<String> login({
    required String email,
    required String password,
  }) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6507b9d722fa8ccd95eb');
        

    print('attempting login');
    print(email);
    print(password);

    final account = Account(client);
    final session =
        await account.createEmailSession(email: email, password: password);
    saveData(session);
    
    if (session.current) {
        print("Update preferences start");
          // Update user preferences
          var userPrefs = {
            'Year': 'asd',
            'School': 'sdskmlk',
            'Program': 'progemasd',
          };

          Future updatePref = account.updatePrefs(
            prefs: userPrefs,
          );
          updatePref.then((value) {
            Future getPref = account.getPrefs();
            getPref.then((value) {
              var prefs = value as Preferences;
              print(prefs.data);
            });
          }).catchError((error) {
            print(error);
            print('preference error');
          });
      return session.userId;
    } else {
      throw Exception('login failed');
    }
  }
}

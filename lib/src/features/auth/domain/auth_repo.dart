import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_cubit.dart';
import 'package:nott_a_student/src/features/auth/domain/session.dart';

class AuthRepository {
  Future<String> login({
    required String email,
    required String password,
    String? year,
    String? program,
    String? school,
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
      if (year != null && school != null && program != null) {
        print("Update preferences start");

        var userPrefs = {
          'Year': year,
          'School': school,
          'Program': program,
        };

     //   savePrefs(userPrefs);

        // Use async/await for cleaner asynchronous code
        try {
          await account.updatePrefs(prefs: userPrefs);
          var prefs = await account.getPrefs() as Preferences;
          print(prefs.data);
          print("Preferences updated successfully in login function");
        } catch (error) {
          print(error);
          print('Preference update error');
        }
      }
      return session.userId;
    } else {
      throw Exception('Login failed');
    }
  }
}

import 'package:appwrite/appwrite.dart';
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
      return session.userId;
    } else {
      throw Exception('login failed');
    }
  }
}

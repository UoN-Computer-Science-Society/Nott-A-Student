import 'package:flutter/foundation.dart';
import 'package:appwrite/appwrite.dart';

class AuthRepository {
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('6507b9d722fa8ccd95eb');

  Future<String> attemptAutoLogin() async {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('not signed in');
  }

  Future<String> login({
    required String username,
    required String password,
  }) async {
    print('attempting login');
    print(username);
    print(password);

    final account = Account(client);
    final session =
        await account.createEmailSession(email: username, password: password);

    print(session);
    if (session.current) {
      return session.userId;
    } else {
      throw Exception('login failed');
    }

    //   await Future.delayed(Duration(seconds: 3));

    //   if (username == "tinjet" && password == "1234") {
    //     return 'abc';
    //   } else {
    //     return "Failed";
    //   }
    // }
  }
}

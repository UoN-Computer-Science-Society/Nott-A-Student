import 'package:flutter/foundation.dart';

class AuthRepository {
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
    await Future.delayed(Duration(seconds: 3));

    if (username == "tinjet" && password == "1234") {
      return 'abc';
    } else {
      return "Failed";
    }
  }
}

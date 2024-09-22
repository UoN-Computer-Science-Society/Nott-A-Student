import 'package:appwrite/appwrite.dart';
import 'package:Nott_A_Student/src/features/auth/domain/session.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class AuthRepository {
  final dialogKey = GlobalKey();
  var logger = Logger("AuthRepo");

  Future<String> login({
    required String email,
    required String password,
    required BuildContext context,
    String? year,
    String? program,
    String? school,
  }) async {
    final client = Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setEndPointRealtime('https://cloud.appwrite.io/v1')
        .setProject('6507b9d722fa8ccd95eb');

    showLoadingDialogBar(context, "Logging you in");

    var account = Account(client);

    try {
      final session = await account.createEmailPasswordSession(
          email: email, password: password);
      saveData(session);

      if (session.userId.isNotEmpty) {
        if (year != null && school != null && program != null) {
          setUserPref(account, year, school, program);
        }
        Navigator.of(dialogKey.currentContext!).pop();
        return session.userId;
      } else {
        throw Exception("Login failed: Invalid session");
      }
    } catch (error) {
      logger.info(error.toString());
      logger.info("Session empty or login failed");
      Navigator.of(dialogKey.currentContext!).pop();
      throw Exception("Login failed: $error");
    }
  }

  Future<void> setUserPref(Account account, year, school, program) async {
    try {
      await account.updatePrefs(prefs: {
        'Year': year,
        'School': school,
        'Program': program,
      });
      var prefs = await account.getPrefs();
      logger.info(Level.INFO, prefs.data);
      logger.info(
          Level.INFO, "Preferences updated successfully in login function");
    } catch (error) {
      logger.info(Level.SHOUT, "Preferences Update Error: ${error.toString()}");
    }
  }

  Future<void> showLoadingDialogBar(
      BuildContext context, String message) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: SimpleDialog(
          key: dialogKey,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [const CircularProgressIndicator(), Text(message)],
              ),
            )
          ],
        ),
      ),
    );

    await Future.delayed(
        const Duration(milliseconds: 2000)); // Simulate a long-running process
  }
}

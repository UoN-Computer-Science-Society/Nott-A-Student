import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';
import 'package:Nott_A_Student/src/features/auth/domain/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthRepository {
  final dialogKey = GlobalKey();

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

    print('attempting login');
    print(email);
    print(password);

    var account = Account(client);
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
      Navigator.of(dialogKey.currentContext!).pop();
      return session.userId;
    } else {
      throw Exception('Login failed');
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

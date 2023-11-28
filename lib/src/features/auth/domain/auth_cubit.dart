import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_status.dart';
import 'package:Nott_A_Student/src/features/auth/domain/session.dart';
import 'package:logging/logging.dart';
import 'dart:developer';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(const AuthState(
          authStatus: AuthInitial(),
        ));
  // final log = Logger('AuthCubit');

  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('6507b9d722fa8ccd95eb');

  Future<void> attemptAutoLogin() async {
    String id = await getData(); // Await the result of getData

    if (id != '') {
      bool active = await checkSessionExpired(id);
      log("Attempting auto login...");

      if (active) {
        log("User session logged in. User Id: $id");
        log("Auto Login success");
        Account account = Account(client);
        Future result = account.get();

        result.then((response) {
          emit(state.copyWith(
            name: response.name,
            email: response.email,
            year: response.prefs.data['Year'],
            school: response.prefs.data['School'],
            program: response.prefs.data['Program'],
          ));
          emit(state.copyWith(
            authStatus: const AuthAuthorized(),
          ));
        }).catchError((error) {
          emit(state.copyWith(
            authStatus: const AuthUnauthorized(),
          ));
          log(error.response.toString());
        });
      } else {
        // The user is not logged in
        emit(state.copyWith(
          authStatus: const AuthUnauthorized(),
        ));
        log("Auto Login Failed.");
      }
    } else {
      // Show splash screen for just 3 seconds
      // final timer = Timer(const Duration(seconds: 1), () {
      //   emit(state.copyWith(
      //     authStatus: const AuthUnauthorized(),
      //   ));
      // });
      emit(state.copyWith(
        authStatus: const AuthUnauthorized(),
      ));
      log("Auto Login Failed.");
    }
  }

  final logoutDialogKey = GlobalKey();
  void logout(BuildContext ctx) async {
    try {
      showLoadingDialogBar(ctx, "Logging you out");
      var sessionId = await getData();
      final account = Account(client);
      log('Logging out... User Id: $sessionId');
      Future result = account.deleteSession(
        sessionId: sessionId,
      );

      result.then((value) {
        clearLocalSession();
        //   clearUserPrefs();
        Navigator.of(logoutDialogKey.currentContext!).pop();
        emit(state.copyWith(
          session: null,
          authStatus: const AuthUnauthorized(),
        ));
        log('Logout Success');
      });
    } catch (e) {
      log(e.toString());
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
          key: logoutDialogKey,
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

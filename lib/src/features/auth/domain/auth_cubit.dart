import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_status.dart';
import 'package:Nott_A_Student/src/features/auth/domain/session.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(const AuthState(
          authStatus: AuthUnauthorized(),
        ));

  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('6507b9d722fa8ccd95eb');

  Future<void> attemptAutoLogin() async {
    String id = await getData(); // Await the result of getData

    if (id != '') {
      bool active = await checkSessionExpired(id);
      print("Attempting auto login");

      if (active) {
        print(id);
        print("Attempting auto login success");
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
          print(error.response);
        });
      } else {
        // The user is not logged in
        emit(state.copyWith(
          authStatus: const AuthUnauthorized(),
        ));
        print("Attempting auto login fail: ");
      }
    } else {
      print("Attempting auto login fail");
    }
  }

  void logout() async {
    print('attempting logout');

    try {
      var sessionId = await getData();
      final account = Account(client);
      Future result = account.deleteSession(
        sessionId: sessionId,
      );

      result.then((value) {
        clearLocalSession();
        //   clearUserPrefs();

        emit(state.copyWith(
          session: null,
          authStatus: const AuthUnauthorized(),
        ));
        print('attempting logout success');
      });
    } catch (e) {
      print(e.toString());
    }
  }
}

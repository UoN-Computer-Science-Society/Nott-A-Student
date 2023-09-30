import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_status.dart';
import 'package:nott_a_student/src/features/auth/domain/session.dart';
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
        emit(state.copyWith(
          authStatus: const AuthAuthorized(),
        ));
        print(id);
        print("Attempting auto login success");
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

    if (session.current) {
      saveData(session);
      emit(state.copyWith(
        session: session,
        authStatus: const AuthAuthorized(),
      ));
      return session.userId;
    } else {
      throw Exception('login failed');
    }
  }

  void logout() async {
    print('attempting logout');

    try {
      getData();
      final account = Account(client);
      Future result = account.deleteSession(
        sessionId: await getData(),
      );

      clearLocalSession();

      emit(state.copyWith(
        session: null,
        authStatus: const AuthUnauthorized(),
      ));
      print('attempting logout success');
    } catch (e) {
      print(e.toString());
    }
  }

  void signup({
    required String email,
    required String password,
    required String name,
    required String year,
    required String program,
    required String school,
  }) async {
    print('attempting signup');
    final account = Account(client);
    Future result = account.create(
        userId: ID.unique(), email: email, password: password, name: name);

    result.then((response) {
      var user = response as User;
      var session = response as Session;
      emit(state.copyWith(
        session: session,
        authStatus: const AuthAuthorized(),
      ));
      print(user.email);
      // Update user preferences
      var userPrefs = {'Year': year, 'School': school, 'Program': program};

      Future updatePref = account.updatePrefs(prefs: userPrefs);
      updatePref.then((value) {
        Future getPref = account.getPrefs();
        getPref.then((value) {
          var prefs = value as Preferences;
          print(prefs.data);
        });
      }).catchError((error) {
        print(error);
      });
    }).catchError((error) {
      print(error);
    });
  }
}

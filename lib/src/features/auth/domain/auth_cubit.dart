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
    //clearSession();
 /*   final account = Account(client);
    Future result = account.getSession(
      sessionId: '65153d5eabe5d9d7b0ec',
    );

    await result.then((response) {
      print(response);
      Session session = response as Session;
      print(session.userId);
    }).catchError((error) {
      print(error.response);
    }); */

    String id = await getData(); // Await the result of getData
    print("Attempting auto login");
    if (id.isNotEmpty) {
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
      print("Attempting auto login fail ");
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

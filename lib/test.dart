/* import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authCubit = AuthCubit();

  // Attempt auto-login
  await authCubit.attemptAutoLogin();
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('6507b9d722fa8ccd95eb');
  final account = Account(client);
  /*  Future result = account.create(
      userId: ID.unique(),
      email: 'la12@gmail.com',
      password: '12345678',
      name: 'hahaha');
   */
  var userPrefs = {'Year': 'year 1', 'School': 'socs', 'Program': 'csai'};

  Future updatePref = account.updatePrefs(prefs: userPrefs);
}
 */
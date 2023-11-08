import 'package:appwrite/appwrite.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/auth/domain/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountState());

  Future<void> initializeAccountInfo() async {
    try {
      final client = Client()
          .setEndpoint('https://cloud.appwrite.io/v1')
          .setProject('6507b9d722fa8ccd95eb');
      Account account = Account(client);
      var response = await account.get();

/*       var userPrefs = {
        'Name': response.name,
        'Email': response.email,
        'Year': response.prefs.data['Year'],
        'School': response.prefs.data['School'],
        'Program': response.prefs.data['Program'],
      }; */

      emit(state.copyWith(
        name: response.name,
        email: response.email,
        year: response.prefs.data['Year'],
        school: response.prefs.data['School'],
        program: response.prefs.data['Program'],
      ));
      // savePrefs(userPrefs);
    } catch (error) {
      print('Error while fetching account info: $error');
      // Handle the error, e.g., show an error message to the user.
    }
  }
}

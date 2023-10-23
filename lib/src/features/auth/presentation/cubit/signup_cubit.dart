import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/auth/domain/auth_repo.dart';
import 'package:nott_a_student/src/features/auth/domain/session.dart';
import 'package:nott_a_student/src/features/auth/presentation/cubit/submission_status.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepo;
  SignupCubit({required this.authRepo}) : super(const SignupState());

  void onNameChanged(String name) {
    print(name);
    if (name != state.name) {
      emit(state.copyWith(name: name));
    }
  }

  void onYearChanged(String year) {
    print(year);
    if (year != state.year) {
      emit(state.copyWith(year: year));
    }
  }

  void onSchoolChanged(String school) {
    print(school);
    if (school != state.school) {
      emit(state.copyWith(school: school));
    }
  }

  void onProgramChanged(String program) {
    print(program);
    if (program != state.program) {
      emit(state.copyWith(program: program));
    }
  }

  void onEmailChanged(String email) {
    print(email);
    if (email != state.email) {
      emit(state.copyWith(email: email));
    }
  }

  void onPasswordChanged(String password) {
    print(password);
    if (password != state.password) {
      emit(state.copyWith(password: password));
    }
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    print(confirmPassword);
    if (confirmPassword != state.confirmPassword) {
      emit(state.copyWith(confirmPassword: confirmPassword));
    }
  }

  void onStepChanged(int step) {
    print(step);
    if (step != state.step) {
      emit(state.copyWith(step: step));
      emit(state.copyWith(status: ProceedInitial()));
    }
  }

  void onStatusChanged(SubmissionStatus status) {
    print(status);
    if (status != state.status) {
      emit(state.copyWith(status: status));
    }
  }

  void onNextStep(int currentStep) {
    if (currentStep == 0) {
      if (state.name.isEmpty ||
          state.year.isEmpty ||
          state.program.isEmpty ||
          state.school.isEmpty) {
        emit(state.copyWith(
            status: ProceedFailed(
                errorMessage: "Please fill in all the field before proceed")));
      } else {
        emit(state.copyWith(status: ProceedSuccess()));
        emit(state.copyWith(status: ProceedInitial()));
      }
    }

    if (currentStep == 1) {
      if (state.email.isEmpty ||
          state.password.isEmpty ||
          state.confirmPassword.isEmpty) {
        print("failed empty");
        emit(state.copyWith(
            status: ProceedFailed(
                errorMessage: "Please fill in all the field before proceed")));
        emit(state.copyWith(status: ProceedInitial()));
      } else if (state.password != state.confirmPassword) {
        print("failed not match");
        emit(state.copyWith(
            status: ProceedFailed(
                errorMessage: "Password And Confirm Password does not match")));
        emit(state.copyWith(status: ProceedInitial()));
      } else {
        print("success");
        emit(state.copyWith(status: ProceedSuccess()));
        // emit(state.copyWith(status: ProceedInitial()));
      }
    }
  }

  Future<void> onFormSubmit() async {
    print(state.name +
        state.year +
        state.school +
        state.program +
        state.email +
        state.password +
        state.confirmPassword);

    try {
      Client client = Client();

      client
          .setEndpoint('https://cloud.appwrite.io/v1')
          .setProject('6507b9d722fa8ccd95eb');

      Account account = Account(client);
      final result = account.create(
          userId: ID.unique(),
          email: state.email,
          password: state.password,
          name: state.name);

      result.then((response) {
        var test = authRepo.login(email: state.email, password: state.password);

        test.then((value) {
          print("Update preferences start");
          // Update user preferences
          var userPrefs = {
            'Year': state.year,
            'School': state.school,
            'Program': state.program,
          };

          Future updatePref = account.updatePrefs(
            prefs: userPrefs,
          );
          updatePref.then((value) {
            Future getPref = account.getPrefs();
            getPref.then((value) {
              var prefs = value as Preferences;
              print(prefs.data);
            });
          }).catchError((error) {
            print(error);
            print('preference error');
          });
        }).catchError((error) {
          print(error);
        });
      }).catchError((error) {
        print(error);
      });

      emit(state.copyWith(status: SignupSuccess()));
    } catch (e) {
      emit(state.copyWith(status: SignupFailed(exception: e.toString())));
    }

/*     final userId = await authRepo.login(
      email: state.email,
      password: state.password,
    );

    if (userId != "Failed") {
      emit(state.copyWith(status: SignupSuccess()));
    } */
  }

  Future<void> updateUserPreferences() async {
    print("Update preferences function");
    Client client = Client();

    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6507b9d722fa8ccd95eb');

    Account account = Account(client);
    print("recognise account start");
    String sessionId = await getData();
    print("update: " + sessionId);
    Future updateSession = account.updateSession(sessionId: sessionId);

    updateSession.then((value) {
      print("Update preferences start");
      // Update user preferences
      var userPrefs = {
        'Year': state.year,
        'School': state.school,
        'Program': state.program
      };

      Future updatePref = account.updatePrefs(
        prefs: userPrefs,
      );
      updatePref.then((value) {
        Future getPref = account.getPrefs();
        getPref.then((value) {
          var prefs = value as Preferences;
          print(prefs.data);
        });
      }).catchError((error) {
        print(error);
        print('preference error');
      });
    }).catchError((error) {
      print(error);
      print('session error');
    });
  }
}

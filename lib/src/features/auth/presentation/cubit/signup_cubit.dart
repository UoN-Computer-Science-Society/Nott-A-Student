import 'dart:developer';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/account_cubit.dart';
import 'package:appwrite/appwrite.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/auth/domain/auth_repo.dart';
import 'package:Nott_A_Student/src/features/auth/presentation/cubit/submission_status.dart';
import 'package:logging/logging.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepo;
  var logger = Logger("SignUpCubit");
  SignupCubit({required this.authRepo}) : super(const SignupState());

  void onNameChanged(String name) {
    logger.info(name);
    if (name != state.name) {
      emit(state.copyWith(name: name));
    }
  }

  void onYearChanged(String year) {
    logger.info(year);
    if (year != state.year) {
      emit(state.copyWith(year: year));
    }
  }

  void onSchoolChanged(String school) {
    logger.info(school);
    if (school != state.school) {
      emit(state.copyWith(school: school));
      emit(state.copyWith(program: null));
    }
  }

  void onProgramChanged(String program) {
    logger.info(program);
    if (program != state.program) {
      emit(state.copyWith(program: program));
    }
  }

  void onEmailChanged(String email) {
    logger.info(email);
    if (email != state.email) {
      emit(state.copyWith(email: email));
    }
  }

  void onPasswordChanged(String password) {
    logger.info(password);
    if (password != state.password) {
      emit(state.copyWith(password: password));
    }
  }

  void onConfirmPasswordChanged(String confirmPassword) {
    logger.info(confirmPassword);
    if (confirmPassword != state.confirmPassword) {
      emit(state.copyWith(confirmPassword: confirmPassword));
    }
  }

  void onStepChanged(int step) {
    logger.info(step);
    if (step != state.step) {
      emit(state.copyWith(step: step));
      emit(state.copyWith(status: ProceedInitial()));
    }
  }

  void onStatusChanged(SubmissionStatus status) {
    logger.info(status);
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
                errorMessage:
                    "Please fill in all the field before you proceed. Quack!")));
      } else {
        emit(state.copyWith(status: ProceedSuccess()));
        emit(state.copyWith(status: ProceedInitial()));
      }
    }

    if (currentStep == 1) {
      if (state.email.isEmpty ||
          state.password.isEmpty ||
          state.confirmPassword.isEmpty) {
        logger.info("failed empty");
        emit(state.copyWith(
            status: ProceedFailed(
                errorMessage:
                    "Please fill in all the field before you proceed. Quack!")));
        emit(state.copyWith(status: ProceedInitial()));
      } else if (state.password != state.confirmPassword) {
        logger.info("failed not match");
        emit(state.copyWith(
            status: ProceedFailed(
                errorMessage:
                    "Password and Confirm Password does not match. Quack!")));
        emit(state.copyWith(status: ProceedInitial()));
      } else {
        logger.info("success");
        emit(state.copyWith(status: ProceedSuccess()));
        // emit(state.copyWith(status: ProceedInitial()));
      }
    }
  }

  void resetState() {
    emit(state.copyWith(status: const InitialFormStatus()));
  }

  Future<void> onFormSubmit(BuildContext ctx) async {
    emit(state.copyWith(status: SignupLoading()));

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
        final id = authRepo.login(
            context: ctx,
            email: state.email,
            password: state.password,
            year: state.year,
            school: state.school,
            program: state.program);

        id.then((value) {
          log("User has been logged in: $id");
          ctx.read<AccountCubit>().initializeAccountInfo();
          emit(state.copyWith(status: SignupSuccess()));
        });
      }).catchError((error) {
        logger.info(error.toString());
        emit(state.copyWith(
            status: SignupFailed(
                exception: error, errorMessage: error.toString())));
      });
    } catch (e) {
      emit(state.copyWith(
          status: SignupFailed(
              exception: AppwriteException(), errorMessage: e.toString())));
    }
  }
}

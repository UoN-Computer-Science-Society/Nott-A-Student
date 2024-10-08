import 'package:appwrite/appwrite.dart';
import 'package:equatable/equatable.dart';

abstract class SubmissionStatus extends Equatable {
  const SubmissionStatus();
}

class InitialFormStatus extends SubmissionStatus {
  const InitialFormStatus();

  @override
  List<Object> get props => [];
}

class FormSubmitting extends SubmissionStatus {
  @override
  List<Object> get props => [];
}

class SubmissionSuccess extends SubmissionStatus {
  final String userId;

  const SubmissionSuccess({required this.userId});
  @override
  List<Object> get props => [userId];
}

class SubmissionFailed extends SubmissionStatus {
  final String errorMessage;

  const SubmissionFailed({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class ProceedInitial extends SubmissionStatus {
  @override
  List<Object> get props => [];
}

class ProceedSuccess extends SubmissionStatus {
  @override
  List<Object> get props => [];
}

class ProceedFailed extends SubmissionStatus {
  final String errorMessage;

  const ProceedFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SignupSuccess extends SubmissionStatus {
  @override
  List<Object> get props => [];
}

class SignupLoading extends SubmissionStatus {
  @override
  List<Object> get props => [];
}

class AfterSignupSuccess extends SubmissionStatus {
  @override
  List<Object> get props => [];
}

class SignupFailed extends SubmissionStatus {
  final AppwriteException exception;
  final String errorMessage;

  const SignupFailed({required this.exception, required this.errorMessage});

  @override
  List<Object> get props => [exception];
}

part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final String name;
  final String year;
  final String school;
  final String program;

  final String email;
  final String password;
  final String confirmPassword;
  final int step;
  final SubmissionStatus status;

  bool get isAccountSetupEmpty =>
      email.isEmpty || password.isEmpty || confirmPassword.isEmpty;

  const SignupState({
    this.name = '',
    this.year = '',
    this.school = '',
    this.program = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.step = 0,
    this.status = const InitialFormStatus(),
  });

  SignupState copyWith({
    String? name,
    String? year,
    String? school,
    String? program,
    String? email,
    String? password,
    String? confirmPassword,
    int? step,
    SubmissionStatus? status,
  }) {
    return SignupState(
      name: name ?? this.name,
      year: year ?? this.year,
      school: school ?? this.school,
      program: program ?? this.program,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      step: step ?? this.step,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        name,
        year,
        school,
        program,
        email,
        password,
        confirmPassword,
        step,
        status
      ];
}

part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String name;
  final String email;
  final String year;
  final String school;
  final String program;
  final Session? session;
  final AuthStatus authStatus;

  const AuthState({
    this.name = '',
    this.email = '',
    this.year = '',
    this.school = '',
    this.program = '',
    this.session,
    this.authStatus = const AuthInitial(),
  });

  AuthState copyWith({
    final String? name,
    final String? email,
    final String? year,
    final String? school,
    final String? program,
    final Session? session,
    final AuthStatus? authStatus,
  }) {
    return AuthState(
      name: name ?? this.name,
      email: email ?? this.email,
      year: year ?? this.year,
      school: school ?? this.school,
      program: program ?? this.program,
      session: session ?? this.session,
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  List<Object> get props => [
        authStatus,
        name,
        email,
        year,
        school,
        program,
      ];
}

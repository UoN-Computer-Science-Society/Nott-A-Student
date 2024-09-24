part of 'account_cubit.dart';

class AccountState extends Equatable {
  final String name;
  final String email;
  final String year;
  final String school;
  final String program;

  // Use a constructor or an initialization method to retrieve SharedPreferences
  const AccountState({
    this.name = '',
    this.email = '',
    this.year = '',
    this.school = '',
    this.program = '',
  });



  AccountState copyWith({
    String? name,
    String? email,
    String? year,
    String? program,
    String? school,
  }) {
    return AccountState(
      name: name ?? this.name,
      email: email ?? this.email,
      year: year ?? this.year,
      program: program ?? this.program,
      school: school ?? this.school,
    );
  }

  @override
  List<Object> get props => [name, email, year, program, school];
}

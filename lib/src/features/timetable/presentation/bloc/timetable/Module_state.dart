// import 'package:Nott_A_Student/src/features/auth/domain/auth_status.dart';
// import 'package:appwrite/models.dart';
// import 'package:equatable/equatable.dart';

part of 'ModuleRequestBloc.dart';

class ModuleState extends Equatable {
  final List<Activity> activity; // Change to List<Activity>
  final Session? session;
  final AuthStatus authStatus;

  const ModuleState({
    required this.activity, // Change to required this.activity
    this.session,
    this.authStatus = const AuthInitial(),
  });

  ModuleState copyWith({
    Activity? timetableData,
    Session? session,
    AuthStatus? authStatus, required List<Activity> activity,
  }) {
    return ModuleState(
      activity: activity,
      session: session ?? this.session,
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  List<Object> get props => [
        activity,
        authStatus,
      ];
}

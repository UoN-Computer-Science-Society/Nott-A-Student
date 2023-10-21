part of 'auth_cubit.dart';

/* enum AuthStatus {authenticated,unauthenticated}
 */
class AuthState extends Equatable {
  final Session? session;
  final AuthStatus authStatus;

    const AuthState({
    this.session,
    this.authStatus = const AuthUnauthorized(),

  });

  AuthState copyWith({
   final Session? session,
  final AuthStatus? authStatus,
  }) {
    return AuthState(
      session: session ?? this.session,
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  List<Object> get props => [authStatus]; 
}

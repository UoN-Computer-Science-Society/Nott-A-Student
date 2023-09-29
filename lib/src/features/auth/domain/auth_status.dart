/* import 'package:equatable/equatable.dart';
 */
abstract class AuthStatus {
  const AuthStatus();
}

class AuthInitial extends AuthStatus {
  const AuthInitial();
}

class AuthAuthorized extends AuthStatus {
  const AuthAuthorized();
}

class AuthUnauthorized extends AuthStatus {
  const AuthUnauthorized();
}

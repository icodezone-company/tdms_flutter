part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username, pass;

  LoginEvent({required this.username, required this.pass});
}

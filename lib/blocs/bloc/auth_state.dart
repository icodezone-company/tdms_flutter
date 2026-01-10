part of 'auth_bloc.dart';

enum Status { loading, success, failure }

@immutable
sealed class AuthState {
  final Status status;
  final String? message;
  const AuthState({required this.status, this.message});

  bool get isFailure => status == Status.failure;

  bool get isLoading => status == Status.loading;

  bool get isSuccess => status == Status.success;
}

final class AuthInitial extends AuthState {
  const AuthInitial({super.status = Status.success});
}

final class LoginState extends AuthState {
  const LoginState._({required super.status, super.message});

  const LoginState.loading() : this._(status: Status.loading);
  const LoginState.success() : this._(status: Status.success);
  const LoginState.failure({required String message})
    : this._(status: Status.failure, message: message);
}

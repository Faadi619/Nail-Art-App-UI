part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String
      userUid; //this can be user model or anything that you need after logging in.

  AuthSuccess({required this.userUid});
}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}

final class AuthLoading extends AuthState {}

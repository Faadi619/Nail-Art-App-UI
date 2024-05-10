import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);

    on<AuthLogoutRequested>(_onAuthLogoutRequested);

    on<AuthSignUpRequested>(_onAuthSignUpRequested);
  }

  void _onAuthLoginRequested(event, emit) async {
    //Loading state
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;

      // if (password.length < 6) {
      //   return emit(AuthFailure(errorMessage: 'Password is less than 6'));
      // }
      await Future.delayed(Duration(seconds: 1), () {
        return emit(
            AuthSuccess(userUid: 'This has to be the User UID of $email'));
      });
    } catch (e) {
      return emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  void _onAuthSignUpRequested(event, emit) async {
    //Loading state
    emit(AuthLoading());
    final email = event.email;
    final password = event.password;
    try {
      if (password.length < 6) {
        return emit(AuthFailure(errorMessage: 'Password is less than 6'));
      }
      await Future.delayed(Duration(seconds: 1), () {
        return emit(
            AuthSuccess(userUid: 'This has to be the User UID of $email'));
      });
    } catch (e) {
      return emit(AuthFailure(errorMessage: e.toString()));
    }
  }

  void _onAuthLogoutRequested(event, emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}

import 'package:api_bloc/presentation/pages/bloc/auth_event.dart';
import 'package:api_bloc/presentation/pages/bloc/auth_state.dart';
import 'package:api_bloc/presentation/pages/repositry/authrepo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositry authRepositry;
  AuthBloc({required this.authRepositry}) : super(AuthInitial()) {
    on<AuthSignUpRequested>(_authSignUpRequested);
    on<AuthLoginRequested>(_authLoginRequested);
    on<AuthLogOutRequested>(_authLogOutRequested);
  }
  Future<void> _authSignUpRequested(
      AuthSignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepositry.signUp(email: event.email, password: event.password);
      emit(AuthAuthenticated(event.email));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _authLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepositry.login(email: event.email, password: event.password);
      emit(AuthAuthenticated(event.email));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _authLogOutRequested(
      AuthLogOutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await authRepositry.logout();
    emit(AuthUnauthenticated());
  }
}

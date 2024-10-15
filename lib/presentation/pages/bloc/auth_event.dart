import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  List<Object> get props => [];
}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  AuthSignUpRequested(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;
  AuthLoginRequested(this.password, this.email);
  @override
  List<Object> get props => [email, password];
}

class AuthLogOutRequested extends AuthEvent {}

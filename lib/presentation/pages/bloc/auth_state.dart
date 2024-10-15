import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{
  @override
  List<Object> get props => [];
}
class AuthInitial extends AuthState{}

class AuthLoading extends AuthState{}
class AuthAuthenticated extends AuthState{
  final String email;
  AuthAuthenticated(this.email);
  @override
  List<Object>get props => [email];
}
class AuthUnauthenticated extends AuthState{

}
class AuthFailure extends AuthState{
  final String error;
  AuthFailure(this.error);
  @override
  List<Object> get props => [error];
}
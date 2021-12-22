import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent{
  final String email;
  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString()=> 'Email changed! Email: $email';
}

class PasswordChanged extends LoginEvent{
  final String password;
  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString()=> 'Password changed! Password: $password';
}

class Submitted extends LoginEvent {
  final String email;
  const Submitted(this.email);

  @override
  List<Object> get props => [email];
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  const LoginWithCredentialsPressed({required this.email});
}

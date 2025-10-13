import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
  @override
  List<Object?> get props => [];
}

class LoginIdentifierChanged extends SignInEvent {
  const LoginIdentifierChanged(this.value);
  final String value;
  @override
  List<Object?> get props => [value];
}

class LoginPasswordChanged extends SignInEvent {
  const LoginPasswordChanged(this.value);
  final String value;
  @override
  List<Object?> get props => [value];
}

class LoginRememberToggled extends SignInEvent {
  const LoginRememberToggled();
}

class LoginSubmitted extends SignInEvent {
  const LoginSubmitted();
}

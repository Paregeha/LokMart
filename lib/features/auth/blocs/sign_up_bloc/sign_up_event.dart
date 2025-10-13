import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpUsernameChanged extends SignUpEvent {
  const SignUpUsernameChanged(this.value);
  final String value;

  @override
  List<Object?> get props => [value];
}

class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.value);
  final String value;

  @override
  List<Object?> get props => [value];
}

class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.value);
  final String value;

  @override
  List<Object?> get props => [];
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();
}

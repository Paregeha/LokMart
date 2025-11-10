import 'package:equatable/equatable.dart';
import '../../models/strapi_auth_response.dart';

enum SignUpStatus { initial, invalid, loading, success, failure }

class SignUpState extends Equatable {
  const SignUpState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.status = SignUpStatus.initial,
    this.error,
    this.response,
  });

  final String username;
  final String email;
  final String password;
  final SignUpStatus status;
  final String? error;
  final StrapiAuthResponse? response;

  bool get isUsernameValid => username.trim().length >= 3;
  bool get isEmailValid {
    final r = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return r.hasMatch(email.trim());
  }

  bool get isPasswordValid => password.length >= 6;

  bool get isValid => isUsernameValid && isEmailValid && isPasswordValid;

  SignUpState copyWith({
    String? username,
    String? email,
    String? password,
    SignUpStatus? status,
    String? error,
    StrapiAuthResponse? response,
  }) {
    return SignUpState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      error: error,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [
    username,
    email,
    password,
    status,
    error,
    response,
  ];
}

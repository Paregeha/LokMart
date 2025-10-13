import 'package:equatable/equatable.dart';
import '../../models/strapi_auth_response.dart';

enum SignInStatus { initial, invalid, loading, success, failure }

class SignInState extends Equatable {
  const SignInState({
    this.identifier = '',
    this.password = '',
    this.rememberMe = false,
    this.status = SignInStatus.initial,
    this.error,
    this.response,
  });

  final String identifier;
  final String password;
  final bool rememberMe;
  final SignInStatus status;
  final String? error;
  final StrapiAuthResponse? response;

  bool get isValid => identifier.trim().isNotEmpty && password.isNotEmpty;

  SignInState copyWith({
    String? identifier,
    String? password,
    bool? rememberMe,
    SignInStatus? status,
    String? error,
    StrapiAuthResponse? response,
  }) {
    return SignInState(
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      status: status ?? this.status,
      error: error,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [
    identifier,
    password,
    rememberMe,
    status,
    error,
    response,
  ];
}

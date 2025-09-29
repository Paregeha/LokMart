import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum AuthForgotPasswordPost$ResponseOk {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('true')
  $true('true');

  final String? value;

  const AuthForgotPasswordPost$ResponseOk(this.value);
}

enum AuthSendEmailConfirmationPost$ResponseSent {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('true')
  $true('true');

  final String? value;

  const AuthSendEmailConfirmationPost$ResponseSent(this.value);
}

enum UsersPermissionsRolesPost$ResponseOk {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('true')
  $true('true');

  final String? value;

  const UsersPermissionsRolesPost$ResponseOk(this.value);
}

enum UsersPermissionsRolesRolePut$ResponseOk {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('true')
  $true('true');

  final String? value;

  const UsersPermissionsRolesRolePut$ResponseOk(this.value);
}

enum UsersPermissionsRolesRoleDelete$ResponseOk {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('true')
  $true('true');

  final String? value;

  const UsersPermissionsRolesRoleDelete$ResponseOk(this.value);
}

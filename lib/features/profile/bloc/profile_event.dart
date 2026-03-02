import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class ProfileBoot extends ProfileEvent {
  const ProfileBoot();
}

class ProfileRefresh extends ProfileEvent {
  const ProfileRefresh();
}

class ProfileEditOpened extends ProfileEvent {
  const ProfileEditOpened();
}

class ProfileEditClosed extends ProfileEvent {
  const ProfileEditClosed();
}

class ProfileUsernameChanged extends ProfileEvent {
  const ProfileUsernameChanged(this.value);
  final String value;
  @override
  List<Object?> get props => [value];
}

class ProfileEmailChanged extends ProfileEvent {
  const ProfileEmailChanged(this.value);
  final String value;
  @override
  List<Object?> get props => [value];
}

class ProfileCurrentPasswordChanged extends ProfileEvent {
  const ProfileCurrentPasswordChanged(this.value);
  final String value;
  @override
  List<Object?> get props => [value];
}

class ProfileNewPasswordChanged extends ProfileEvent {
  const ProfileNewPasswordChanged(this.value);
  final String value;
  @override
  List<Object?> get props => [value];
}

class ProfileConfirmPasswordChanged extends ProfileEvent {
  const ProfileConfirmPasswordChanged(this.value);
  final String value;
  @override
  List<Object?> get props => [value];
}

class ProfilePickAvatarPressed extends ProfileEvent {
  const ProfilePickAvatarPressed({this.fromCamera = false});
  final bool fromCamera;
  @override
  List<Object?> get props => [fromCamera];
}

class ProfileSaveProfileSubmitted extends ProfileEvent {
  const ProfileSaveProfileSubmitted();
}

class ProfileChangePasswordSubmitted extends ProfileEvent {
  const ProfileChangePasswordSubmitted();
}

class ProfileLogoutPressed extends ProfileEvent {
  const ProfileLogoutPressed();
}

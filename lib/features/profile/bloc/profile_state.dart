import 'package:equatable/equatable.dart';
import '../../auth/models/strapi_auth_response.dart';

enum ProfileStatus {
  initial,
  loading,
  ready,

  savingProfile,
  changingPassword,

  successProfile,
  successPassword,

  failure,
  loggedOut,
}

class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.user,
    this.error,
    this.editOpen = false,

    this.username = '',
    this.email = '',
    this.avatarLocalPath,

    this.currentPassword = '',
    this.newPassword = '',
    this.confirmPassword = '',
  });

  final ProfileStatus status;
  final StrapiUser? user;
  final String? error;
  final bool editOpen;

  final String username;
  final String email;
  final String? avatarLocalPath;

  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  bool get canSaveProfile {
    if (user == null) return false;

    final nameOk = username.trim().length >= 3;
    final emailOk = RegExp(
      r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
    ).hasMatch(email.trim());
    return nameOk && emailOk;
  }

  bool get canChangePassword {
    final any =
        currentPassword.isNotEmpty ||
        newPassword.isNotEmpty ||
        confirmPassword.isNotEmpty;

    if (!any) return false;

    return currentPassword.isNotEmpty &&
        newPassword.length >= 6 &&
        newPassword == confirmPassword;
  }

  ProfileState copyWith({
    ProfileStatus? status,
    StrapiUser? user,
    String? error,
    bool clearError = false,
    bool? editOpen,

    String? username,
    String? email,
    String? avatarLocalPath,

    String? currentPassword,
    String? newPassword,
    String? confirmPassword,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: clearError ? null : (error ?? this.error),
      editOpen: editOpen ?? this.editOpen,
      username: username ?? this.username,
      email: email ?? this.email,
      avatarLocalPath: avatarLocalPath ?? this.avatarLocalPath,
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  ProfileState fillFormFromUser(StrapiUser u) {
    return copyWith(
      username: u.username,
      email: u.email,
      avatarLocalPath: null,
      currentPassword: '',
      newPassword: '',
      confirmPassword: '',
      clearError: true,
    );
  }

  @override
  List<Object?> get props => [
    status,
    user,
    error,
    editOpen,
    username,
    email,
    avatarLocalPath,
    currentPassword,
    newPassword,
    confirmPassword,
  ];
}

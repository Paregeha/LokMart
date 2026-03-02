import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../auth/data/auth_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._authRepo) : super(const ProfileState()) {
    on<ProfileBoot>(_onBoot);
    on<ProfileRefresh>(_onRefresh);

    on<ProfileEditOpened>(_onEditOpened);
    on<ProfileEditClosed>(_onEditClosed);

    on<ProfileUsernameChanged>(_onUsernameChanged);
    on<ProfileEmailChanged>(_onEmailChanged);

    on<ProfileCurrentPasswordChanged>(_onCurrentPasswordChanged);
    on<ProfileNewPasswordChanged>(_onNewPasswordChanged);
    on<ProfileConfirmPasswordChanged>(_onConfirmPasswordChanged);

    on<ProfilePickAvatarPressed>(_onPickAvatar);

    on<ProfileSaveProfileSubmitted>(_onSaveProfile);
    on<ProfileChangePasswordSubmitted>(_onChangePassword);

    on<ProfileLogoutPressed>(_onLogout);
  }

  final AuthRepository _authRepo;
  final ImagePicker _picker = ImagePicker();

  Future<void> _onBoot(ProfileBoot event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading, clearError: true));
    try {
      final u = await _authRepo.me();
      emit(
        state
            .copyWith(status: ProfileStatus.ready, user: u, clearError: true)
            .fillFormFromUser(u),
      );
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.failure, error: e.toString()));
    }
  }

  Future<void> _onRefresh(
    ProfileRefresh event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final u = await _authRepo.me();
      emit(
        state.copyWith(status: ProfileStatus.ready, user: u, clearError: true),
      );
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.failure, error: e.toString()));
    }
  }

  void _onEditOpened(ProfileEditOpened event, Emitter<ProfileState> emit) {
    final u = state.user;
    if (u == null) return;
    emit(state.copyWith(editOpen: true, clearError: true).fillFormFromUser(u));
  }

  void _onEditClosed(ProfileEditClosed event, Emitter<ProfileState> emit) {
    emit(state.copyWith(editOpen: false, clearError: true));
  }

  void _onUsernameChanged(
    ProfileUsernameChanged e,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(username: e.value, clearError: true));
  }

  void _onEmailChanged(ProfileEmailChanged e, Emitter<ProfileState> emit) {
    emit(state.copyWith(email: e.value, clearError: true));
  }

  void _onCurrentPasswordChanged(
    ProfileCurrentPasswordChanged e,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(currentPassword: e.value, clearError: true));
  }

  void _onNewPasswordChanged(
    ProfileNewPasswordChanged e,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(newPassword: e.value, clearError: true));
  }

  void _onConfirmPasswordChanged(
    ProfileConfirmPasswordChanged e,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(confirmPassword: e.value, clearError: true));
  }

  Future<void> _onPickAvatar(
    ProfilePickAvatarPressed event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final x = await _picker.pickImage(
        source: event.fromCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1024,
      );
      if (x == null) return;

      emit(state.copyWith(avatarLocalPath: x.path, clearError: true));
    } catch (e) {
      emit(
        state.copyWith(
          status: ProfileStatus.failure,
          error: 'Не вдалось вибрати фото: $e',
        ),
      );
    }
  }

  Future<void> _onSaveProfile(
    ProfileSaveProfileSubmitted event,
    Emitter<ProfileState> emit,
  ) async {
    if (!state.canSaveProfile) {
      emit(
        state.copyWith(
          status: ProfileStatus.failure,
          error: 'Перевір username/email',
        ),
      );
      return;
    }

    final u = state.user;
    if (u == null) return;

    emit(state.copyWith(status: ProfileStatus.savingProfile, clearError: true));

    try {
      int? avatarId;
      if (state.avatarLocalPath != null && state.avatarLocalPath!.isNotEmpty) {
        avatarId = await _authRepo.uploadAvatar(state.avatarLocalPath!);
      }

      final updated = await _authRepo.updateProfile(
        userId: u.id,
        username: state.username.trim(),
        email: state.email.trim(),
        avatarId: avatarId,
      );

      emit(
        state
            .copyWith(
              status: ProfileStatus.successProfile,
              user: updated,
              editOpen: false,
              avatarLocalPath: null,
              clearError: true,
            )
            .fillFormFromUser(updated),
      );

      emit(state.copyWith(status: ProfileStatus.ready));
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.failure, error: e.toString()));
    }
  }

  Future<void> _onChangePassword(
    ProfileChangePasswordSubmitted event,
    Emitter<ProfileState> emit,
  ) async {
    if (!state.canChangePassword) {
      emit(
        state.copyWith(
          status: ProfileStatus.failure,
          error: 'Перевір поля пароля',
        ),
      );
      return;
    }

    emit(
      state.copyWith(status: ProfileStatus.changingPassword, clearError: true),
    );

    try {
      await _authRepo.changePassword(
        currentPassword: state.currentPassword,
        newPassword: state.newPassword,
        confirmPassword: state.confirmPassword,
      );

      emit(
        state.copyWith(
          status: ProfileStatus.successPassword,
          currentPassword: '',
          newPassword: '',
          confirmPassword: '',
          clearError: true,
        ),
      );

      emit(state.copyWith(status: ProfileStatus.ready));
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.failure, error: e.toString()));
    }
  }

  Future<void> _onLogout(
    ProfileLogoutPressed event,
    Emitter<ProfileState> emit,
  ) async {
    await _authRepo.logout();
    emit(const ProfileState(status: ProfileStatus.loggedOut));
  }
}

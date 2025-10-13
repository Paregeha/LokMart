import 'package:bloc/bloc.dart';
import 'package:flutter_base_architecture/features/auth/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:flutter_base_architecture/features/auth/blocs/sign_in_bloc/sign_in_state.dart';
import '../../data/auth_repository.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this._repo) : super(const SignInState()) {
    on<LoginIdentifierChanged>((e, emit) {
      emit(
        state.copyWith(
          identifier: e.value,
          error: null,
          status: SignInStatus.initial,
        ),
      );
    });
    on<LoginPasswordChanged>((e, emit) {
      emit(
        state.copyWith(
          password: e.value,
          error: null,
          status: SignInStatus.initial,
        ),
      );
    });
    on<LoginRememberToggled>((e, emit) {
      emit(state.copyWith(rememberMe: !state.rememberMe));
    });
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthRepository _repo;

  Future<void> _onSubmitted(LoginSubmitted e, Emitter<SignInState> emit) async {
    if (!state.isValid) {
      emit(
        state.copyWith(
          status: SignInStatus.invalid,
          error: 'Введіть логін та пароль',
        ),
      );
      return;
    }
    emit(state.copyWith(status: SignInStatus.loading, error: null));
    try {
      final res = await _repo.login(
        identifier: state.identifier.trim(),
        password: state.password,
      );
      emit(state.copyWith(status: SignInStatus.success, response: res));
    } on AuthException catch (err) {
      emit(state.copyWith(status: SignInStatus.failure, error: err.message));
    } catch (_) {
      emit(
        state.copyWith(
          status: SignInStatus.failure,
          error: 'Щось пішло не так',
        ),
      );
    }
  }
}

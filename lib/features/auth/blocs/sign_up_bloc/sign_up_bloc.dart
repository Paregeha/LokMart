import 'package:bloc/bloc.dart';

import '../../data/auth_repository.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._repo) : super(const SignUpState()) {
    on<SignUpUsernameChanged>((e, emit) {
      emit(
        state.copyWith(
          username: e.value,
          error: null,
          status: SignUpStatus.initial,
        ),
      );
    });

    on<SignUpEmailChanged>((e, emit) {
      emit(
        state.copyWith(
          email: e.value,
          error: null,
          status: SignUpStatus.initial,
        ),
      );
    });

    on<SignUpPasswordChanged>((e, emit) {
      emit(
        state.copyWith(
          password: e.value,
          error: null,
          status: SignUpStatus.initial,
        ),
      );
    });

    on<SignUpSubmitted>(_onSubmitted);
  }

  final AuthRepository _repo;

  Future<void> _onSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    if (!state.isValid) {
      emit(
        state.copyWith(status: SignUpStatus.invalid, error: 'Перевірте поля'),
      );
      return;
    }

    emit(state.copyWith(status: SignUpStatus.loading, error: null));
    try {
      final res = await _repo.register(
        username: state.username.trim(),
        email: state.email.trim(),
        password: state.password,
      );
      emit(state.copyWith(status: SignUpStatus.success, response: res));
    } on AuthException catch (e) {
      emit(state.copyWith(status: SignUpStatus.failure, error: e.message));
    } catch (_) {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
          error: 'Щось пішло не так',
        ),
      );
    }
  }
}

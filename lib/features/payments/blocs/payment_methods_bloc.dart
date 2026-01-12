import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/payments_repository.dart';
import 'payment_methods_event.dart';
import 'payment_methods_state.dart';

class PaymentMethodsBloc
    extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  PaymentMethodsBloc(this.repo) : super(const PaymentMethodsState()) {
    on<PaymentMethodsEvent>(_onEvent);
  }

  final PaymentsRepository repo;

  Future<void> _onEvent(
    PaymentMethodsEvent event,
    Emitter<PaymentMethodsState> emit,
  ) async {
    await event.map<Future<void>>(
      fetch: (_) => _onFetch(emit),
      select: (e) => _onSelect(e.id, emit),
      setDefault: (e) => _onSetDefault(e.id, emit),
      delete: (e) => _onDelete(e.id, emit),
    );
  }

  Future<void> _onFetch(Emitter<PaymentMethodsState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final cards = await repo.fetchMyCards();

      final defaultCard =
          cards.any((c) => c.isDefault)
              ? cards.firstWhere((c) => c.isDefault)
              : null;

      emit(
        state.copyWith(
          loading: false,
          cards: cards,
          selectedId:
              state.selectedId ??
              defaultCard?.id ??
              (cards.isNotEmpty ? cards.first.id : null),
        ),
      );
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  Future<void> _onSelect(int id, Emitter<PaymentMethodsState> emit) async {
    emit(state.copyWith(selectedId: id));
  }

  Future<void> _onSetDefault(int id, Emitter<PaymentMethodsState> emit) async {
    try {
      await repo.setDefaultCard(id: id);
      add(const PaymentMethodsEvent.fetch());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onDelete(int id, Emitter<PaymentMethodsState> emit) async {
    try {
      await repo.deleteCard(id: id);
      add(const PaymentMethodsEvent.fetch());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}

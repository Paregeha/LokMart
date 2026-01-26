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
      select: (e) async => emit(state.copyWith(selectedId: e.id)),
      setDefault: (e) => _onSetDefault(e.documentId, emit),
      delete: (e) => _onDelete(e.documentId, emit),
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

      final selectedStillExists =
          state.selectedId != null &&
          cards.any((c) => c.id == state.selectedId);

      emit(
        state.copyWith(
          loading: false,
          cards: cards,
          selectedId:
              selectedStillExists
                  ? state.selectedId
                  : (defaultCard?.id ??
                      (cards.isNotEmpty ? cards.first.id : null)),
        ),
      );
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }

  Future<void> _onSetDefault(
    String documentId,
    Emitter<PaymentMethodsState> emit,
  ) async {
    try {
      await repo.setDefaultCard(documentId: documentId);
      add(const PaymentMethodsEvent.fetch());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onDelete(
    String documentId,
    Emitter<PaymentMethodsState> emit,
  ) async {
    try {
      await repo.deleteCard(documentId: documentId);
      add(const PaymentMethodsEvent.fetch());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}

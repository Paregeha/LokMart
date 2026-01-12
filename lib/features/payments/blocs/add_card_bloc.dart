import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../data/payments_repository.dart';

part 'add_card_bloc.freezed.dart';

@freezed
class AddCardEvent with _$AddCardEvent {
  const factory AddCardEvent.submit({required String cardholderName}) = _Submit;
}

@freezed
class AddCardState with _$AddCardState {
  const factory AddCardState({
    @Default(false) bool loading,
    String? error,
    @Default(false) bool success,
  }) = _AddCardState;
}

class AddCardBloc extends Bloc<AddCardEvent, AddCardState> {
  AddCardBloc(this.repo) : super(const AddCardState()) {
    on<_Submit>(_onSubmit);
  }

  final PaymentsRepository repo;

  Future<void> _onSubmit(_Submit event, Emitter<AddCardState> emit) async {
    emit(state.copyWith(loading: true, error: null, success: false));

    try {
      final clientSecret = await repo.createSetupIntent();

      final setupIntent = await Stripe.instance.confirmSetupIntent(
        paymentIntentClientSecret: clientSecret,
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(name: event.cardholderName.trim()),
          ),
        ),
      );

      final pmId = setupIntent.paymentMethodId;
      if (pmId == null || pmId.isEmpty) {
        throw Exception('Stripe did not return paymentMethodId');
      }

      await repo.attachPaymentMethod(paymentMethodId: pmId, setDefault: true);

      emit(state.copyWith(loading: false, success: true));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString(), success: false));
    }
  }
}

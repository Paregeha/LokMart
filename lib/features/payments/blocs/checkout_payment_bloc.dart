import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../cart/blocs/cart_bloc.dart';
import '../../cart/blocs/cart_event.dart';
import '../../order/data/orders_repository.dart';
import '../../order/models/order.dart';
import '../data/payments_repository.dart';
import '../models/saved_card.dart';

part 'checkout_payment_bloc.freezed.dart';

@freezed
class CheckoutPaymentEvent with _$CheckoutPaymentEvent {
  const factory CheckoutPaymentEvent.pay({
    required SavedCard selectedCard,
    required int amount,
    @Default('usd') String currency,
    String? orderId,
    required String addressDocumentId,
  }) = _Pay;

  const factory CheckoutPaymentEvent.payCash({
    required int amount,
    @Default('usd') String currency,
    required String addressDocumentId,
  }) = _PayCash;
}

@freezed
class CheckoutPaymentState with _$CheckoutPaymentState {
  const factory CheckoutPaymentState({
    @Default(false) bool loading,
    String? error,
    @Default(false) bool success,
    String? createdOrderDocumentId,
  }) = _CheckoutPaymentState;
}

class CheckoutPaymentBloc
    extends Bloc<CheckoutPaymentEvent, CheckoutPaymentState> {
  CheckoutPaymentBloc({
    required PaymentsRepository paymentsRepo,
    required OrdersRepository ordersRepo,
    required CartBloc cartBloc,
  }) : _paymentsRepo = paymentsRepo,
       _ordersRepo = ordersRepo,
       _cartBloc = cartBloc,
       super(const CheckoutPaymentState()) {
    on<_Pay>(_onPay);
    on<_PayCash>(_onPayCash);
  }

  final PaymentsRepository _paymentsRepo;
  final OrdersRepository _ordersRepo;
  final CartBloc _cartBloc;

  Future<void> _onPay(_Pay e, Emitter<CheckoutPaymentState> emit) async {
    emit(
      state.copyWith(
        loading: true,
        error: null,
        success: false,
        createdOrderDocumentId: null,
      ),
    );

    try {
      final pi = await _paymentsRepo.createPaymentIntent(
        paymentMethodDocumentId: e.selectedCard.documentId,
        amount: e.amount,
        currency: e.currency,
        orderId: e.orderId,
      );

      debugPrint('PI status(from backend)=${pi.status}');

      PaymentIntent? confirmed;
      if (pi.status != 'succeeded') {
        confirmed = await Stripe.instance.confirmPayment(
          paymentIntentClientSecret: pi.clientSecret,
          data: PaymentMethodParams.cardFromMethodId(
            paymentMethodData: PaymentMethodDataCardFromMethod(
              paymentMethodId: e.selectedCard.paymentMethodId,
            ),
          ),
        );
        debugPrint('PI status(after confirm)=${confirmed.status}');
      } else {
        debugPrint('PI already succeeded on backend. Skipping confirmPayment.');
      }

      final ok =
          (pi.status == 'succeeded') ||
          (confirmed?.status == PaymentIntentsStatus.Succeeded);

      if (!ok) {
        throw Exception(
          'Payment not completed. Status=${confirmed?.status ?? pi.status}',
        );
      }

      final routePoints = await _ordersRepo.buildRoutePointsToCurrentUser();

      final OrderModel created = await _ordersRepo.createOrderMine(
        amount: e.amount,
        currency: e.currency,
        addressDocumentId: e.addressDocumentId,
        routePoints: routePoints,
      );

      _cartBloc.add(const CartEvent.clear());

      emit(
        state.copyWith(
          loading: false,
          success: true,
          createdOrderDocumentId: created.documentId,
        ),
      );
    } on StripeException catch (ex) {
      debugPrint(
        'StripeException: code=${ex.error.code} message=${ex.error.message} localized=${ex.error.localizedMessage}',
      );

      final msg =
          ex.error.localizedMessage ?? ex.error.message ?? 'Stripe error';

      emit(state.copyWith(loading: false, error: msg, success: false));
    } catch (err) {
      debugPrint('Pay error: $err');
      emit(
        state.copyWith(loading: false, error: err.toString(), success: false),
      );
    }
  }

  Future<void> _onPayCash(
    _PayCash e,
    Emitter<CheckoutPaymentState> emit,
  ) async {
    emit(
      state.copyWith(
        loading: true,
        error: null,
        success: false,
        createdOrderDocumentId: null,
      ),
    );

    try {
      final routePoints = await _ordersRepo.buildRoutePointsToCurrentUser();

      final OrderModel created = await _ordersRepo.createOrderMine(
        amount: e.amount,
        currency: e.currency,
        addressDocumentId: e.addressDocumentId,
        routePoints: routePoints,
      );

      _cartBloc.add(const CartEvent.clear());

      emit(
        state.copyWith(
          loading: false,
          success: true,
          createdOrderDocumentId: created.documentId,
        ),
      );
    } catch (err) {
      debugPrint('Cash order error: $err');
      emit(
        state.copyWith(loading: false, error: err.toString(), success: false),
      );
    }
  }
}

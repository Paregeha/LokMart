import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/cart_repository.dart';
import '../models/cart_item.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._repo) : super(const CartState.initial()) {
    on<CartEvent>(_onEvent);
  }

  final CartRepository _repo;

  Future<void> _onEvent(CartEvent event, Emitter<CartState> emit) async {
    await event.when(
      load: () async {
        emit(const CartState.loading());
        try {
          final items = await _repo.fetchMyCart();
          emit(CartState.success(items: items, total: _calcTotal(items)));
        } catch (e) {
          emit(CartState.failure(e.toString()));
        }
      },
      add: (productId, count) async {
        try {
          await _repo.addToCart(productId: productId, addCount: count);
          final items = await _repo.fetchMyCart();
          emit(CartState.success(items: items, total: _calcTotal(items)));
        } catch (e) {
          emit(CartState.failure(e.toString()));
        }
      },
      inc: (item) async {
        try {
          await _repo.updateCount(
            cartItemDocumentId: item.documentId,
            count: item.count + 1,
          );
          final items = await _repo.fetchMyCart();
          emit(CartState.success(items: items, total: _calcTotal(items)));
        } catch (e) {
          emit(CartState.failure(e.toString()));
        }
      },
      dec: (item) async {
        try {
          final next = item.count - 1;

          // ✅ якщо стало 0 або менше — видаляємо позицію з кошика
          if (next <= 0) {
            await _repo.removeItem(item.documentId);
          } else {
            await _repo.updateCount(
              cartItemDocumentId: item.documentId,
              count: next,
            );
          }

          final items = await _repo.fetchMyCart();
          emit(CartState.success(items: items, total: _calcTotal(items)));
        } catch (e) {
          emit(CartState.failure(e.toString()));
        }
      },
      remove: (cartItemDocumentId) async {
        try {
          await _repo.removeItem(cartItemDocumentId);
          final items = await _repo.fetchMyCart();
          emit(CartState.success(items: items, total: _calcTotal(items)));
        } catch (e) {
          emit(CartState.failure(e.toString()));
        }
      },
    );
  }

  double _calcTotal(List<CartItem> items) {
    double sum = 0;
    for (final it in items) {
      final p = it.product;
      final price =
          (p.priceWithDiscount != null && (p.priceWithDiscount ?? 0) > 0)
              ? (p.priceWithDiscount ?? 0)
              : (p.price ?? 0);
      sum += price * it.count;
    }
    return sum;
  }
}

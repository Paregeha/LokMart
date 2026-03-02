import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/wishlist_repository.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc(this._repo) : super(const WishlistState.initial()) {
    on<WishlistEvent>((event, emit) async {
      await event.when(
        load: () => _onLoad(emit),
        refresh: () => _onRefresh(emit),
        toggle: (productId) => _onToggle(emit, productId),
      );
    });
  }

  final WishlistRepository _repo;

  Set<int> _ids = <int>{};

  bool isFav(int productId) => _ids.contains(productId);

  Future<void> _onLoad(Emitter<WishlistState> emit) async {
    emit(WishlistState.loading(ids: _ids));
    try {
      _ids = await _repo.fetchMyWishlistProductIds();
      emit(WishlistState.ready(ids: _ids));
    } catch (e) {
      emit(WishlistState.failure(message: e.toString(), ids: _ids));
    }
  }

  Future<void> _onRefresh(Emitter<WishlistState> emit) async {
    emit(WishlistState.loading(silent: true, ids: _ids));
    try {
      _ids = await _repo.fetchMyWishlistProductIds();
      emit(WishlistState.ready(ids: _ids));
    } catch (e) {
      emit(WishlistState.failure(message: e.toString(), ids: _ids));
    }
  }

  Future<void> _onToggle(Emitter<WishlistState> emit, int productId) async {
    final prev = _ids;
    final next = {..._ids};

    final wasFav = next.contains(productId);
    if (wasFav) {
      next.remove(productId);
    } else {
      next.add(productId);
    }

    _ids = next;
    emit(WishlistState.ready(ids: _ids));

    try {
      final added = await _repo.toggle(productId);

      final shouldBeFav = added;
      final isFavNow = _ids.contains(productId);

      if (shouldBeFav != isFavNow) {
        final corrected = {..._ids};
        if (shouldBeFav) {
          corrected.add(productId);
        } else {
          corrected.remove(productId);
        }
        _ids = corrected;
        emit(WishlistState.ready(ids: _ids));
      }
    } catch (e) {
      _ids = prev;
      emit(WishlistState.failure(message: e.toString(), ids: _ids));
      emit(WishlistState.ready(ids: _ids));
    }
  }
}

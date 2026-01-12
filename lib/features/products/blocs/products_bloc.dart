import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/products_repository.dart';
import '../models/products.dart';
import '../models/products_filter.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this.productsRepository) : super(const ProductsState.initial()) {
    on<ProductsEvent>((event, emit) async {
      await event.when(
        fetchFirst:
            (pageSize, sort, search, filter) => _onFetchFirst(
              emit,
              pageSize: pageSize,
              sort: sort,
              search: search,
              filter: filter,
            ),
        loadMore: () => _onLoadMore(emit),
        refresh: () => _onRefresh(emit),
      );
    });
  }

  final ProductRepository productsRepository;

  final List<Products> _cache = [];
  int _page = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  int _lastPageSize = 25;
  String? _lastSort;
  String? _lastSearch;
  ProductsFilter? _lastFilter;

  Future<void> _onFetchFirst(
    Emitter<ProductsState> emit, {
    required int pageSize,
    String? sort,
    String? search,
    ProductsFilter? filter,
  }) async {
    _lastPageSize = pageSize;
    _lastSort = sort;
    _lastSearch = search;
    _lastFilter = filter;

    emit(const ProductsState.loading());

    try {
      final result = await productsRepository.fetchAll(
        page: 1,
        pageSize: pageSize,
        withTotal: false,
        sort: sort,
        search: search,
        filter: filter,
      );

      _cache
        ..clear()
        ..addAll(result);

      _page = 1;
      _hasMore = result.length == pageSize;

      emit(ProductsState.success(products: List.unmodifiable(_cache)));
    } catch (e) {
      emit(ProductsState.failure(message: e.toString()));
    }
  }

  Future<void> _onLoadMore(Emitter<ProductsState> emit) async {
    if (!_hasMore || _isLoadingMore) return;
    _isLoadingMore = true;

    emit(ProductsState.loadingMore(products: List.unmodifiable(_cache)));

    try {
      final nextPage = _page + 1;

      final result = await productsRepository.fetchAll(
        page: nextPage,
        pageSize: _lastPageSize,
        sort: _lastSort,
        withTotal: false,
        search: _lastSearch,
        filter: _lastFilter,
      );

      _cache.addAll(result);
      _page = nextPage;
      _hasMore = result.length == _lastPageSize;

      emit(ProductsState.success(products: List.unmodifiable(_cache)));
    } catch (e) {
      emit(ProductsState.failure(message: e.toString()));
    } finally {
      _isLoadingMore = false;
    }
  }

  Future<void> _onRefresh(Emitter<ProductsState> emit) async {
    emit(const ProductsState.loading(silent: true));
    try {
      final result = await productsRepository.fetchAll(
        page: 1,
        pageSize: _lastPageSize,
        withTotal: false,
        sort: _lastSort,
        search: _lastSearch,
        filter: _lastFilter,
      );

      _cache
        ..clear()
        ..addAll(result);

      _page = 1;
      _hasMore = result.length == _lastPageSize;

      emit(ProductsState.success(products: List.unmodifiable(_cache)));
    } catch (e) {
      emit(ProductsState.failure(message: e.toString()));
    }
  }
}

import 'package:flutter_base_architecture/features/products/blocs/products_event.dart';
import 'package:flutter_base_architecture/features/products/blocs/products_state.dart';
import 'package:flutter_base_architecture/features/products/data/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/products.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this.productsRepository) : super(const ProductsState.initial()) {
    on<ProductsEvent>((event, emit) async {
      await event.when(
        fetchFirst:
            (pageSize, sort, categoryId, search) => _onFetchFirst(
              emit,
              pageSize: pageSize,
              sort: sort,
              categoryId: categoryId,
              search: search,
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
  int? _lastCategoryId;
  String? _lastSearch;

  Future<void> _onFetchFirst(
    Emitter<ProductsState> emit, {
    required int pageSize,
    String? sort,
    int? categoryId,
    String? search,
  }) async {
    _lastPageSize = pageSize;
    _lastSort = sort;
    _lastCategoryId = categoryId;
    _lastSearch = search;

    emit(const ProductsState.loading());

    try {
      final result = await productsRepository.fetchAll(
        page: 1,
        pageSize: pageSize,
        withTotal: false,
        sort: sort,
        categoryId: categoryId,
        search: search,
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
        categoryId: _lastCategoryId,
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
        categoryId: _lastCategoryId,
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

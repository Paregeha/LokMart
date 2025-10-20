import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/category_repository.dart';
import '../models/category.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this._repo) : super(const CategoryInitial()) {
    on<CategoryFetchRequested>(_onFetch);
    on<CategoryRefreshed>(_onRefresh);
  }

  final CategoryRepository _repo;
  List<Category> _cache = const [];

  Future<void> _onFetch(
    CategoryFetchRequested event,
    Emitter<CategoryState> emit,
  ) async {
    if (_cache.isNotEmpty && !event.forceRefresh) {
      emit(CategorySuccess(_cache));
      emit(const CategoryLoading(silent: true));
    } else {
      emit(const CategoryLoading());
    }

    try {
      final items = await _repo.fetchCategoriesWithCounts();
      _cache = items;
      emit(CategorySuccess(items));
    } catch (e) {
      if (_cache.isNotEmpty) {
        emit(CategorySuccess(_cache));
      } else {
        emit(CategoryFailure(e.toString()));
      }
    }
  }

  Future<void> _onRefresh(
    CategoryRefreshed event,
    Emitter<CategoryState> emit,
  ) async {
    add(CategoryFetchRequested(forceRefresh: true));
  }
}

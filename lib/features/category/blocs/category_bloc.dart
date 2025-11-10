import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/category_repository.dart';
import '../models/category.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this._repo) : super(const CategoryState.initial()) {
    on<CategoryEvent>((event, emit) async {
      await event.when(
        fetch: (forceRefresh) => _onFetch(forceRefresh, emit),
        refresh: () async => add(const CategoryEvent.fetch(forceRefresh: true)),
      );
    });
  }

  final CategoryRepository _repo;
  List<Category> _cache = const [];

  Future<void> _onFetch(bool forceRefresh, Emitter<CategoryState> emit) async {
    if (_cache.isNotEmpty && !forceRefresh) {
      emit(CategoryState.success(items: _cache));
      emit(const CategoryState.loading(silent: true));
    } else {
      emit(const CategoryState.loading());
    }

    try {
      final items = await _repo.fetchCategoriesWithCounts();
      _cache = items;
      emit(CategoryState.success(items: items));
    } catch (e) {
      if (_cache.isNotEmpty) {
        emit(CategoryState.success(items: _cache));
      } else {
        emit(CategoryState.failure(message: e.toString()));
      }
    }
  }
}

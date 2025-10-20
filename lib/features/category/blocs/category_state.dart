import '../models/category.dart';

sealed class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoading extends CategoryState {
  const CategoryLoading({this.silent = false});
  final bool silent;
}

class CategorySuccess extends CategoryState {
  const CategorySuccess(this.items);
  final List<Category> items;
}

class CategoryFailure extends CategoryState {
  const CategoryFailure(this.message);
  final String message;
}

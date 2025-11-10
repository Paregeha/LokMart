import 'package:freezed_annotation/freezed_annotation.dart';
import '../../category/models/category.dart';

part 'category_state.freezed.dart';

@freezed
sealed class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loading({@Default(false) bool silent}) = _Loading;
  const factory CategoryState.success({required List<Category> items}) =
      _Success;
  const factory CategoryState.failure({required String message}) = _Failure;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProductsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )
    fetchFirst,
    required TResult Function() loadMore,
    required TResult Function() refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )?
    fetchFirst,
    TResult? Function()? loadMore,
    TResult? Function()? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )?
    fetchFirst,
    TResult Function()? loadMore,
    TResult Function()? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFirst value) fetchFirst,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_Refresh value) refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFirst value)? fetchFirst,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_Refresh value)? refresh,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFirst value)? fetchFirst,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsEventCopyWith<$Res> {
  factory $ProductsEventCopyWith(
    ProductsEvent value,
    $Res Function(ProductsEvent) then,
  ) = _$ProductsEventCopyWithImpl<$Res, ProductsEvent>;
}

/// @nodoc
class _$ProductsEventCopyWithImpl<$Res, $Val extends ProductsEvent>
    implements $ProductsEventCopyWith<$Res> {
  _$ProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchFirstImplCopyWith<$Res> {
  factory _$$FetchFirstImplCopyWith(
    _$FetchFirstImpl value,
    $Res Function(_$FetchFirstImpl) then,
  ) = __$$FetchFirstImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int pageSize, String? sort, int? categoryId, String? search});
}

/// @nodoc
class __$$FetchFirstImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$FetchFirstImpl>
    implements _$$FetchFirstImplCopyWith<$Res> {
  __$$FetchFirstImplCopyWithImpl(
    _$FetchFirstImpl _value,
    $Res Function(_$FetchFirstImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? sort = freezed,
    Object? categoryId = freezed,
    Object? search = freezed,
  }) {
    return _then(
      _$FetchFirstImpl(
        pageSize:
            null == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                    as int,
        sort:
            freezed == sort
                ? _value.sort
                : sort // ignore: cast_nullable_to_non_nullable
                    as String?,
        categoryId:
            freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                    as int?,
        search:
            freezed == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$FetchFirstImpl implements _FetchFirst {
  const _$FetchFirstImpl({
    this.pageSize = 25,
    this.sort,
    this.categoryId,
    this.search,
  });

  @override
  @JsonKey()
  final int pageSize;
  @override
  final String? sort;
  @override
  final int? categoryId;
  @override
  final String? search;

  @override
  String toString() {
    return 'ProductsEvent.fetchFirst(pageSize: $pageSize, sort: $sort, categoryId: $categoryId, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFirstImpl &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pageSize, sort, categoryId, search);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchFirstImplCopyWith<_$FetchFirstImpl> get copyWith =>
      __$$FetchFirstImplCopyWithImpl<_$FetchFirstImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )
    fetchFirst,
    required TResult Function() loadMore,
    required TResult Function() refresh,
  }) {
    return fetchFirst(pageSize, sort, categoryId, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )?
    fetchFirst,
    TResult? Function()? loadMore,
    TResult? Function()? refresh,
  }) {
    return fetchFirst?.call(pageSize, sort, categoryId, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )?
    fetchFirst,
    TResult Function()? loadMore,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (fetchFirst != null) {
      return fetchFirst(pageSize, sort, categoryId, search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFirst value) fetchFirst,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_Refresh value) refresh,
  }) {
    return fetchFirst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFirst value)? fetchFirst,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return fetchFirst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFirst value)? fetchFirst,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (fetchFirst != null) {
      return fetchFirst(this);
    }
    return orElse();
  }
}

abstract class _FetchFirst implements ProductsEvent {
  const factory _FetchFirst({
    final int pageSize,
    final String? sort,
    final int? categoryId,
    final String? search,
  }) = _$FetchFirstImpl;

  int get pageSize;
  String? get sort;
  int? get categoryId;
  String? get search;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchFirstImplCopyWith<_$FetchFirstImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
    _$LoadMoreImpl value,
    $Res Function(_$LoadMoreImpl) then,
  ) = __$$LoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
    _$LoadMoreImpl _value,
    $Res Function(_$LoadMoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl();

  @override
  String toString() {
    return 'ProductsEvent.loadMore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )
    fetchFirst,
    required TResult Function() loadMore,
    required TResult Function() refresh,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )?
    fetchFirst,
    TResult? Function()? loadMore,
    TResult? Function()? refresh,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )?
    fetchFirst,
    TResult Function()? loadMore,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFirst value) fetchFirst,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_Refresh value) refresh,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFirst value)? fetchFirst,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFirst value)? fetchFirst,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements ProductsEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
    _$RefreshImpl value,
    $Res Function(_$RefreshImpl) then,
  ) = __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
    _$RefreshImpl _value,
    $Res Function(_$RefreshImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'ProductsEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )
    fetchFirst,
    required TResult Function() loadMore,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )?
    fetchFirst,
    TResult? Function()? loadMore,
    TResult? Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int pageSize,
      String? sort,
      int? categoryId,
      String? search,
    )?
    fetchFirst,
    TResult Function()? loadMore,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFirst value) fetchFirst,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFirst value)? fetchFirst,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFirst value)? fetchFirst,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements ProductsEvent {
  const factory _Refresh() = _$RefreshImpl;
}

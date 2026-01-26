// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int productId, int count) add,
    required TResult Function(CartItem item) inc,
    required TResult Function(CartItem item) dec,
    required TResult Function(String cartItemDocumentId) remove,
    required TResult Function() clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int productId, int count)? add,
    TResult? Function(CartItem item)? inc,
    TResult? Function(CartItem item)? dec,
    TResult? Function(String cartItemDocumentId)? remove,
    TResult? Function()? clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int productId, int count)? add,
    TResult Function(CartItem item)? inc,
    TResult Function(CartItem item)? dec,
    TResult Function(String cartItemDocumentId)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Inc value) inc,
    required TResult Function(_Dec value) dec,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Inc value)? inc,
    TResult? Function(_Dec value)? dec,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Inc value)? inc,
    TResult Function(_Dec value)? dec,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
    _$LoadImpl value,
    $Res Function(_$LoadImpl) then,
  ) = __$$LoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
    : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl();

  @override
  String toString() {
    return 'CartEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int productId, int count) add,
    required TResult Function(CartItem item) inc,
    required TResult Function(CartItem item) dec,
    required TResult Function(String cartItemDocumentId) remove,
    required TResult Function() clear,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int productId, int count)? add,
    TResult? Function(CartItem item)? inc,
    TResult? Function(CartItem item)? dec,
    TResult? Function(String cartItemDocumentId)? remove,
    TResult? Function()? clear,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int productId, int count)? add,
    TResult Function(CartItem item)? inc,
    TResult Function(CartItem item)? dec,
    TResult Function(String cartItemDocumentId)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Inc value) inc,
    required TResult Function(_Dec value) dec,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Inc value)? inc,
    TResult? Function(_Dec value)? dec,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Inc value)? inc,
    TResult Function(_Dec value)? dec,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements CartEvent {
  const factory _Load() = _$LoadImpl;
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId, int count});
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
    : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? productId = null, Object? count = null}) {
    return _then(
      _$AddImpl(
        productId:
            null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as int,
        count:
            null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$AddImpl implements _Add {
  const _$AddImpl({required this.productId, this.count = 1});

  @override
  final int productId;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'CartEvent.add(productId: $productId, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId, count);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int productId, int count) add,
    required TResult Function(CartItem item) inc,
    required TResult Function(CartItem item) dec,
    required TResult Function(String cartItemDocumentId) remove,
    required TResult Function() clear,
  }) {
    return add(productId, count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int productId, int count)? add,
    TResult? Function(CartItem item)? inc,
    TResult? Function(CartItem item)? dec,
    TResult? Function(String cartItemDocumentId)? remove,
    TResult? Function()? clear,
  }) {
    return add?.call(productId, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int productId, int count)? add,
    TResult Function(CartItem item)? inc,
    TResult Function(CartItem item)? dec,
    TResult Function(String cartItemDocumentId)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(productId, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Inc value) inc,
    required TResult Function(_Dec value) dec,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Inc value)? inc,
    TResult? Function(_Dec value)? dec,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Inc value)? inc,
    TResult Function(_Dec value)? dec,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements CartEvent {
  const factory _Add({required final int productId, final int count}) =
      _$AddImpl;

  int get productId;
  int get count;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncImplCopyWith<$Res> {
  factory _$$IncImplCopyWith(_$IncImpl value, $Res Function(_$IncImpl) then) =
      __$$IncImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItem item});
}

/// @nodoc
class __$$IncImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$IncImpl>
    implements _$$IncImplCopyWith<$Res> {
  __$$IncImplCopyWithImpl(_$IncImpl _value, $Res Function(_$IncImpl) _then)
    : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = null}) {
    return _then(
      _$IncImpl(
        item:
            null == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                    as CartItem,
      ),
    );
  }
}

/// @nodoc

class _$IncImpl implements _Inc {
  const _$IncImpl({required this.item});

  @override
  final CartItem item;

  @override
  String toString() {
    return 'CartEvent.inc(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncImplCopyWith<_$IncImpl> get copyWith =>
      __$$IncImplCopyWithImpl<_$IncImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int productId, int count) add,
    required TResult Function(CartItem item) inc,
    required TResult Function(CartItem item) dec,
    required TResult Function(String cartItemDocumentId) remove,
    required TResult Function() clear,
  }) {
    return inc(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int productId, int count)? add,
    TResult? Function(CartItem item)? inc,
    TResult? Function(CartItem item)? dec,
    TResult? Function(String cartItemDocumentId)? remove,
    TResult? Function()? clear,
  }) {
    return inc?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int productId, int count)? add,
    TResult Function(CartItem item)? inc,
    TResult Function(CartItem item)? dec,
    TResult Function(String cartItemDocumentId)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (inc != null) {
      return inc(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Inc value) inc,
    required TResult Function(_Dec value) dec,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) {
    return inc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Inc value)? inc,
    TResult? Function(_Dec value)? dec,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) {
    return inc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Inc value)? inc,
    TResult Function(_Dec value)? dec,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (inc != null) {
      return inc(this);
    }
    return orElse();
  }
}

abstract class _Inc implements CartEvent {
  const factory _Inc({required final CartItem item}) = _$IncImpl;

  CartItem get item;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncImplCopyWith<_$IncImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecImplCopyWith<$Res> {
  factory _$$DecImplCopyWith(_$DecImpl value, $Res Function(_$DecImpl) then) =
      __$$DecImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CartItem item});
}

/// @nodoc
class __$$DecImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$DecImpl>
    implements _$$DecImplCopyWith<$Res> {
  __$$DecImplCopyWithImpl(_$DecImpl _value, $Res Function(_$DecImpl) _then)
    : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = null}) {
    return _then(
      _$DecImpl(
        item:
            null == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                    as CartItem,
      ),
    );
  }
}

/// @nodoc

class _$DecImpl implements _Dec {
  const _$DecImpl({required this.item});

  @override
  final CartItem item;

  @override
  String toString() {
    return 'CartEvent.dec(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DecImplCopyWith<_$DecImpl> get copyWith =>
      __$$DecImplCopyWithImpl<_$DecImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int productId, int count) add,
    required TResult Function(CartItem item) inc,
    required TResult Function(CartItem item) dec,
    required TResult Function(String cartItemDocumentId) remove,
    required TResult Function() clear,
  }) {
    return dec(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int productId, int count)? add,
    TResult? Function(CartItem item)? inc,
    TResult? Function(CartItem item)? dec,
    TResult? Function(String cartItemDocumentId)? remove,
    TResult? Function()? clear,
  }) {
    return dec?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int productId, int count)? add,
    TResult Function(CartItem item)? inc,
    TResult Function(CartItem item)? dec,
    TResult Function(String cartItemDocumentId)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (dec != null) {
      return dec(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Inc value) inc,
    required TResult Function(_Dec value) dec,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) {
    return dec(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Inc value)? inc,
    TResult? Function(_Dec value)? dec,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) {
    return dec?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Inc value)? inc,
    TResult Function(_Dec value)? dec,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (dec != null) {
      return dec(this);
    }
    return orElse();
  }
}

abstract class _Dec implements CartEvent {
  const factory _Dec({required final CartItem item}) = _$DecImpl;

  CartItem get item;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DecImplCopyWith<_$DecImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
    _$RemoveImpl value,
    $Res Function(_$RemoveImpl) then,
  ) = __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cartItemDocumentId});
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
    _$RemoveImpl _value,
    $Res Function(_$RemoveImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cartItemDocumentId = null}) {
    return _then(
      _$RemoveImpl(
        cartItemDocumentId:
            null == cartItemDocumentId
                ? _value.cartItemDocumentId
                : cartItemDocumentId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$RemoveImpl implements _Remove {
  const _$RemoveImpl({required this.cartItemDocumentId});

  @override
  final String cartItemDocumentId;

  @override
  String toString() {
    return 'CartEvent.remove(cartItemDocumentId: $cartItemDocumentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.cartItemDocumentId, cartItemDocumentId) ||
                other.cartItemDocumentId == cartItemDocumentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItemDocumentId);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int productId, int count) add,
    required TResult Function(CartItem item) inc,
    required TResult Function(CartItem item) dec,
    required TResult Function(String cartItemDocumentId) remove,
    required TResult Function() clear,
  }) {
    return remove(cartItemDocumentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int productId, int count)? add,
    TResult? Function(CartItem item)? inc,
    TResult? Function(CartItem item)? dec,
    TResult? Function(String cartItemDocumentId)? remove,
    TResult? Function()? clear,
  }) {
    return remove?.call(cartItemDocumentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int productId, int count)? add,
    TResult Function(CartItem item)? inc,
    TResult Function(CartItem item)? dec,
    TResult Function(String cartItemDocumentId)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(cartItemDocumentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Inc value) inc,
    required TResult Function(_Dec value) dec,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Inc value)? inc,
    TResult? Function(_Dec value)? dec,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Inc value)? inc,
    TResult Function(_Dec value)? dec,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements CartEvent {
  const factory _Remove({required final String cartItemDocumentId}) =
      _$RemoveImpl;

  String get cartItemDocumentId;

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
    _$ClearImpl value,
    $Res Function(_$ClearImpl) then,
  ) = __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
    _$ClearImpl _value,
    $Res Function(_$ClearImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'CartEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(int productId, int count) add,
    required TResult Function(CartItem item) inc,
    required TResult Function(CartItem item) dec,
    required TResult Function(String cartItemDocumentId) remove,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(int productId, int count)? add,
    TResult? Function(CartItem item)? inc,
    TResult? Function(CartItem item)? dec,
    TResult? Function(String cartItemDocumentId)? remove,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(int productId, int count)? add,
    TResult Function(CartItem item)? inc,
    TResult Function(CartItem item)? dec,
    TResult Function(String cartItemDocumentId)? remove,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_Add value) add,
    required TResult Function(_Inc value) inc,
    required TResult Function(_Dec value) dec,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Clear value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_Add value)? add,
    TResult? Function(_Inc value)? inc,
    TResult? Function(_Dec value)? dec,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Clear value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_Add value)? add,
    TResult Function(_Inc value)? inc,
    TResult Function(_Dec value)? dec,
    TResult Function(_Remove value)? remove,
    TResult Function(_Clear value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements CartEvent {
  const factory _Clear() = _$ClearImpl;
}

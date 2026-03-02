// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrdersEvent {
  String? get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) fetch,
    required TResult Function(String? status) changeFilter,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? fetch,
    TResult? Function(String? status)? changeFilter,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? fetch,
    TResult Function(String? status)? changeFilter,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ChangeFilter value) changeFilter,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ChangeFilter value)? changeFilter,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_ChangeFilter value)? changeFilter,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersEventCopyWith<OrdersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersEventCopyWith<$Res> {
  factory $OrdersEventCopyWith(
    OrdersEvent value,
    $Res Function(OrdersEvent) then,
  ) = _$OrdersEventCopyWithImpl<$Res, OrdersEvent>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class _$OrdersEventCopyWithImpl<$Res, $Val extends OrdersEvent>
    implements $OrdersEventCopyWith<$Res> {
  _$OrdersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed}) {
    return _then(
      _value.copyWith(
            status:
                freezed == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $OrdersEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
    _$FetchImpl value,
    $Res Function(_$FetchImpl) then,
  ) = __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
    _$FetchImpl _value,
    $Res Function(_$FetchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed}) {
    return _then(
      _$FetchImpl(
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({this.status});

  @override
  final String? status;

  @override
  String toString() {
    return 'OrdersEvent.fetch(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) fetch,
    required TResult Function(String? status) changeFilter,
  }) {
    return fetch(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? fetch,
    TResult? Function(String? status)? changeFilter,
  }) {
    return fetch?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? fetch,
    TResult Function(String? status)? changeFilter,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ChangeFilter value) changeFilter,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ChangeFilter value)? changeFilter,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_ChangeFilter value)? changeFilter,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements OrdersEvent {
  const factory _Fetch({final String? status}) = _$FetchImpl;

  @override
  String? get status;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeFilterImplCopyWith<$Res>
    implements $OrdersEventCopyWith<$Res> {
  factory _$$ChangeFilterImplCopyWith(
    _$ChangeFilterImpl value,
    $Res Function(_$ChangeFilterImpl) then,
  ) = __$$ChangeFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$ChangeFilterImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$ChangeFilterImpl>
    implements _$$ChangeFilterImplCopyWith<$Res> {
  __$$ChangeFilterImplCopyWithImpl(
    _$ChangeFilterImpl _value,
    $Res Function(_$ChangeFilterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed}) {
    return _then(
      _$ChangeFilterImpl(
        status:
            freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$ChangeFilterImpl implements _ChangeFilter {
  const _$ChangeFilterImpl({this.status});

  @override
  final String? status;

  @override
  String toString() {
    return 'OrdersEvent.changeFilter(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeFilterImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeFilterImplCopyWith<_$ChangeFilterImpl> get copyWith =>
      __$$ChangeFilterImplCopyWithImpl<_$ChangeFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? status) fetch,
    required TResult Function(String? status) changeFilter,
  }) {
    return changeFilter(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? status)? fetch,
    TResult? Function(String? status)? changeFilter,
  }) {
    return changeFilter?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? status)? fetch,
    TResult Function(String? status)? changeFilter,
    required TResult orElse(),
  }) {
    if (changeFilter != null) {
      return changeFilter(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_ChangeFilter value) changeFilter,
  }) {
    return changeFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_ChangeFilter value)? changeFilter,
  }) {
    return changeFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_ChangeFilter value)? changeFilter,
    required TResult orElse(),
  }) {
    if (changeFilter != null) {
      return changeFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeFilter implements OrdersEvent {
  const factory _ChangeFilter({final String? status}) = _$ChangeFilterImpl;

  @override
  String? get status;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeFilterImplCopyWith<_$ChangeFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

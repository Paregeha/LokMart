// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_methods_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaymentMethodsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int id) select,
    required TResult Function(String documentId) setDefault,
    required TResult Function(String documentId) delete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int id)? select,
    TResult? Function(String documentId)? setDefault,
    TResult? Function(String documentId)? delete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int id)? select,
    TResult Function(String documentId)? setDefault,
    TResult Function(String documentId)? delete,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Select value) select,
    required TResult Function(_SetDefault value) setDefault,
    required TResult Function(_Delete value) delete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Select value)? select,
    TResult? Function(_SetDefault value)? setDefault,
    TResult? Function(_Delete value)? delete,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Select value)? select,
    TResult Function(_SetDefault value)? setDefault,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsEventCopyWith<$Res> {
  factory $PaymentMethodsEventCopyWith(
    PaymentMethodsEvent value,
    $Res Function(PaymentMethodsEvent) then,
  ) = _$PaymentMethodsEventCopyWithImpl<$Res, PaymentMethodsEvent>;
}

/// @nodoc
class _$PaymentMethodsEventCopyWithImpl<$Res, $Val extends PaymentMethodsEvent>
    implements $PaymentMethodsEventCopyWith<$Res> {
  _$PaymentMethodsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
    _$FetchImpl value,
    $Res Function(_$FetchImpl) then,
  ) = __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
    _$FetchImpl _value,
    $Res Function(_$FetchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl();

  @override
  String toString() {
    return 'PaymentMethodsEvent.fetch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int id) select,
    required TResult Function(String documentId) setDefault,
    required TResult Function(String documentId) delete,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int id)? select,
    TResult? Function(String documentId)? setDefault,
    TResult? Function(String documentId)? delete,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int id)? select,
    TResult Function(String documentId)? setDefault,
    TResult Function(String documentId)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Select value) select,
    required TResult Function(_SetDefault value) setDefault,
    required TResult Function(_Delete value) delete,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Select value)? select,
    TResult? Function(_SetDefault value)? setDefault,
    TResult? Function(_Delete value)? delete,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Select value)? select,
    TResult Function(_SetDefault value)? setDefault,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PaymentMethodsEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$SelectImplCopyWith<$Res> {
  factory _$$SelectImplCopyWith(
    _$SelectImpl value,
    $Res Function(_$SelectImpl) then,
  ) = __$$SelectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$SelectImplCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res, _$SelectImpl>
    implements _$$SelectImplCopyWith<$Res> {
  __$$SelectImplCopyWithImpl(
    _$SelectImpl _value,
    $Res Function(_$SelectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$SelectImpl(
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$SelectImpl implements _Select {
  const _$SelectImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'PaymentMethodsEvent.select(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectImplCopyWith<_$SelectImpl> get copyWith =>
      __$$SelectImplCopyWithImpl<_$SelectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int id) select,
    required TResult Function(String documentId) setDefault,
    required TResult Function(String documentId) delete,
  }) {
    return select(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int id)? select,
    TResult? Function(String documentId)? setDefault,
    TResult? Function(String documentId)? delete,
  }) {
    return select?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int id)? select,
    TResult Function(String documentId)? setDefault,
    TResult Function(String documentId)? delete,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Select value) select,
    required TResult Function(_SetDefault value) setDefault,
    required TResult Function(_Delete value) delete,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Select value)? select,
    TResult? Function(_SetDefault value)? setDefault,
    TResult? Function(_Delete value)? delete,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Select value)? select,
    TResult Function(_SetDefault value)? setDefault,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class _Select implements PaymentMethodsEvent {
  const factory _Select(final int id) = _$SelectImpl;

  int get id;

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectImplCopyWith<_$SelectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetDefaultImplCopyWith<$Res> {
  factory _$$SetDefaultImplCopyWith(
    _$SetDefaultImpl value,
    $Res Function(_$SetDefaultImpl) then,
  ) = __$$SetDefaultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String documentId});
}

/// @nodoc
class __$$SetDefaultImplCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res, _$SetDefaultImpl>
    implements _$$SetDefaultImplCopyWith<$Res> {
  __$$SetDefaultImplCopyWithImpl(
    _$SetDefaultImpl _value,
    $Res Function(_$SetDefaultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? documentId = null}) {
    return _then(
      _$SetDefaultImpl(
        null == documentId
            ? _value.documentId
            : documentId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SetDefaultImpl implements _SetDefault {
  const _$SetDefaultImpl(this.documentId);

  @override
  final String documentId;

  @override
  String toString() {
    return 'PaymentMethodsEvent.setDefault(documentId: $documentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDefaultImpl &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentId);

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDefaultImplCopyWith<_$SetDefaultImpl> get copyWith =>
      __$$SetDefaultImplCopyWithImpl<_$SetDefaultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int id) select,
    required TResult Function(String documentId) setDefault,
    required TResult Function(String documentId) delete,
  }) {
    return setDefault(documentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int id)? select,
    TResult? Function(String documentId)? setDefault,
    TResult? Function(String documentId)? delete,
  }) {
    return setDefault?.call(documentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int id)? select,
    TResult Function(String documentId)? setDefault,
    TResult Function(String documentId)? delete,
    required TResult orElse(),
  }) {
    if (setDefault != null) {
      return setDefault(documentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Select value) select,
    required TResult Function(_SetDefault value) setDefault,
    required TResult Function(_Delete value) delete,
  }) {
    return setDefault(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Select value)? select,
    TResult? Function(_SetDefault value)? setDefault,
    TResult? Function(_Delete value)? delete,
  }) {
    return setDefault?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Select value)? select,
    TResult Function(_SetDefault value)? setDefault,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (setDefault != null) {
      return setDefault(this);
    }
    return orElse();
  }
}

abstract class _SetDefault implements PaymentMethodsEvent {
  const factory _SetDefault(final String documentId) = _$SetDefaultImpl;

  String get documentId;

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetDefaultImplCopyWith<_$SetDefaultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
    _$DeleteImpl value,
    $Res Function(_$DeleteImpl) then,
  ) = __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String documentId});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$PaymentMethodsEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
    _$DeleteImpl _value,
    $Res Function(_$DeleteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? documentId = null}) {
    return _then(
      _$DeleteImpl(
        null == documentId
            ? _value.documentId
            : documentId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.documentId);

  @override
  final String documentId;

  @override
  String toString() {
    return 'PaymentMethodsEvent.delete(documentId: $documentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentId);

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(int id) select,
    required TResult Function(String documentId) setDefault,
    required TResult Function(String documentId) delete,
  }) {
    return delete(documentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(int id)? select,
    TResult? Function(String documentId)? setDefault,
    TResult? Function(String documentId)? delete,
  }) {
    return delete?.call(documentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(int id)? select,
    TResult Function(String documentId)? setDefault,
    TResult Function(String documentId)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(documentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Select value) select,
    required TResult Function(_SetDefault value) setDefault,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Select value)? select,
    TResult? Function(_SetDefault value)? setDefault,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Select value)? select,
    TResult Function(_SetDefault value)? setDefault,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements PaymentMethodsEvent {
  const factory _Delete(final String documentId) = _$DeleteImpl;

  String get documentId;

  /// Create a copy of PaymentMethodsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

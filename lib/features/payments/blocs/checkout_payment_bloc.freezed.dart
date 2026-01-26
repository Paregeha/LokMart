// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckoutPaymentEvent {
  SavedCard get selectedCard => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String get addressDocumentId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      SavedCard selectedCard,
      int amount,
      String currency,
      String? orderId,
      String addressDocumentId,
    )
    pay,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      SavedCard selectedCard,
      int amount,
      String currency,
      String? orderId,
      String addressDocumentId,
    )?
    pay,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      SavedCard selectedCard,
      int amount,
      String currency,
      String? orderId,
      String addressDocumentId,
    )?
    pay,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pay value) pay,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pay value)? pay,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pay value)? pay,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutPaymentEventCopyWith<CheckoutPaymentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutPaymentEventCopyWith<$Res> {
  factory $CheckoutPaymentEventCopyWith(
    CheckoutPaymentEvent value,
    $Res Function(CheckoutPaymentEvent) then,
  ) = _$CheckoutPaymentEventCopyWithImpl<$Res, CheckoutPaymentEvent>;
  @useResult
  $Res call({
    SavedCard selectedCard,
    int amount,
    String currency,
    String? orderId,
    String addressDocumentId,
  });

  $SavedCardCopyWith<$Res> get selectedCard;
}

/// @nodoc
class _$CheckoutPaymentEventCopyWithImpl<
  $Res,
  $Val extends CheckoutPaymentEvent
>
    implements $CheckoutPaymentEventCopyWith<$Res> {
  _$CheckoutPaymentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCard = null,
    Object? amount = null,
    Object? currency = null,
    Object? orderId = freezed,
    Object? addressDocumentId = null,
  }) {
    return _then(
      _value.copyWith(
            selectedCard:
                null == selectedCard
                    ? _value.selectedCard
                    : selectedCard // ignore: cast_nullable_to_non_nullable
                        as SavedCard,
            amount:
                null == amount
                    ? _value.amount
                    : amount // ignore: cast_nullable_to_non_nullable
                        as int,
            currency:
                null == currency
                    ? _value.currency
                    : currency // ignore: cast_nullable_to_non_nullable
                        as String,
            orderId:
                freezed == orderId
                    ? _value.orderId
                    : orderId // ignore: cast_nullable_to_non_nullable
                        as String?,
            addressDocumentId:
                null == addressDocumentId
                    ? _value.addressDocumentId
                    : addressDocumentId // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckoutPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SavedCardCopyWith<$Res> get selectedCard {
    return $SavedCardCopyWith<$Res>(_value.selectedCard, (value) {
      return _then(_value.copyWith(selectedCard: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PayImplCopyWith<$Res>
    implements $CheckoutPaymentEventCopyWith<$Res> {
  factory _$$PayImplCopyWith(_$PayImpl value, $Res Function(_$PayImpl) then) =
      __$$PayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SavedCard selectedCard,
    int amount,
    String currency,
    String? orderId,
    String addressDocumentId,
  });

  @override
  $SavedCardCopyWith<$Res> get selectedCard;
}

/// @nodoc
class __$$PayImplCopyWithImpl<$Res>
    extends _$CheckoutPaymentEventCopyWithImpl<$Res, _$PayImpl>
    implements _$$PayImplCopyWith<$Res> {
  __$$PayImplCopyWithImpl(_$PayImpl _value, $Res Function(_$PayImpl) _then)
    : super(_value, _then);

  /// Create a copy of CheckoutPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCard = null,
    Object? amount = null,
    Object? currency = null,
    Object? orderId = freezed,
    Object? addressDocumentId = null,
  }) {
    return _then(
      _$PayImpl(
        selectedCard:
            null == selectedCard
                ? _value.selectedCard
                : selectedCard // ignore: cast_nullable_to_non_nullable
                    as SavedCard,
        amount:
            null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                    as int,
        currency:
            null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                    as String,
        orderId:
            freezed == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                    as String?,
        addressDocumentId:
            null == addressDocumentId
                ? _value.addressDocumentId
                : addressDocumentId // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$PayImpl implements _Pay {
  const _$PayImpl({
    required this.selectedCard,
    required this.amount,
    this.currency = 'usd',
    this.orderId,
    required this.addressDocumentId,
  });

  @override
  final SavedCard selectedCard;
  @override
  final int amount;
  @override
  @JsonKey()
  final String currency;
  @override
  final String? orderId;
  @override
  final String addressDocumentId;

  @override
  String toString() {
    return 'CheckoutPaymentEvent.pay(selectedCard: $selectedCard, amount: $amount, currency: $currency, orderId: $orderId, addressDocumentId: $addressDocumentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayImpl &&
            (identical(other.selectedCard, selectedCard) ||
                other.selectedCard == selectedCard) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.addressDocumentId, addressDocumentId) ||
                other.addressDocumentId == addressDocumentId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    selectedCard,
    amount,
    currency,
    orderId,
    addressDocumentId,
  );

  /// Create a copy of CheckoutPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayImplCopyWith<_$PayImpl> get copyWith =>
      __$$PayImplCopyWithImpl<_$PayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      SavedCard selectedCard,
      int amount,
      String currency,
      String? orderId,
      String addressDocumentId,
    )
    pay,
  }) {
    return pay(selectedCard, amount, currency, orderId, addressDocumentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      SavedCard selectedCard,
      int amount,
      String currency,
      String? orderId,
      String addressDocumentId,
    )?
    pay,
  }) {
    return pay?.call(
      selectedCard,
      amount,
      currency,
      orderId,
      addressDocumentId,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      SavedCard selectedCard,
      int amount,
      String currency,
      String? orderId,
      String addressDocumentId,
    )?
    pay,
    required TResult orElse(),
  }) {
    if (pay != null) {
      return pay(selectedCard, amount, currency, orderId, addressDocumentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pay value) pay,
  }) {
    return pay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pay value)? pay,
  }) {
    return pay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pay value)? pay,
    required TResult orElse(),
  }) {
    if (pay != null) {
      return pay(this);
    }
    return orElse();
  }
}

abstract class _Pay implements CheckoutPaymentEvent {
  const factory _Pay({
    required final SavedCard selectedCard,
    required final int amount,
    final String currency,
    final String? orderId,
    required final String addressDocumentId,
  }) = _$PayImpl;

  @override
  SavedCard get selectedCard;
  @override
  int get amount;
  @override
  String get currency;
  @override
  String? get orderId;
  @override
  String get addressDocumentId;

  /// Create a copy of CheckoutPaymentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayImplCopyWith<_$PayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckoutPaymentState {
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get createdOrderDocumentId => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutPaymentStateCopyWith<CheckoutPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutPaymentStateCopyWith<$Res> {
  factory $CheckoutPaymentStateCopyWith(
    CheckoutPaymentState value,
    $Res Function(CheckoutPaymentState) then,
  ) = _$CheckoutPaymentStateCopyWithImpl<$Res, CheckoutPaymentState>;
  @useResult
  $Res call({
    bool loading,
    String? error,
    bool success,
    String? createdOrderDocumentId,
  });
}

/// @nodoc
class _$CheckoutPaymentStateCopyWithImpl<
  $Res,
  $Val extends CheckoutPaymentState
>
    implements $CheckoutPaymentStateCopyWith<$Res> {
  _$CheckoutPaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? success = null,
    Object? createdOrderDocumentId = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
            success:
                null == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool,
            createdOrderDocumentId:
                freezed == createdOrderDocumentId
                    ? _value.createdOrderDocumentId
                    : createdOrderDocumentId // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckoutPaymentStateImplCopyWith<$Res>
    implements $CheckoutPaymentStateCopyWith<$Res> {
  factory _$$CheckoutPaymentStateImplCopyWith(
    _$CheckoutPaymentStateImpl value,
    $Res Function(_$CheckoutPaymentStateImpl) then,
  ) = __$$CheckoutPaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    String? error,
    bool success,
    String? createdOrderDocumentId,
  });
}

/// @nodoc
class __$$CheckoutPaymentStateImplCopyWithImpl<$Res>
    extends _$CheckoutPaymentStateCopyWithImpl<$Res, _$CheckoutPaymentStateImpl>
    implements _$$CheckoutPaymentStateImplCopyWith<$Res> {
  __$$CheckoutPaymentStateImplCopyWithImpl(
    _$CheckoutPaymentStateImpl _value,
    $Res Function(_$CheckoutPaymentStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? error = freezed,
    Object? success = null,
    Object? createdOrderDocumentId = freezed,
  }) {
    return _then(
      _$CheckoutPaymentStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
        createdOrderDocumentId:
            freezed == createdOrderDocumentId
                ? _value.createdOrderDocumentId
                : createdOrderDocumentId // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$CheckoutPaymentStateImpl implements _CheckoutPaymentState {
  const _$CheckoutPaymentStateImpl({
    this.loading = false,
    this.error,
    this.success = false,
    this.createdOrderDocumentId,
  });

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool success;
  @override
  final String? createdOrderDocumentId;

  @override
  String toString() {
    return 'CheckoutPaymentState(loading: $loading, error: $error, success: $success, createdOrderDocumentId: $createdOrderDocumentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutPaymentStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.createdOrderDocumentId, createdOrderDocumentId) ||
                other.createdOrderDocumentId == createdOrderDocumentId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, loading, error, success, createdOrderDocumentId);

  /// Create a copy of CheckoutPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutPaymentStateImplCopyWith<_$CheckoutPaymentStateImpl>
  get copyWith =>
      __$$CheckoutPaymentStateImplCopyWithImpl<_$CheckoutPaymentStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CheckoutPaymentState implements CheckoutPaymentState {
  const factory _CheckoutPaymentState({
    final bool loading,
    final String? error,
    final bool success,
    final String? createdOrderDocumentId,
  }) = _$CheckoutPaymentStateImpl;

  @override
  bool get loading;
  @override
  String? get error;
  @override
  bool get success;
  @override
  String? get createdOrderDocumentId;

  /// Create a copy of CheckoutPaymentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutPaymentStateImplCopyWith<_$CheckoutPaymentStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

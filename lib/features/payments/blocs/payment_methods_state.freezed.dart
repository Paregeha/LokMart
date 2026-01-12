// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_methods_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PaymentMethodsState {
  bool get loading => throw _privateConstructorUsedError;
  List<SavedCard> get cards => throw _privateConstructorUsedError;
  int? get selectedId => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodsStateCopyWith<PaymentMethodsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsStateCopyWith<$Res> {
  factory $PaymentMethodsStateCopyWith(
    PaymentMethodsState value,
    $Res Function(PaymentMethodsState) then,
  ) = _$PaymentMethodsStateCopyWithImpl<$Res, PaymentMethodsState>;
  @useResult
  $Res call({
    bool loading,
    List<SavedCard> cards,
    int? selectedId,
    String? error,
  });
}

/// @nodoc
class _$PaymentMethodsStateCopyWithImpl<$Res, $Val extends PaymentMethodsState>
    implements $PaymentMethodsStateCopyWith<$Res> {
  _$PaymentMethodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? cards = null,
    Object? selectedId = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            cards:
                null == cards
                    ? _value.cards
                    : cards // ignore: cast_nullable_to_non_nullable
                        as List<SavedCard>,
            selectedId:
                freezed == selectedId
                    ? _value.selectedId
                    : selectedId // ignore: cast_nullable_to_non_nullable
                        as int?,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentMethodsStateImplCopyWith<$Res>
    implements $PaymentMethodsStateCopyWith<$Res> {
  factory _$$PaymentMethodsStateImplCopyWith(
    _$PaymentMethodsStateImpl value,
    $Res Function(_$PaymentMethodsStateImpl) then,
  ) = __$$PaymentMethodsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool loading,
    List<SavedCard> cards,
    int? selectedId,
    String? error,
  });
}

/// @nodoc
class __$$PaymentMethodsStateImplCopyWithImpl<$Res>
    extends _$PaymentMethodsStateCopyWithImpl<$Res, _$PaymentMethodsStateImpl>
    implements _$$PaymentMethodsStateImplCopyWith<$Res> {
  __$$PaymentMethodsStateImplCopyWithImpl(
    _$PaymentMethodsStateImpl _value,
    $Res Function(_$PaymentMethodsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethodsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? cards = null,
    Object? selectedId = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$PaymentMethodsStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        cards:
            null == cards
                ? _value._cards
                : cards // ignore: cast_nullable_to_non_nullable
                    as List<SavedCard>,
        selectedId:
            freezed == selectedId
                ? _value.selectedId
                : selectedId // ignore: cast_nullable_to_non_nullable
                    as int?,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$PaymentMethodsStateImpl implements _PaymentMethodsState {
  const _$PaymentMethodsStateImpl({
    this.loading = false,
    final List<SavedCard> cards = const [],
    this.selectedId,
    this.error,
  }) : _cards = cards;

  @override
  @JsonKey()
  final bool loading;
  final List<SavedCard> _cards;
  @override
  @JsonKey()
  List<SavedCard> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  final int? selectedId;
  @override
  final String? error;

  @override
  String toString() {
    return 'PaymentMethodsState(loading: $loading, cards: $cards, selectedId: $selectedId, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodsStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.selectedId, selectedId) ||
                other.selectedId == selectedId) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_cards),
    selectedId,
    error,
  );

  /// Create a copy of PaymentMethodsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodsStateImplCopyWith<_$PaymentMethodsStateImpl> get copyWith =>
      __$$PaymentMethodsStateImplCopyWithImpl<_$PaymentMethodsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PaymentMethodsState implements PaymentMethodsState {
  const factory _PaymentMethodsState({
    final bool loading,
    final List<SavedCard> cards,
    final int? selectedId,
    final String? error,
  }) = _$PaymentMethodsStateImpl;

  @override
  bool get loading;
  @override
  List<SavedCard> get cards;
  @override
  int? get selectedId;
  @override
  String? get error;

  /// Create a copy of PaymentMethodsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodsStateImplCopyWith<_$PaymentMethodsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

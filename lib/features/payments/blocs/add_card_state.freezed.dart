// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddCardState {
  bool get loading => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of AddCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddCardStateCopyWith<AddCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCardStateCopyWith<$Res> {
  factory $AddCardStateCopyWith(
    AddCardState value,
    $Res Function(AddCardState) then,
  ) = _$AddCardStateCopyWithImpl<$Res, AddCardState>;
  @useResult
  $Res call({bool loading, bool success, String? error});
}

/// @nodoc
class _$AddCardStateCopyWithImpl<$Res, $Val extends AddCardState>
    implements $AddCardStateCopyWith<$Res> {
  _$AddCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddCardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            success:
                null == success
                    ? _value.success
                    : success // ignore: cast_nullable_to_non_nullable
                        as bool,
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
abstract class _$$AddCardStateImplCopyWith<$Res>
    implements $AddCardStateCopyWith<$Res> {
  factory _$$AddCardStateImplCopyWith(
    _$AddCardStateImpl value,
    $Res Function(_$AddCardStateImpl) then,
  ) = __$$AddCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool success, String? error});
}

/// @nodoc
class __$$AddCardStateImplCopyWithImpl<$Res>
    extends _$AddCardStateCopyWithImpl<$Res, _$AddCardStateImpl>
    implements _$$AddCardStateImplCopyWith<$Res> {
  __$$AddCardStateImplCopyWithImpl(
    _$AddCardStateImpl _value,
    $Res Function(_$AddCardStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddCardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? success = null,
    Object? error = freezed,
  }) {
    return _then(
      _$AddCardStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        success:
            null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                    as bool,
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

class _$AddCardStateImpl implements _AddCardState {
  const _$AddCardStateImpl({
    this.loading = false,
    this.success = false,
    this.error,
  });

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool success;
  @override
  final String? error;

  @override
  String toString() {
    return 'AddCardState(loading: $loading, success: $success, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCardStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, success, error);

  /// Create a copy of AddCardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCardStateImplCopyWith<_$AddCardStateImpl> get copyWith =>
      __$$AddCardStateImplCopyWithImpl<_$AddCardStateImpl>(this, _$identity);
}

abstract class _AddCardState implements AddCardState {
  const factory _AddCardState({
    final bool loading,
    final bool success,
    final String? error,
  }) = _$AddCardStateImpl;

  @override
  bool get loading;
  @override
  bool get success;
  @override
  String? get error;

  /// Create a copy of AddCardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCardStateImplCopyWith<_$AddCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

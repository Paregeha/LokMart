// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SavedCard _$SavedCardFromJson(Map<String, dynamic> json) {
  return _SavedCard.fromJson(json);
}

/// @nodoc
mixin _$SavedCard {
  int get id => throw _privateConstructorUsedError;
  String get documentId => throw _privateConstructorUsedError;
  String get paymentMethodId => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get last4 => throw _privateConstructorUsedError;
  int get expMonth => throw _privateConstructorUsedError;
  int get expYear => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this SavedCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedCardCopyWith<SavedCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedCardCopyWith<$Res> {
  factory $SavedCardCopyWith(SavedCard value, $Res Function(SavedCard) then) =
      _$SavedCardCopyWithImpl<$Res, SavedCard>;
  @useResult
  $Res call({
    int id,
    String documentId,
    String paymentMethodId,
    String brand,
    String last4,
    int expMonth,
    int expYear,
    bool isDefault,
  });
}

/// @nodoc
class _$SavedCardCopyWithImpl<$Res, $Val extends SavedCard>
    implements $SavedCardCopyWith<$Res> {
  _$SavedCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentId = null,
    Object? paymentMethodId = null,
    Object? brand = null,
    Object? last4 = null,
    Object? expMonth = null,
    Object? expYear = null,
    Object? isDefault = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            documentId:
                null == documentId
                    ? _value.documentId
                    : documentId // ignore: cast_nullable_to_non_nullable
                        as String,
            paymentMethodId:
                null == paymentMethodId
                    ? _value.paymentMethodId
                    : paymentMethodId // ignore: cast_nullable_to_non_nullable
                        as String,
            brand:
                null == brand
                    ? _value.brand
                    : brand // ignore: cast_nullable_to_non_nullable
                        as String,
            last4:
                null == last4
                    ? _value.last4
                    : last4 // ignore: cast_nullable_to_non_nullable
                        as String,
            expMonth:
                null == expMonth
                    ? _value.expMonth
                    : expMonth // ignore: cast_nullable_to_non_nullable
                        as int,
            expYear:
                null == expYear
                    ? _value.expYear
                    : expYear // ignore: cast_nullable_to_non_nullable
                        as int,
            isDefault:
                null == isDefault
                    ? _value.isDefault
                    : isDefault // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SavedCardImplCopyWith<$Res>
    implements $SavedCardCopyWith<$Res> {
  factory _$$SavedCardImplCopyWith(
    _$SavedCardImpl value,
    $Res Function(_$SavedCardImpl) then,
  ) = __$$SavedCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String documentId,
    String paymentMethodId,
    String brand,
    String last4,
    int expMonth,
    int expYear,
    bool isDefault,
  });
}

/// @nodoc
class __$$SavedCardImplCopyWithImpl<$Res>
    extends _$SavedCardCopyWithImpl<$Res, _$SavedCardImpl>
    implements _$$SavedCardImplCopyWith<$Res> {
  __$$SavedCardImplCopyWithImpl(
    _$SavedCardImpl _value,
    $Res Function(_$SavedCardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SavedCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentId = null,
    Object? paymentMethodId = null,
    Object? brand = null,
    Object? last4 = null,
    Object? expMonth = null,
    Object? expYear = null,
    Object? isDefault = null,
  }) {
    return _then(
      _$SavedCardImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        documentId:
            null == documentId
                ? _value.documentId
                : documentId // ignore: cast_nullable_to_non_nullable
                    as String,
        paymentMethodId:
            null == paymentMethodId
                ? _value.paymentMethodId
                : paymentMethodId // ignore: cast_nullable_to_non_nullable
                    as String,
        brand:
            null == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                    as String,
        last4:
            null == last4
                ? _value.last4
                : last4 // ignore: cast_nullable_to_non_nullable
                    as String,
        expMonth:
            null == expMonth
                ? _value.expMonth
                : expMonth // ignore: cast_nullable_to_non_nullable
                    as int,
        expYear:
            null == expYear
                ? _value.expYear
                : expYear // ignore: cast_nullable_to_non_nullable
                    as int,
        isDefault:
            null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedCardImpl implements _SavedCard {
  const _$SavedCardImpl({
    required this.id,
    required this.documentId,
    required this.paymentMethodId,
    required this.brand,
    required this.last4,
    required this.expMonth,
    required this.expYear,
    required this.isDefault,
  });

  factory _$SavedCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedCardImplFromJson(json);

  @override
  final int id;
  @override
  final String documentId;
  @override
  final String paymentMethodId;
  @override
  final String brand;
  @override
  final String last4;
  @override
  final int expMonth;
  @override
  final int expYear;
  @override
  final bool isDefault;

  @override
  String toString() {
    return 'SavedCard(id: $id, documentId: $documentId, paymentMethodId: $paymentMethodId, brand: $brand, last4: $last4, expMonth: $expMonth, expYear: $expYear, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.last4, last4) || other.last4 == last4) &&
            (identical(other.expMonth, expMonth) ||
                other.expMonth == expMonth) &&
            (identical(other.expYear, expYear) || other.expYear == expYear) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    documentId,
    paymentMethodId,
    brand,
    last4,
    expMonth,
    expYear,
    isDefault,
  );

  /// Create a copy of SavedCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedCardImplCopyWith<_$SavedCardImpl> get copyWith =>
      __$$SavedCardImplCopyWithImpl<_$SavedCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedCardImplToJson(this);
  }
}

abstract class _SavedCard implements SavedCard {
  const factory _SavedCard({
    required final int id,
    required final String documentId,
    required final String paymentMethodId,
    required final String brand,
    required final String last4,
    required final int expMonth,
    required final int expYear,
    required final bool isDefault,
  }) = _$SavedCardImpl;

  factory _SavedCard.fromJson(Map<String, dynamic> json) =
      _$SavedCardImpl.fromJson;

  @override
  int get id;
  @override
  String get documentId;
  @override
  String get paymentMethodId;
  @override
  String get brand;
  @override
  String get last4;
  @override
  int get expMonth;
  @override
  int get expYear;
  @override
  bool get isDefault;

  /// Create a copy of SavedCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedCardImplCopyWith<_$SavedCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

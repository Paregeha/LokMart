// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strapi_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StrapiMedia _$StrapiMediaFromJson(Map<String, dynamic> json) {
  return _StrapiMedia.fromJson(json);
}

/// @nodoc
mixin _$StrapiMedia {
  int get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get mime => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;

  /// Serializes this StrapiMedia to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StrapiMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StrapiMediaCopyWith<StrapiMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrapiMediaCopyWith<$Res> {
  factory $StrapiMediaCopyWith(
    StrapiMedia value,
    $Res Function(StrapiMedia) then,
  ) = _$StrapiMediaCopyWithImpl<$Res, StrapiMedia>;
  @useResult
  $Res call({
    int id,
    String url,
    String? mime,
    int? width,
    int? height,
    int? size,
  });
}

/// @nodoc
class _$StrapiMediaCopyWithImpl<$Res, $Val extends StrapiMedia>
    implements $StrapiMediaCopyWith<$Res> {
  _$StrapiMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StrapiMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? mime = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? size = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            url:
                null == url
                    ? _value.url
                    : url // ignore: cast_nullable_to_non_nullable
                        as String,
            mime:
                freezed == mime
                    ? _value.mime
                    : mime // ignore: cast_nullable_to_non_nullable
                        as String?,
            width:
                freezed == width
                    ? _value.width
                    : width // ignore: cast_nullable_to_non_nullable
                        as int?,
            height:
                freezed == height
                    ? _value.height
                    : height // ignore: cast_nullable_to_non_nullable
                        as int?,
            size:
                freezed == size
                    ? _value.size
                    : size // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StrapiMediaImplCopyWith<$Res>
    implements $StrapiMediaCopyWith<$Res> {
  factory _$$StrapiMediaImplCopyWith(
    _$StrapiMediaImpl value,
    $Res Function(_$StrapiMediaImpl) then,
  ) = __$$StrapiMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String url,
    String? mime,
    int? width,
    int? height,
    int? size,
  });
}

/// @nodoc
class __$$StrapiMediaImplCopyWithImpl<$Res>
    extends _$StrapiMediaCopyWithImpl<$Res, _$StrapiMediaImpl>
    implements _$$StrapiMediaImplCopyWith<$Res> {
  __$$StrapiMediaImplCopyWithImpl(
    _$StrapiMediaImpl _value,
    $Res Function(_$StrapiMediaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StrapiMedia
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? mime = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? size = freezed,
  }) {
    return _then(
      _$StrapiMediaImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        url:
            null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                    as String,
        mime:
            freezed == mime
                ? _value.mime
                : mime // ignore: cast_nullable_to_non_nullable
                    as String?,
        width:
            freezed == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                    as int?,
        height:
            freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                    as int?,
        size:
            freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StrapiMediaImpl implements _StrapiMedia {
  const _$StrapiMediaImpl({
    required this.id,
    required this.url,
    this.mime,
    this.width,
    this.height,
    this.size,
  });

  factory _$StrapiMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrapiMediaImplFromJson(json);

  @override
  final int id;
  @override
  final String url;
  @override
  final String? mime;
  @override
  final int? width;
  @override
  final int? height;
  @override
  final int? size;

  @override
  String toString() {
    return 'StrapiMedia(id: $id, url: $url, mime: $mime, width: $width, height: $height, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrapiMediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.mime, mime) || other.mime == mime) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, url, mime, width, height, size);

  /// Create a copy of StrapiMedia
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StrapiMediaImplCopyWith<_$StrapiMediaImpl> get copyWith =>
      __$$StrapiMediaImplCopyWithImpl<_$StrapiMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrapiMediaImplToJson(this);
  }
}

abstract class _StrapiMedia implements StrapiMedia {
  const factory _StrapiMedia({
    required final int id,
    required final String url,
    final String? mime,
    final int? width,
    final int? height,
    final int? size,
  }) = _$StrapiMediaImpl;

  factory _StrapiMedia.fromJson(Map<String, dynamic> json) =
      _$StrapiMediaImpl.fromJson;

  @override
  int get id;
  @override
  String get url;
  @override
  String? get mime;
  @override
  int? get width;
  @override
  int? get height;
  @override
  int? get size;

  /// Create a copy of StrapiMedia
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StrapiMediaImplCopyWith<_$StrapiMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

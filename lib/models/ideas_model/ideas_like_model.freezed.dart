// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ideas_like_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IdeasLikeModel _$IdeasLikeModelFromJson(Map<String, dynamic> json) {
  return _IdeasLikeModel.fromJson(json);
}

/// @nodoc
mixin _$IdeasLikeModel {
  bool get isLiked => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeasLikeModelCopyWith<IdeasLikeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeasLikeModelCopyWith<$Res> {
  factory $IdeasLikeModelCopyWith(
          IdeasLikeModel value, $Res Function(IdeasLikeModel) then) =
      _$IdeasLikeModelCopyWithImpl<$Res, IdeasLikeModel>;
  @useResult
  $Res call({bool isLiked, String userId});
}

/// @nodoc
class _$IdeasLikeModelCopyWithImpl<$Res, $Val extends IdeasLikeModel>
    implements $IdeasLikeModelCopyWith<$Res> {
  _$IdeasLikeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IdeasLikeModelCopyWith<$Res>
    implements $IdeasLikeModelCopyWith<$Res> {
  factory _$$_IdeasLikeModelCopyWith(
          _$_IdeasLikeModel value, $Res Function(_$_IdeasLikeModel) then) =
      __$$_IdeasLikeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLiked, String userId});
}

/// @nodoc
class __$$_IdeasLikeModelCopyWithImpl<$Res>
    extends _$IdeasLikeModelCopyWithImpl<$Res, _$_IdeasLikeModel>
    implements _$$_IdeasLikeModelCopyWith<$Res> {
  __$$_IdeasLikeModelCopyWithImpl(
      _$_IdeasLikeModel _value, $Res Function(_$_IdeasLikeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = null,
    Object? userId = null,
  }) {
    return _then(_$_IdeasLikeModel(
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IdeasLikeModel implements _IdeasLikeModel {
  const _$_IdeasLikeModel({required this.isLiked, required this.userId});

  factory _$_IdeasLikeModel.fromJson(Map<String, dynamic> json) =>
      _$$_IdeasLikeModelFromJson(json);

  @override
  final bool isLiked;
  @override
  final String userId;

  @override
  String toString() {
    return 'IdeasLikeModel(isLiked: $isLiked, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdeasLikeModel &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLiked, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdeasLikeModelCopyWith<_$_IdeasLikeModel> get copyWith =>
      __$$_IdeasLikeModelCopyWithImpl<_$_IdeasLikeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdeasLikeModelToJson(
      this,
    );
  }
}

abstract class _IdeasLikeModel implements IdeasLikeModel {
  const factory _IdeasLikeModel(
      {required final bool isLiked,
      required final String userId}) = _$_IdeasLikeModel;

  factory _IdeasLikeModel.fromJson(Map<String, dynamic> json) =
      _$_IdeasLikeModel.fromJson;

  @override
  bool get isLiked;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$_IdeasLikeModelCopyWith<_$_IdeasLikeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

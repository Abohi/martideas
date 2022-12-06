// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ideas_tab_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IdeasTabModel _$IdeasTabModelFromJson(Map<String, dynamic> json) {
  return _IdeasTabModel.fromJson(json);
}

/// @nodoc
mixin _$IdeasTabModel {
  String get title => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdeasTabModelCopyWith<IdeasTabModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdeasTabModelCopyWith<$Res> {
  factory $IdeasTabModelCopyWith(
          IdeasTabModel value, $Res Function(IdeasTabModel) then) =
      _$IdeasTabModelCopyWithImpl<$Res, IdeasTabModel>;
  @useResult
  $Res call({String title, int color});
}

/// @nodoc
class _$IdeasTabModelCopyWithImpl<$Res, $Val extends IdeasTabModel>
    implements $IdeasTabModelCopyWith<$Res> {
  _$IdeasTabModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IdeasTabModelCopyWith<$Res>
    implements $IdeasTabModelCopyWith<$Res> {
  factory _$$_IdeasTabModelCopyWith(
          _$_IdeasTabModel value, $Res Function(_$_IdeasTabModel) then) =
      __$$_IdeasTabModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int color});
}

/// @nodoc
class __$$_IdeasTabModelCopyWithImpl<$Res>
    extends _$IdeasTabModelCopyWithImpl<$Res, _$_IdeasTabModel>
    implements _$$_IdeasTabModelCopyWith<$Res> {
  __$$_IdeasTabModelCopyWithImpl(
      _$_IdeasTabModel _value, $Res Function(_$_IdeasTabModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? color = null,
  }) {
    return _then(_$_IdeasTabModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IdeasTabModel implements _IdeasTabModel {
  const _$_IdeasTabModel({required this.title, required this.color});

  factory _$_IdeasTabModel.fromJson(Map<String, dynamic> json) =>
      _$$_IdeasTabModelFromJson(json);

  @override
  final String title;
  @override
  final int color;

  @override
  String toString() {
    return 'IdeasTabModel(title: $title, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdeasTabModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdeasTabModelCopyWith<_$_IdeasTabModel> get copyWith =>
      __$$_IdeasTabModelCopyWithImpl<_$_IdeasTabModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IdeasTabModelToJson(
      this,
    );
  }
}

abstract class _IdeasTabModel implements IdeasTabModel {
  const factory _IdeasTabModel(
      {required final String title,
      required final int color}) = _$_IdeasTabModel;

  factory _IdeasTabModel.fromJson(Map<String, dynamic> json) =
      _$_IdeasTabModel.fromJson;

  @override
  String get title;
  @override
  int get color;
  @override
  @JsonKey(ignore: true)
  _$$_IdeasTabModelCopyWith<_$_IdeasTabModel> get copyWith =>
      throw _privateConstructorUsedError;
}

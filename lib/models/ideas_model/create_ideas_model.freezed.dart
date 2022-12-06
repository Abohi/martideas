// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_ideas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateIdeaModel _$CreateIdeaModelFromJson(Map<String, dynamic> json) {
  return _CreateIdeaModel.fromJson(json);
}

/// @nodoc
mixin _$CreateIdeaModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get categoryColor => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(
      name: "createdTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get ideaCreatedTime => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String? get ideaId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateIdeaModelCopyWith<CreateIdeaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateIdeaModelCopyWith<$Res> {
  factory $CreateIdeaModelCopyWith(
          CreateIdeaModel value, $Res Function(CreateIdeaModel) then) =
      _$CreateIdeaModelCopyWithImpl<$Res, CreateIdeaModel>;
  @useResult
  $Res call(
      {String title,
      String description,
      int categoryColor,
      String categoryName,
      @JsonKey(name: "createdTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? ideaCreatedTime,
      String authorId,
      String? ideaId});
}

/// @nodoc
class _$CreateIdeaModelCopyWithImpl<$Res, $Val extends CreateIdeaModel>
    implements $CreateIdeaModelCopyWith<$Res> {
  _$CreateIdeaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? categoryColor = null,
    Object? categoryName = null,
    Object? ideaCreatedTime = freezed,
    Object? authorId = null,
    Object? ideaId = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryColor: null == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      ideaCreatedTime: freezed == ideaCreatedTime
          ? _value.ideaCreatedTime
          : ideaCreatedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      ideaId: freezed == ideaId
          ? _value.ideaId
          : ideaId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateIdeaModelCopyWith<$Res>
    implements $CreateIdeaModelCopyWith<$Res> {
  factory _$$_CreateIdeaModelCopyWith(
          _$_CreateIdeaModel value, $Res Function(_$_CreateIdeaModel) then) =
      __$$_CreateIdeaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      int categoryColor,
      String categoryName,
      @JsonKey(name: "createdTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? ideaCreatedTime,
      String authorId,
      String? ideaId});
}

/// @nodoc
class __$$_CreateIdeaModelCopyWithImpl<$Res>
    extends _$CreateIdeaModelCopyWithImpl<$Res, _$_CreateIdeaModel>
    implements _$$_CreateIdeaModelCopyWith<$Res> {
  __$$_CreateIdeaModelCopyWithImpl(
      _$_CreateIdeaModel _value, $Res Function(_$_CreateIdeaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? categoryColor = null,
    Object? categoryName = null,
    Object? ideaCreatedTime = freezed,
    Object? authorId = null,
    Object? ideaId = freezed,
  }) {
    return _then(_$_CreateIdeaModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryColor: null == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      ideaCreatedTime: freezed == ideaCreatedTime
          ? _value.ideaCreatedTime
          : ideaCreatedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      ideaId: freezed == ideaId
          ? _value.ideaId
          : ideaId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateIdeaModel implements _CreateIdeaModel {
  const _$_CreateIdeaModel(
      {required this.title,
      required this.description,
      required this.categoryColor,
      required this.categoryName,
      @JsonKey(name: "createdTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.ideaCreatedTime,
      required this.authorId,
      this.ideaId});

  factory _$_CreateIdeaModel.fromJson(Map<String, dynamic> json) =>
      _$$_CreateIdeaModelFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final int categoryColor;
  @override
  final String categoryName;
  @override
  @JsonKey(
      name: "createdTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? ideaCreatedTime;
  @override
  final String authorId;
  @override
  final String? ideaId;

  @override
  String toString() {
    return 'CreateIdeaModel(title: $title, description: $description, categoryColor: $categoryColor, categoryName: $categoryName, ideaCreatedTime: $ideaCreatedTime, authorId: $authorId, ideaId: $ideaId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateIdeaModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.ideaCreatedTime, ideaCreatedTime) ||
                other.ideaCreatedTime == ideaCreatedTime) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.ideaId, ideaId) || other.ideaId == ideaId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      categoryColor, categoryName, ideaCreatedTime, authorId, ideaId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateIdeaModelCopyWith<_$_CreateIdeaModel> get copyWith =>
      __$$_CreateIdeaModelCopyWithImpl<_$_CreateIdeaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateIdeaModelToJson(
      this,
    );
  }
}

abstract class _CreateIdeaModel implements CreateIdeaModel {
  const factory _CreateIdeaModel(
      {required final String title,
      required final String description,
      required final int categoryColor,
      required final String categoryName,
      @JsonKey(name: "createdTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          final DateTime? ideaCreatedTime,
      required final String authorId,
      final String? ideaId}) = _$_CreateIdeaModel;

  factory _CreateIdeaModel.fromJson(Map<String, dynamic> json) =
      _$_CreateIdeaModel.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  int get categoryColor;
  @override
  String get categoryName;
  @override
  @JsonKey(
      name: "createdTime", fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get ideaCreatedTime;
  @override
  String get authorId;
  @override
  String? get ideaId;
  @override
  @JsonKey(ignore: true)
  _$$_CreateIdeaModelCopyWith<_$_CreateIdeaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

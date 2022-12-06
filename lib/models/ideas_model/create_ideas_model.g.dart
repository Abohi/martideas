// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ideas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateIdeaModel _$$_CreateIdeaModelFromJson(Map<String, dynamic> json) =>
    _$_CreateIdeaModel(
      title: json['title'] as String,
      description: json['description'] as String,
      categoryColor: json['categoryColor'] as int,
      categoryName: json['categoryName'] as String,
      ideaCreatedTime: dateTimeFromJson(json['createdTime'] as Timestamp?),
      authorId: json['authorId'] as String,
      ideaId: json['ideaId'] as String?,
    );

Map<String, dynamic> _$$_CreateIdeaModelToJson(_$_CreateIdeaModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'categoryColor': instance.categoryColor,
      'categoryName': instance.categoryName,
      'createdTime': dateTimeToJson(instance.ideaCreatedTime),
      'authorId': instance.authorId,
      'ideaId': instance.ideaId,
    };

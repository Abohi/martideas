import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_ideas_model.freezed.dart';
part 'create_ideas_model.g.dart';

@freezed
class CreateIdeaModel with _$CreateIdeaModel{
  const factory CreateIdeaModel({required String title,required String description,required int categoryColor,required String categoryName,@JsonKey(
    name: "createdTime",
    fromJson: dateTimeFromJson,
    toJson: dateTimeToJson,
  )   DateTime? ideaCreatedTime,required String authorId,String? ideaId})=_CreateIdeaModel;
  factory CreateIdeaModel.fromJson(Map<String, dynamic> json) => _$CreateIdeaModelFromJson(json);
}

DateTime? dateTimeFromJson(Timestamp? timestamp) {
  if(timestamp==null)
    return null;
  return timestamp.toDate();
}

Timestamp dateTimeToJson(DateTime? date) => Timestamp.fromDate(date!);
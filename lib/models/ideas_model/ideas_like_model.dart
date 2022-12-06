import 'package:freezed_annotation/freezed_annotation.dart';
part 'ideas_like_model.freezed.dart';
part 'ideas_like_model.g.dart';

@freezed
class IdeasLikeModel with _$IdeasLikeModel{
  const factory IdeasLikeModel({required bool isLiked,required String userId})=_IdeasLikeModel;
  factory IdeasLikeModel.fromJson(Map<String, dynamic> json) => _$IdeasLikeModelFromJson(json);

}
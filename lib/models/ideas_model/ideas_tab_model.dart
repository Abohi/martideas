import 'package:freezed_annotation/freezed_annotation.dart';
part 'ideas_tab_model.freezed.dart';
part 'ideas_tab_model.g.dart';

@freezed
class IdeasTabModel with _$IdeasTabModel{
  const factory IdeasTabModel({required String title,required int color})=_IdeasTabModel;
  factory IdeasTabModel.fromJson(Map<String, dynamic> json) => _$IdeasTabModelFromJson(json);

}
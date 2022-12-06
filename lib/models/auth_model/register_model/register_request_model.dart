import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_request_model.freezed.dart';
part 'register_request_model.g.dart';

@freezed
class RegisterRequestModel with _$RegisterRequestModel{
  const factory RegisterRequestModel({required String email,required String password})=_RegisterRequestModel;
  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);

}
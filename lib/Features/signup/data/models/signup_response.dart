import 'package:json_annotation/json_annotation.dart';
part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;
  @JsonKey(name: "data")
  UserData? userData;
  int? code;
  bool? status;
  SignupResponse({
    this.message,
    this.userData,
    this.code,
    this.status,
  });
  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  @JsonKey(name: "username")
  String? userName;
  UserData({
    this.token,
    this.userName,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

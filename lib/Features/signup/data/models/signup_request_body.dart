import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';
@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String phone;
  final String password;
  @JsonKey(name: "password_confirmation")
  final String passwordConfirmation;
  final int gender;

  SignupRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.gender,
  });

  //we will make the to json and from json be be auto generated.
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}

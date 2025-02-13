import 'package:flutter_complete_project/Features/signup/data/models/signup_request_body.dart';
import 'package:flutter_complete_project/Features/signup/data/models/signup_response.dart';
import 'package:flutter_complete_project/core/networking/api_error_handler.dart';
import 'package:flutter_complete_project/core/networking/api_result.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';

class SignupRepo {
  final ApiService _apiService;
  SignupRepo(this._apiService);
  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      SignupResponse response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
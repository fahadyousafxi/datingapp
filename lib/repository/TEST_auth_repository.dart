import 'package:flutter/foundation.dart';

import '../constants/app_urls.dart';
import '../data/network/base_api_services.dart';
import '../data/network/networkApiServices.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  /// Login Api Call
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.verifyOTPEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.verifyOTPEndPoint} ************************');
      }
      return response;
    } catch (e) {
      throw e;
    }
  }

  /// Register Api Call
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.verifyOTPEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.verifyOTPEndPoint} ************************');
      }
      return response;
    } catch (e) {
      throw e;
    }
  }

  /// Forget Api Call
  Future<dynamic> forgetApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.verifyOTPEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.verifyOTPEndPoint} ************************');
      }

      return response;
    } catch (e) {
      throw e;
    }
  }

  /// update password Api Call
  Future<dynamic> forgetUsingPhoneApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.verifyOTPEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.verifyOTPEndPoint} ************************');
      }

      return response;
    } catch (e) {
      throw e;
    }
  }

  /// update password Api Call
  Future<dynamic> updatePasswordApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.verifyOTPEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.verifyOTPEndPoint} ************************');
      }

      return response;
    } catch (e) {
      throw e;
    }
  }
}

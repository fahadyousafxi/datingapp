import 'package:flutter/foundation.dart';

import '../constants/app_urls.dart';
import '../data/network/base_api_services.dart';
import '../data/network/networkApiServices.dart';

class ProfileRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  /// upload Profile Photo Api Call
  Future<dynamic> createProfileApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.createProfileEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.createProfileEndPoint} ************************');
      }
      return response;
    } catch (e) {
      throw e;
    }
  }
}

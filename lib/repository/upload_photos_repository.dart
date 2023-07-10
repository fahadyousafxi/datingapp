import 'package:flutter/foundation.dart';

import '../constants/app_urls.dart';
import '../data/network/base_api_services.dart';
import '../data/network/networkApiServices.dart';

class UploadPhotosRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  /// upload Profile Photo Api Call
  Future<dynamic> uploadProfilePhotoApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.uploadProfileImageEndPoint, data);
      if (kDebugMode) {
        print(
            '*************************** ${AppUrl.uploadProfileImageEndPoint} ************************');
      }
      return response;
    } catch (e) {
      throw e;
    }
  }
}

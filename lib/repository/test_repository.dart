import '../constants/app_urls.dart';
import '../data/network/base_api_services.dart';
import '../data/network/networkApiServices.dart';
import '../models/TEST_TestModel.dart';

class TestRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TestModel> fetchTest() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.verifyOTPEndPoint, '');

      return response = TestModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}

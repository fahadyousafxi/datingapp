import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/response/api_response.dart';
import '../models/TEST_get_mining_setting_model.dart';
import '../repository/TEST_get_minning_setting_repository.dart';

class GetMiningSettingViewModel with ChangeNotifier {
  final _myRepo = GetMiningSettingRepository();

  ApiResponse<GetMiningSettingModel> miningSettingData = ApiResponse.loading();

  setMiningSettingData(ApiResponse<GetMiningSettingModel> response) {
    miningSettingData = response;
    notifyListeners();
  }

  Future<void> fetchMiningSettingApi() async {
    setMiningSettingData(ApiResponse.loading());

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    _myRepo.fetchMiningSettingData(token: token.toString()).then((value) {
      // code
      setMiningSettingData(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      // code
      setMiningSettingData(ApiResponse.error(error.toString()));
    });
  }
}

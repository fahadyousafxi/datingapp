import 'package:flutter/cupertino.dart';

import '../data/response/api_response.dart';
import '../models/TEST_maintenance_model.dart';
import '../repository/TEST_maintenance_repository.dart';

class MaintenanceViewModel with ChangeNotifier {
  final _myRepo = MaintenanceRepository();

  ApiResponse<MaintenanceModel> maintenanceData = ApiResponse.loading();

  setMaintenanceData(ApiResponse<MaintenanceModel> response) {
    maintenanceData = response;
    notifyListeners();
  }

  Future<void> fetchMaintenanceApi() async {
    setMaintenanceData(ApiResponse.loading());
    _myRepo.fetchMaintenanceData().then((value) {
      // code
      setMaintenanceData(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      // code
      setMaintenanceData(ApiResponse.error(error.toString()));
    });
  }
}

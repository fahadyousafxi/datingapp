import 'package:flutter/material.dart';

import '../bottom/bottombar.dart';
import '../repository/profile_repository.dart';
import '../utils/utils.dart';

class ProfileViewModel with ChangeNotifier {
  final _myRepo = ProfileRepository();

  /// for loading
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  /// For Create Profile Api Call
  Future<void> createProfileApi(BuildContext context,
      {required dynamic data}) async {
    setLoading(true);
    debugPrint('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
    _myRepo.createProfileApi(data).then((value) {
      // code
      setLoading(false);
      debugPrint('&&&&&&&&&&&&&&' + value.toString() + '&&&&&&&&&&&&&&');
      Utils.flutterToast('Profile created successful');
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Bottom();
          },
        ),
      );
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint('*********' + error.toString() + '*********');

      Utils.flutterToast(error.toString());
    });
  }
}

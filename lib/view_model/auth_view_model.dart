import 'package:dating/bottom/bottombar.dart';
import 'package:flutter/material.dart';

import '../login/accounts/account.dart';
import '../repository/auth_repository.dart';
import '../utils/utils.dart';
import 'TEST_user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  UserViewModel userViewModel = UserViewModel();

  /// for loading
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  /// For Login Api Call
  Future<void> loginApi(BuildContext context, {required dynamic data}) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      // code
      setLoading(false);
      debugPrint('&&&&&&&&&&&&&&' + value.toString() + '&&&&&&&&&&&&&&');
      // Utils.flutterToast(value['token'].toString());
      Utils.flutterToast('Sign in successfully');
      // userViewModel.saveUser(value['token'].toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Bottom()));
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint('*********' + error.toString() + '*********');
      Utils.flutterToast(error.toString());
    });
  }

  /// For Register Api Call
  Future<void> registerApi(BuildContext context,
      {required dynamic data}) async {
    setLoading(true);
    _myRepo.registerApi(data).then((value) {
      // code
      setLoading(false);
      debugPrint(value.toString());
      debugPrint(value['id'].toString());
      // Utils.flutterToast('Please verify it now');
      sendOTPApi(context,
          data: {'id': value['id'].toString()}, id: value['id'].toString());
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => Account(
      //         name: '', email: '', birthDate: '', password: '', initialPage: 1),
      //   ),
      // );
    }).onError((error, stackTrace) {
      // onError code

      setLoading(false);

      debugPrint('++++++++++' + error.toString());
      Utils.flutterToast(error.toString());
    });
  }

  /// For Forget Api Call
  Future<void> sendOTPApi(BuildContext context,
      {required dynamic data, required String? id}) async {
    setLoading(true);
    _myRepo.sendOTPApi(data).then((value) {
      // code
      setLoading(false);
      debugPrint(value.toString());
      Utils.flutterToast('OTP send successfully');

      // Utils.flutterToast(value['token'].toString());
      // Utils.flutterToast(value.toString());
      // userViewModel.saveUser(value['token'].toString());
      // Navigator.pop(context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Account(
              id: id,
              name: '',
              email: '',
              birthDate: '',
              password: '',
              initialPage: 1),
        ),
      );
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint(error.toString());
      // Utils.flutterToast(error.toString());
      // Utils.flutterToast('***************    error    ****************');
    });
  }

  /// verify otp Api Call
  Future<void> verifyOTPApi(BuildContext context,
      {required dynamic data}) async {
    setLoading(true);
    _myRepo.verifyOTPApi(data).then((value) {
      // code

      setLoading(false);
      debugPrint(value.toString());
      // Utils.flutterToast(value['token'].toString());
      Utils.flutterToast(value.toString());
      // userViewModel.saveUser(value['token'].toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Account(
              name: '', email: '', birthDate: '', password: '', initialPage: 2),
        ),
      );
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint(error.toString());
      Utils.flutterToast(error.toString());
      // Utils.flutterToast('***************    error    ****************');
    });
  }
}

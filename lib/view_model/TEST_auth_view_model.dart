import 'package:flutter/material.dart';

import '../repository/TEST_auth_repository.dart';
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
      debugPrint(value.toString());
      // Utils.flutterToast(value['token'].toString());
      // Utils.flutterToast('Sign in successfully');
      userViewModel.saveUser(value['token'].toString());
      Navigator.pop(context);
      Navigator.pop(context);
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => BottomNavigationBarForApp()));
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint(error.toString());
      // Utils.flutterToast(error.toString());
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
      // Utils.flutterToast('Registered Successfully');
      Navigator.pop(context);
      Navigator.pop(context);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => LoginTabs(
      //               iniIndex: 0,
      //             )));
    }).onError((error, stackTrace) {
      // onError code

      setLoading(false);

      debugPrint(error.toString());
      // Utils.flutterToast(error.toString());
    });
  }

  /// For Forget Api Call
  Future<void> forgetApi(BuildContext context, {required dynamic data}) async {
    setLoading(true);
    _myRepo.forgetApi(data).then((value) {
      // code
      setLoading(false);
      debugPrint(value.toString());
      // Utils.flutterToast(value['token'].toString());
      // Utils.flutterToast(value.toString());
      // userViewModel.saveUser(value['token'].toString());
      // Navigator.pop(context);
      // Navigator.pop(context)builder: (context) => BottomNavigationBarForApp()));

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ForgetPasswordOTP(
      //               data: data,
      //               emailOtpVerification: value['otp'].toString(),
      //               id: value['id'].toString(),
      //               phoneOtpVerification: '',
      //               phoneOrEmailAddress: value['email'].toString(),
      //             )));
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint(error.toString());
      // Utils.flutterToast(error.toString());
      // Utils.flutterToast('***************    error    ****************');
    });
  }

  /// Forget using phone Api Call
  Future<void> forgetUsingPhoneApi(BuildContext context,
      {required dynamic data, required String phoneNumber}) async {
    setLoading(true);
    _myRepo.forgetUsingPhoneApi(data).then((value) {
      // code

      setLoading(false);
      debugPrint(value.toString());
      // Utils.flutterToast(value['token'].toString());
      // Utils.flutterToast(value.toString());
      // userViewModel.saveUser(value['token'].toString());

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => UpdatePassword(
      //               phoneOrEmailAddress: phoneNumber,
      //               id: value['id'].toString(),
      //             )));
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint(error.toString());
      // Utils.flutterToast(error.toString());
      // Utils.flutterToast('***************    error    ****************');
    });
  }

  /// For Update Password Api Call
  Future<void> updatePasswordApi(BuildContext context,
      {required dynamic data}) async {
    setLoading(true);
    _myRepo.updatePasswordApi(data).then((value) {
      // code

      setLoading(false);
      debugPrint(value.toString());
      // Utils.flutterToast(value['token'].toString());
      // Utils.flutterToast(value.toString());
      // userViewModel.saveUser(value['token'].toString());
      // Navigator.pop(context);
      // Navigator.pop(context)builder: (context) => BottomNavigationBarForApp()));

      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      // Navigator.pop(context);
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => LoginTabs(
      //               iniIndex: 0,
      //             )));
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint(error.toString());
      // Utils.flutterToast(error.toString());
      // Utils.flutterToast('***************    error    ****************');
    });
  }
}

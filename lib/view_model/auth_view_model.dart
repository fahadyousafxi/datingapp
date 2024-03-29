import 'dart:developer';

import 'package:dating/bottom/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/accounts/account.dart';
import '../login/accounts/sms.dart';
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
    _myRepo.loginApi(data).then((value) async {
      // code
      setLoading(false);
      debugPrint('&&&&&&&&&&&&&&' + value.toString() + '&&&&&&&&&&&&&&');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Bottom()));
      // Utils.flutterToast(value['token'].toString());
      Utils.flutterToast('Sign in successful');
      final SharedPreferences sp = await SharedPreferences.getInstance();
      log('*****************:');
      log('*****************: ${value['user']['_id'].toString()}');
      sp.setString('userId', value['user']['_id'].toString());
      // userViewModel.saveUser(value['token'].toString());
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint('*********' + error.toString() + '*********');
      if (error.toString() ==
          'Invalid Input{"message":"Invalid Email or password"}') {
        Utils.flutterToast(
            'Invalid Input{"message":"Invalid Phone Number or Password"}');
      } else {
        Utils.flutterToast(error.toString());
      }
    });
  }

  /// For Register Api Call
  Future<void> registerApi(BuildContext context,
      {required dynamic data}) async {
    setLoading(true);
    _myRepo.registerApi(data).then((value) async {
      // code
      setLoading(false);
      debugPrint(value.toString());
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('userId', value['id']);
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

  /// login With Google Api Call
  Future<void> loginWithGoogle(BuildContext context,
      {required dynamic data}) async {
    setLoading(true);
    _myRepo.socialLoginApi(data).then((value) async {
      // code

      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('userId', value['user']['_id'].toString());
      setLoading(false);

      debugPrint(value.toString());

      // Utils.flutterToast(value['user']['isVerified'].toString());
      // Utils.flutterToast('Sign in successfully');

      if (value['user']['isVerified'] == true) {
        userViewModel.saveUser(value['token'].toString());
        Utils.flutterToast('Sign in successful');

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const Account(
        //         name: '',
        //         email: '',
        //         birthDate: '',
        //         password: '',
        //         initialPage: 2),
        //   ),
        // );

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Bottom()));
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Sms(
                password: '',
                email: '',
                name: '',
                birthDay: '',
                id: value['user']['_id'].toString()),
          ),
        );
      }
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint(error.toString());
      Utils.flutterToast(error.toString());
      // Utils.flutterToast('***************    error    ****************');
    });
  }

  /// send OTP By Phone Number Api Call
  Future<void> sendOTPByPhoneNumber(BuildContext context,
      {required dynamic data}) async {
    setLoading(true);
    _myRepo.sendOTPByPhoneNumberApiCall(data).then((value) {
      // code

      setLoading(false);
      debugPrint(value.toString());
      debugPrint(data['id'].toString());
      // Utils.flutterToast(value['user']['_id'].toString());
      Utils.flutterToast('Sign in successful');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Account(
              id: data['id'].toString(),
              name: '',
              email: '',
              birthDate: '',
              password: '',
              initialPage: 1),
        ),
      );
      userViewModel.saveUser(value['token'].toString());
    }).onError((error, stackTrace) {
      // onError code
      setLoading(false);

      debugPrint(error.toString());
      debugPrint(data['id'].toString());

      Utils.flutterToast(error.toString());
      // Utils.flutterToast('***************    error    ****************');
    });
  }
}

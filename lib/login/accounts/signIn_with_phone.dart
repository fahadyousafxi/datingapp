import 'dart:developer';

import 'package:dating/utils/media.dart';
import 'package:dating/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colornotifire.dart';
import '../../utils/itextfield.dart';
import '../../utils/string.dart';
import '../../view_model/auth_view_model.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({Key? key}) : super(key: key);

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Image.asset(
                "image/meets.png",
                height: height / 3,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: height / 19,
                    width: width / 2.9,
                    color: notifire.getpinkscolor,
                  ),
                ),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: height / 32,
                        width: width / 2.9,
                        color: notifire.getprimerycolor,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: height / 150),
                    child: Text(
                      CustomStrings.welcome,
                      style: TextStyle(
                          color: notifire.getdarkscolor,
                          fontSize: height / 30,
                          fontFamily: 'Gilroy Bold'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 55,
            ),
            Text(
              CustomStrings.todaySignIn,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Gilroy Medium',
                  color: notifire.getgreycolor,
                  fontSize: height / 50),
            ),
            SizedBox(
              height: height / 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 15,
                ),
                Text(
                  CustomStrings.phone,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Gilroy Bold',
                      color: notifire.getdarkpinkscolor,
                      fontSize: height / 60),
                ),
              ],
            ),
            SizedBox(
              height: height / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Customtextfild2.textField(
                  _phoneController,
                  '+44 7811122224',
                  notifire.getdarkscolor,
                  Image.asset(
                    "image/phone.png",
                  ),
                  notifire.getlightingcolor,
                  keyboardType: TextInputType.phone),
            ),
            SizedBox(
              height: height / 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 15,
                ),
                Text(
                  CustomStrings.password,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Gilroy Bold',
                      color: notifire.getdarkpinkscolor,
                      fontSize: height / 60),
                ),
              ],
            ),
            SizedBox(
              height: height / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Customtextfild2.textField(
                _passwordController,
                CustomStrings.passwords,
                notifire.getdarkscolor,
                Image.asset("image/password.png"),
                notifire.getlightingcolor,
                obscurePassword: true,
              ),
            ),
            SizedBox(
              height: height / 15.5,
            ),
            GestureDetector(
              onTap: () {
                if (_phoneController.text.isNotEmpty &&
                    _phoneController.text.length > 11 &&
                    _passwordController.text.isNotEmpty) {
                  log('${_phoneController.text} and ${_passwordController.text}');
                  Map data = {
                    'phoneNumber': _phoneController.text.toString().trim(),
                    'password': _passwordController.text.toString(),
                  };
                  authViewModel.loginApi(context, data: data);
                } else {
                  Utils.flutterToast('Enter Phone and Password');
                  print(
                      '**********************  enter Email and Password ****************');
                }
              },
              child: Container(
                height: height / 17,
                width: width / 1.3,
                decoration: BoxDecoration(
                  color: notifire.getpinkscolor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Gilroy Bold',
                        color: Colors.white,
                        fontSize: height / 48),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dating/login/accounts/account.dart';
import 'package:dating/login/accounts/signIn_with_phone.dart';
import 'package:dating/login/signIn_with_email.dart';
import 'package:dating/login/signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/google_signin_api.dart';
import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class Meeting extends StatefulWidget {
  const Meeting({Key? key}) : super(key: key);

  @override
  State<Meeting> createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {
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

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 20,
            ),
            Center(
              child: Image.asset(
                "image/meeting.png",
                height: height / 2.3,
              ),
            ),
            SizedBox(
              height: height / 200,
            ),
            Text(
              CustomStrings.meeting,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Gilroy Bold',
                  color: notifire.getdarkscolor,
                  fontSize: height / 35),
            ),
            Text(
              CustomStrings.around,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Gilroy Bold',
                  color: notifire.getdarkscolor,
                  fontSize: height / 35),
            ),
            SizedBox(
              height: height / 28,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInWithEmail(),
                  ),
                );
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
                child: Row(
                  children: [
                    SizedBox(
                      width: width / 90,
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        height: height / 17,
                        width: width / 10,
                        child: Icon(Icons.login_outlined)),
                    SizedBox(
                      width: width / 8,
                    ),
                    Text(
                      'Login with Email',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: Colors.white,
                          fontSize: height / 48),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInWithPhone()),
                );
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
                child: Row(
                  children: [
                    SizedBox(
                      width: width / 90,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: height / 17,
                      width: width / 10,
                      child: Image.asset(
                        "image/call.png",
                        color: notifire.getpinkscolor,
                      ),
                    ),
                    SizedBox(
                      width: width / 8,
                    ),
                    Text(
                      CustomStrings.login,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: Colors.white,
                          fontSize: height / 48),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            GestureDetector(
              onTap: () async {
                await GoogleSignInApi.logOut();
                final user = await GoogleSignInApi.login();
                if (user != null) {
                  Utils.flutterToast(
                      'Name: ${user.displayName} \n Email: ${user.email} ');
                  Map data = {
                    'name': user.displayName,
                    'email': user.email,
                    'token': user.id,
                  };
                  authViewModel.loginWithGoogle(context, data: data);
                } else {
                  Utils.flutterToast('Google Login Failed');
                }

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Account(
                //       name: '',
                //       email: '',
                //       birthDate: '',
                //       password: '',
                //       initialPage: 0,
                //     ),
                //   ),
                // );
              },
              child: Container(
                height: height / 17,
                width: width / 1.3,
                decoration: BoxDecoration(
                  color: notifire.getpinkscolor.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width / 90,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: height / 17,
                      width: width / 10,
                      child: Padding(
                        padding: EdgeInsets.all(height / 100),
                        child: Image.asset(
                          "image/google.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 8,
                    ),
                    Text(
                      CustomStrings.loging,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: Colors.white,
                          fontSize: height / 48),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Account(
                      name: '',
                      email: '',
                      birthDate: '',
                      password: '',
                      initialPage: 0,
                      id: '',
                    ),
                  ),
                );
              },
              child: Container(
                height: height / 17,
                width: width / 1.3,
                decoration: BoxDecoration(
                  color: notifire.getpinkscolor.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width / 90,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: height / 17,
                      width: width / 10,
                      child: Padding(
                        padding: EdgeInsets.all(height / 100),
                        child: Image.asset(
                          "image/facebook.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 8,
                    ),
                    Text(
                      CustomStrings.loginWithFacebook,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: Colors.white,
                          fontSize: height / 48),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CustomStrings.havean,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Gilroy Medium',
                      color: notifire.getgreycolor,
                      fontSize: height / 50),
                ),
                SizedBox(
                  width: width / 100,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const SignUp();
                      }),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Text(
                      CustomStrings.signup,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Gilroy Medium',
                          color: notifire.getpinkscolor,
                          fontSize: height / 50),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

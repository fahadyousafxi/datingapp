import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colornotifire.dart';
import '../../utils/custombutton.dart';
import '../../utils/media.dart';
import '../../utils/string.dart';
import '../../view_model/auth_view_model.dart';

class Verify extends StatefulWidget {
  final String? id;
  const Verify({required this.id, Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
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

  String? otp;

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
              height: height / 6,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CustomStrings.enter,
                      style: TextStyle(
                          color: notifire.getdarkspinkcolor,
                          fontSize: height / 18,
                          fontFamily: 'Gilroy Bold'),
                    ),
                    Text(
                      CustomStrings.digit,
                      style: TextStyle(
                          color: notifire.getdarkspinkcolor,
                          fontSize: height / 18,
                          fontFamily: 'Gilroy Bold'),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    Text(
                      CustomStrings.number3,
                      style: TextStyle(
                          color: notifire.getgreycolor,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                    Text(
                      CustomStrings.number4,
                      style: TextStyle(
                          color: notifire.getgreycolor,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                    SizedBox(
                      height: height / 10,
                    ),
                  ],
                ),
              ],
            ),
            animatedBorders(),
            SizedBox(
              height: height / 5,
            ),
            InkWell(
              onTap: () {
                Map data = {
                  "id": widget.id,
                  "otp": otp,
                };
                authViewModel.verifyOTPApi(context, data: data);
              },
              child: Custombutton.button(
                  CustomStrings.continues,
                  notifire.getgcolor,
                  notifire.getg2color,
                  notifire.getg3color,
                  notifire.getg4color),
            ),
            SizedBox(
              height: height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  CustomStrings.getcode,
                  style: TextStyle(
                      color: notifire.getgreycolor,
                      fontSize: height / 50,
                      fontFamily: 'Gilroy Medium'),
                ),
                InkWell(
                  onTap: () {
                    authViewModel.sendOTPApi(context,
                        data: {'id': widget.id}, id: widget.id);
                  },
                  child: Text(
                    CustomStrings.resend,
                    style: TextStyle(
                        color: notifire.getdarkpinkscolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget animatedBorders() {
    return Container(
      color: notifire.getprimerycolor,
      height: height / 12,
      width: width / 1.2,
      child: PinPut(
        onSubmit: (value) {
          otp = value;
        },
        textStyle: TextStyle(
            color: Colors.white,
            fontFamily: "Gilroy Bold",
            fontSize: height / 25),
        fieldsCount: 4,
        eachFieldWidth: width / 6.5,
        withCursor: false,
        submittedFieldDecoration: BoxDecoration(
          color: notifire.getdarkpinkscolor,
          borderRadius: BorderRadius.circular(10.0),
        ).copyWith(
          borderRadius: BorderRadius.circular(10.0),
        ),
        selectedFieldDecoration: BoxDecoration(
          color: notifire.getdarkpinkscolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        followingFieldDecoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              notifire.getgcolor,
              notifire.getg2color,
              notifire.getg3color,
              notifire.getg4color
            ],
          ),
          borderRadius: BorderRadius.circular(10.0),
        ).copyWith(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

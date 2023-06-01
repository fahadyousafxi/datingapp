import 'package:dating/login/accounts/account.dart';
import 'package:dating/utils/media.dart';
import 'package:dating/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/itextfield.dart';
import '../utils/string.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthDayController = TextEditingController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  int bDYear = DateTime.now().year - 5;
  int bDMonth = DateTime.now().month;
  int bDDay = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "image/meets.png",
              height: height / 3,
              fit: BoxFit.cover,
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
              CustomStrings.today,
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
                  CustomStrings.name,
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
                _nameController,
                CustomStrings.names,
                notifire.getdarkscolor,
                Image.asset("image/name.png"),
                notifire.getlightingcolor,
              ),
            ),
            SizedBox(
              height: height / 40,
            ),

            /// ios style calender testing by Fahad
            // SizedBox(
            //   height: 120,
            //   child: CupertinoDatePicker(
            //     mode: CupertinoDatePickerMode.date,
            //     initialDateTime: DateTime.now(),
            //     onDateTimeChanged: (DateTime newDateTime) {
            //       // Do something
            //       print('${newDateTime.month}');
            //       print('${newDateTime.year}');
            //       print('${newDateTime.day}');
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: 22,
            // ),

            Row(
              children: [
                SizedBox(
                  width: width / 15,
                ),
                Text(
                  CustomStrings.email,
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
                _emailController,
                CustomStrings.emails,
                notifire.getdarkscolor,
                Padding(
                  padding: EdgeInsets.all(height / 400),
                  child: Image.asset("image/email.png"),
                ),
                notifire.getlightingcolor,
              ),
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
                  CustomStrings.birthdate,
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
                _birthDayController,
                'dd / mm / yyyy',
                notifire.getdarkscolor,
                Image.asset(
                  "image/birthday.png",
                ),
                notifire.getlightingcolor,
              ),
            ),

            // InkWell(
            //   onTap: () {
            //     showCupertinoModalPopup(
            //       // barrierColor: Colors.red,
            //       context: context,
            //       builder: (BuildContext context) {
            //         return Container(
            //           height: 200,
            //           margin: EdgeInsets.symmetric(horizontal: 33, vertical: 0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.only(
            //               topLeft: Radius.circular(22),
            //               topRight: Radius.circular(22),
            //             ),
            //             color: notifire.getprimerycolor,
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.end,
            //             children: [
            //               // TextButton(
            //               //     onPressed: () {
            //               //       Navigator.pop(context);
            //               //     },
            //               //     child: Text('Done')),
            //               Padding(
            //                 padding: const EdgeInsets.symmetric(
            //                   vertical: 30.0,
            //                 ),
            //                 child: SizedBox(
            //                   height: 130,
            //                   child: CupertinoDatePicker(
            //                     mode: CupertinoDatePickerMode.date,
            //                     initialDateTime: DateTime.now(),
            //                     onDateTimeChanged: (DateTime newDateTime) {
            //                       // Do something
            //                       setState(() {
            //                         bDYear = newDateTime.year;
            //                         bDMonth = newDateTime.month;
            //                         bDDay = newDateTime.day;
            //                       });
            //                       if (kDebugMode) {
            //                         print('${newDateTime.year}');
            //                         print('${newDateTime.month}');
            //                         print('${newDateTime.day}');
            //                       }
            //                     },
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //         //   Container(
            //         //   height: 333,
            //         //   color: Colors.grey.shade200,
            //         // );
            //       },
            //     );
            //   },
            //   child: Container(
            //     margin: EdgeInsets.symmetric(horizontal: width / 18),
            //     height: height / 16,
            //     width: width,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: notifire.getlightingcolor,
            //     ),
            //     child: Row(
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(height / 50),
            //           child: Image.asset(
            //             "image/birthday.png",
            //           ),
            //         ),
            //         Text(
            //           '$bDDay - $bDMonth - $bDYear',
            //           textAlign: TextAlign.start,
            //           style: TextStyle(
            //
            //               // fontFamily: 'Gilroy Bold',
            //               // fontWeight: FontWeight.w400,
            //               color: notifire.getdarkscolor,
            //               fontSize: height / 60),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // calender by a button
            // Center(
            //   child: ElevatedButton(
            //       onPressed: () {
            //         showCupertinoModalPopup(
            //           // barrierColor: Colors.red,
            //           context: context,
            //           builder: (BuildContext context) {
            //             return Container(
            //               height: 250,
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(22),
            //                 color: Colors.grey.shade200,
            //               ),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.end,
            //                 children: [
            //                   TextButton(
            //                       onPressed: () {
            //                         Navigator.pop(context);
            //                       },
            //                       child: Text('Done')),
            //                   Padding(
            //                     padding:
            //                         const EdgeInsets.symmetric(vertical: 30.0),
            //                     child: SizedBox(
            //                       height: 130,
            //                       child: CupertinoDatePicker(
            //                         mode: CupertinoDatePickerMode.date,
            //                         initialDateTime: DateTime.now(),
            //                         onDateTimeChanged: (DateTime newDateTime) {
            //                           // Do something
            //                           setState(() {
            //                             bDYear = newDateTime.year;
            //                             bDMonth = newDateTime.month;
            //                             bDDay = newDateTime.day;
            //                           });
            //                           if (kDebugMode) {
            //                             print('${newDateTime.year}');
            //                             print('${newDateTime.month}');
            //                             print('${newDateTime.day}');
            //                           }
            //                         },
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             );
            //             //   Container(
            //             //   height: 333,
            //             //   color: Colors.grey.shade200,
            //             // );
            //           },
            //         );
            //       },
            //       child: Text('Testing')),
            // ),

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
              ),
            ),
            SizedBox(
              height: height / 15.5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: GestureDetector(
                onTap: () {
                  if (_nameController.text.trim().isNotEmpty &&
                      _emailController.text.trim().isNotEmpty &&
                      _birthDayController.text.trim().isNotEmpty &&
                      _passwordController.text.trim().isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Account(
                            name: _nameController.text.trim().toString(),
                            email: _emailController.text.toString().trim(),
                            birthDate:
                                _birthDayController.text.toString().trim(),
                            password:
                                _passwordController.text.toString().trim(),
                            initialPage: 0,
                          );
                        },
                      ),
                    );
                  } else {
                    Utils.flutterToast('Please fill all the fields');
                  }
                },
                child: Row(
                  children: [
                    Text(
                      CustomStrings.continues,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Gilroy Bold',
                          color: notifire.getpinkscolor,
                          fontSize: height / 40),
                    ),
                    const Spacer(),
                    Container(
                      height: height / 20,
                      width: width / 7,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
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
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
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

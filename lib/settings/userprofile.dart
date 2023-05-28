import 'dart:io';

import 'package:dating/settings/security.dart';
import 'package:dating/settings/settings.dart';
import 'package:dating/settings/vipupgrade.dart';
import 'package:dating/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/string.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late ColorNotifire notifire;
  PickedFile? imageFile;
  final int _numPages = 7;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 7.0,
      width: isActive ? 7.0 : 7.0,
      decoration: BoxDecoration(
        color: isActive
            ? notifire.getpinkscolor
            : notifire.getpinkscolor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

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
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset("image/bg.png"),
                Column(
                  children: [
                    SizedBox(
                      height: height / 9,
                    ),
                    Stack(
                      children: [
                        Center(
                          child: GestureDetector(
                            // onTap: () {
                            //   _openCamera(context);
                            // },
                            child: (imageFile == null)
                                ? Container(
                                    color: Colors.transparent,
                                    height: height / 4.5,
                                    width: width / 2,
                                    child: CircleAvatar(
                                      backgroundColor: notifire.getlightcolor,
                                      child: Container(
                                        height: height / 4.7,
                                        width: width / 2.4,
                                        decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(400),
                                          child: Image.asset(
                                            "image/profile.png",
                                            height: height / 4.7,
                                            width: width,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: height / 4.5,
                                    width: width / 2,
                                    color: Colors.transparent,
                                    child: CircleAvatar(
                                      backgroundColor: notifire.getlightcolor,
                                      child: Container(
                                        height: height / 4.7,
                                        width: width / 2.4,
                                        decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(400),
                                          child: Image.file(
                                            File(
                                              imageFile!.path,
                                            ),
                                            height: height / 4.7,
                                            width: width,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // child: ClipRRect(
                                    //   borderRadius: const BorderRadius.all(
                                    //     Radius.circular(15),
                                    //   ),
                                    //   child: Image.file(
                                    //     File(
                                    //       imageFile!.path,
                                    //     ),
                                    //     fit: BoxFit.cover,
                                    //   ),
                                    // ),
                                  ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: height / 50,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width / 1.65,
                                ),
                                Container(
                                  height: height / 28,
                                  width: width / 10,
                                  decoration: BoxDecoration(
                                      color: notifire.getlightcolor,
                                      shape: BoxShape.circle),
                                  child: Icon(Icons.edit,
                                      color: notifire.getgreycolor,
                                      size: height / 40),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Text(
                      CustomStrings.hayes,
                      style: TextStyle(
                          color: notifire.getlightcolor,
                          fontSize: height / 40,
                          fontFamily: 'Gilroy Bold'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: height / 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Settings(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: height / 13,
                                  width: width / 6,
                                  decoration: BoxDecoration(
                                    color: notifire.getlightcolor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.settings,
                                      color: notifire.getgreycolor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height / 100,
                              ),
                              Text(
                                CustomStrings.setting,
                                style: TextStyle(
                                    color: notifire.getgreycolor,
                                    fontSize: height / 55,
                                    fontFamily: 'Gilroy Bold'),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height / 50),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        // onTap: () {
                                        //   _openCamera(context);
                                        // },
                                        child: Container(
                                          height: height / 10,
                                          width: width / 3,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                notifire.getgcolor,
                                                notifire.getg2color,
                                                notifire.getg3color,
                                                notifire.getg4color
                                              ],
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: notifire.getlightcolor,
                                              size: height / 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 100,
                                      ),
                                      Text(
                                        CustomStrings.addmedia,
                                        style: TextStyle(
                                            color: notifire.getgreycolor,
                                            fontSize: height / 55,
                                            fontFamily: 'Gilroy Bold'),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: height / 15,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width / 4.5,
                                          ),
                                          Container(
                                            height: height / 32,
                                            width: width / 15,
                                            decoration: BoxDecoration(
                                              color: notifire.getlightcolor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: notifire.getpinkscolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: height / 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Security(
                                        CustomStrings.safety,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: height / 13,
                                  width: width / 6,
                                  decoration: BoxDecoration(
                                    color: notifire.getlightcolor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add_moderator,
                                      color: notifire.getgreycolor,
                                      size: height / 35,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height / 100,
                              ),
                              Text(
                                CustomStrings.safety,
                                style: TextStyle(
                                    color: notifire.getgreycolor,
                                    fontSize: height / 55,
                                    fontFamily: 'Gilroy Bold'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Container(
                height: height / 4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: notifire.getpinkscolor.withOpacity(0.3),
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: height / 10,
                      child: PageView(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: <Widget>[
                          matches(),
                          matches(),
                          matches(),
                          matches(),
                          matches(),
                          matches(),
                          matches(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Upgrade(),
                          ),
                        );
                      },
                      child: Container(
                        height: height / 20,
                        width: width / 2.5,
                        decoration: BoxDecoration(
                          color: notifire.getlightingcolor.withOpacity(0.9),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            CustomStrings.vip,
                            style: TextStyle(
                                color: notifire.getdarkspinkcolor,
                                fontSize: height / 60,
                                fontFamily: 'Gilroy Bold'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _openCamera(BuildContext context) async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //   );
  //   setState(() {
  //     imageFile = pickedFile!;
  //   });
  // }

  Widget matches() {
    return Column(
      children: [
        SizedBox(
          height: height / 30,
        ),
        Text(
          CustomStrings.getmatches,
          style: TextStyle(
              color: notifire.getdarkscolor.withOpacity(0.7),
              fontSize: height / 40,
              fontFamily: 'Gilroy Bold'),
        ),
        SizedBox(
          height: height / 100,
        ),
        Text(
          CustomStrings.boost,
          style: TextStyle(
              color: notifire.getdarkscolor.withOpacity(0.6),
              fontSize: height / 60,
              fontFamily: 'Gilroy Medium'),
        ),
      ],
    );
  }
}

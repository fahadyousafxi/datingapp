import 'package:dating/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/string.dart';

class Congratulation extends StatefulWidget {
  const Congratulation({Key? key}) : super(key: key);

  @override
  State<Congratulation> createState() => _CongratulationState();
}

class _CongratulationState extends State<Congratulation> {
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

  List img = [
    "image/like2.png",
    "image/visitor.png",
    "image/rewinds.png",
    "image/Security.png",
    "image/star2.png",
    "image/fire.png",
  ];
  List high = [
    height / 40,
    height / 30,
    height / 30,
    height / 30,
    height / 30,
    height / 30,
  ];

  List names = [
    CustomStrings.liked,
    CustomStrings.swipe,
    CustomStrings.supers,
    CustomStrings.boosts,
    CustomStrings.passport,
    CustomStrings.whoyou,
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 1.8,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    notifire.getg5color,
                    notifire.getg6color,
                    notifire.getg7color,
                    notifire.getg8color
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 18,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: height / 19,
                            width: width / 9,
                            decoration: BoxDecoration(
                              color: notifire.getpinkscolor.withOpacity(0.4),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          CustomStrings.vipcenter,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height / 40,
                              fontFamily: 'Gilroy Bold'),
                        ),
                        const Spacer(),
                        Text(
                          "History",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: height / 50,
                              fontFamily: 'Gilroy Medium'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 100,
                  ),
                  Stack(
                    children: [
                      Center(
                          child: Image.asset(
                        "image/congrats.png",
                        height: height / 6,
                      )),
                      Column(
                        children: [
                          SizedBox(
                            height: height / 15,
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset(
                                    "image/vipmember.png",
                                    height: height / 6,
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: height / 30,
                                    ),
                                    Center(
                                      child: Container(
                                        height: height / 9.5,
                                        width: width / 4,
                                        color: Colors.transparent,
                                        child: const CircleAvatar(
                                          backgroundImage:
                                              AssetImage('image/profile.png'),
                                          radius: 220,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height / 40,),
                  Text(
                    CustomStrings.congratulations,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height / 45,
                        fontFamily: 'Gilroy Bold'),
                  ),

                  SizedBox(height: height / 60,),
                  Text(
                    CustomStrings.date,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height / 60,
                        fontFamily: 'Gilroy Bold'),
                  ),
                  SizedBox(height: height / 50,),
                  Container(
                    height: height / 20,
                    width: width / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xffFF8960),
                          Color(0xffFF62A5),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        CustomStrings.renewal,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: height / 55,
                            fontFamily: 'Gilroy Bold'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 70,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("image/vipcenter.png",height: height / 30,),
                  SizedBox(width: width / 100,),
                  Text(
                    CustomStrings.privilege,
                    style: TextStyle(
                        color: notifire.getgreycolor,
                        fontSize: height / 60,
                        fontFamily: 'Gilroy Medium'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Container(
              height: height / 2,
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: img.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 18, vertical: width / 40),
                    child: Row(
                      children: [
                        Container(
                          height: height / 18,
                          width: width / 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: notifire.getdarkpinkscolor.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Image.asset(img[index], height: high[index]),
                          ),
                        ),
                        SizedBox(
                          width: width / 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              names[index],
                              style: TextStyle(
                                  color: notifire.getdarkscolor,
                                  fontSize: height / 50,
                                  fontFamily: 'Gilroy Medium'),
                            ),
                            SizedBox(
                              height: height / 200,
                            ),
                            Text(
                              CustomStrings.everyone,
                              style: TextStyle(
                                  color: notifire.getgreycolor,
                                  fontSize: height / 55,
                                  fontFamily: 'Gilroy Medium'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
          ],
        ),
      ),
    );
  }
}

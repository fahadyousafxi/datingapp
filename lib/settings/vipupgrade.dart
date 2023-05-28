import 'package:dating/settings/congratulation.dart';
import 'package:dating/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/string.dart';

class Upgrade extends StatefulWidget {
  const Upgrade({Key? key}) : super(key: key);

  @override
  State<Upgrade> createState() => _UpgradeState();
}

class _UpgradeState extends State<Upgrade> {
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
    height / 30,
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
            Stack(
              children: [
                Container(
                  height: height / 2.85,
                  width: width,
                  color: Colors.transparent,
                  child: Image(
                    image: const Svg(
                      "image/bg2.svg",
                    ),
                    height: height / 4,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
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
                            CustomStrings.vip,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: height / 40,
                                fontFamily: 'Gilroy Bold'),
                          ),
                          const Spacer(),
                          Text(
                            "Skip",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: height / 50,
                                fontFamily: 'Gilroy Medium'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Center(
                              child: Image.asset("image/starbg.png",
                                  height: height / 3)),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 8.5,
                              ),
                              Center(
                                child: Container(
                                  height: height / 7,
                                  width: width / 2,
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Center(
                                            child: Image.asset(
                                          "image/profile.png",
                                          fit: BoxFit.cover,
                                        )),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: height / 10.5,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: width / 3,
                                                ),
                                                Image.asset(
                                                  "image/vip.png",
                                                  height: height / 25,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              CustomStrings.enjoy,
              style: TextStyle(
                  color: notifire.getdarkscolor,
                  fontSize: height / 40,
                  fontFamily: 'Gilroy Medium'),
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
            GestureDetector(
              onTap: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                        backgroundColor: Colors.transparent,
                        //insetPadding: EdgeInsets.all(10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: height / 2.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: notifire.getprimerycolor),
                              padding: EdgeInsets.zero,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        child: Image.asset(
                                          "image/congratulations.png",
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: height / 17,
                                          ),
                                          Center(
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Image.asset(
                                                      "image/starbg.png",
                                                      height: height / 5),
                                                ),
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: height / 14,
                                                    ),
                                                    Center(
                                                      child: Container(
                                                        height: height / 12,
                                                        width: width / 5,
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                                shape: BoxShape
                                                                    .circle),
                                                        child: Center(
                                                          child: Stack(
                                                            children: [
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                "image/profile.png",
                                                                fit: BoxFit
                                                                    .cover,
                                                              )),
                                                              Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        height /
                                                                            23,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            width /
                                                                                7,
                                                                      ),
                                                                      Image
                                                                          .asset(
                                                                        "image/vip.png",
                                                                        height:
                                                                            height /
                                                                                35,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
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
                                  SizedBox(
                                    height: height / 80,
                                  ),
                                  Text(
                                    CustomStrings.congratulations,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 45,
                                        fontFamily: 'Gilroy Bold'),
                                  ),
                                  Text(
                                    CustomStrings.purchase,
                                    style: TextStyle(
                                        color: notifire.getgreycolor,
                                        fontSize: height / 50,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                  SizedBox(
                                    height: height / 30,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Congratulation(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: height / 18,
                                      width: width / 2,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xffd257c4),
                                            Color(0xffbb52d6),
                                            Color(0xff8c4af1),
                                            Color(0xff784df2),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: height / 50,
                                              fontFamily: 'Gilroy Medium'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      notifire.getgcolor,notifire.getg2color,notifire.getg3color,notifire.getg4color
                    ],
                  ),
                ),
                height: height / 17,
                width: width / 1.3,
                child: Center(
                  child: Text(
                    CustomStrings.getstarted,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: height / 45,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 70,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 15),
              child: Center(
                child: Text(
                  CustomStrings.subscription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontSize: height / 60,
                      fontFamily: 'Gilroy Medium'),
                ),
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
          ],
        ),
      ),
    );
  }
}

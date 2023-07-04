import 'package:dating/profile/widget_of_profile_review.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class ProfileInfo extends StatefulWidget {
  Widget child;
  Widget childIndicator;
  ProfileInfo({required this.child, required this.childIndicator, Key? key})
      : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
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

  List name = [
    CustomStrings.fitness,
    CustomStrings.cooking,
    CustomStrings.gamer,
    CustomStrings.movies,
    CustomStrings.boating,
    CustomStrings.anthem,
    CustomStrings.traveling,
    CustomStrings.athlete,
    CustomStrings.gambling,
    CustomStrings.technology,
    CustomStrings.swimming,
    CustomStrings.shopping,
    CustomStrings.videography,
    CustomStrings.art,
    CustomStrings.design,
    CustomStrings.photography,
  ];
  List interest = [
    "image/fitness.png",
    "image/cooking.png",
    "image/video.png",
    "image/movies.png",
    "image/boating.png",
    "image/shopping.png",
    "image/traveling.png",
    "image/athlete.png",
    "image/gambling.png",
    "image/technology.png",
    "image/swimming.png",
    "image/shopping.png",
    "image/videography.png",
    "image/art.png",
    "image/design.png",
    "image/photography.png"
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 1,
      itemBuilder: (context, index) => Column(
        children: [
          SizedBox(
            height: height / 30,
          ),
          Row(
            children: [
              SizedBox(
                width: width / 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CustomStrings.jamyee,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontSize: height / 40,
                        fontFamily: 'Gilroy Bold'),
                  ),
                  SizedBox(
                    height: height / 200,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "image/personal.png",
                        height: height / 60,
                      ),
                      SizedBox(
                        width: width / 50,
                      ),
                      Text(
                        CustomStrings.personal,
                        style: TextStyle(
                            color: notifire.getgreycolor,
                            fontSize: height / 60,
                            fontFamily: 'Gilroy Bold'),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Image.asset("image/msg.png", height: height / 60),
              SizedBox(
                width: width / 60,
              ),
              Text(
                "32 MILES",
                style: TextStyle(
                    color: notifire.getgreycolor,
                    fontSize: height / 60,
                    fontFamily: 'Gilroy Bold'),
              ),
              SizedBox(
                width: width / 20,
              ),
            ],
          ),
          SizedBox(
            height: height / 40,
          ),
          Row(
            children: [
              SizedBox(
                width: width / 20,
              ),
              Text(
                CustomStrings.about,
                style: TextStyle(
                    color: notifire.getdarkscolor,
                    fontSize: height / 50,
                    fontFamily: 'Gilroy Bold'),
              ),
            ],
          ),
          SizedBox(
            height: height / 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Text(
              CustomStrings.eating,
              style: TextStyle(
                  color: notifire.getgreycolor,
                  fontSize: height / 60,
                  fontFamily: 'Gilroy Medium'),
            ),
          ),
          SizedBox(
            height: height / 40,
          ),
          Row(
            children: [
              SizedBox(
                width: width / 20,
              ),
              Text(
                CustomStrings.anthem,
                style: TextStyle(
                    color: notifire.getdarkscolor,
                    fontSize: height / 50,
                    fontFamily: 'Gilroy Bold'),
              ),
            ],
          ),
          SizedBox(
            height: height / 60,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Row(
              children: [
                Container(
                  height: height / 14,
                  width: width / 6,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset("image/anthem.png"),
                  ),
                ),
                SizedBox(
                  width: width / 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          CustomStrings.martin,
                          style: TextStyle(
                              color: notifire.getdarkscolor,
                              fontSize: height / 55,
                              fontFamily: 'Gilroy Bold'),
                        ),
                        SizedBox(
                          width: width / 100,
                        ),
                        Image.asset(
                          "image/martin.png",
                          height: height / 50,
                        )
                      ],
                    ),
                    SizedBox(
                      height: height / 200,
                    ),
                    Text(
                      CustomStrings.juilet,
                      style: TextStyle(
                          color: notifire.getgreycolor,
                          fontSize: height / 65,
                          fontFamily: 'Gilroy Medium'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: height / 60,
          ),
          Row(
            children: [
              SizedBox(
                width: width / 20,
              ),
              Text(
                CustomStrings.interests,
                style: TextStyle(
                    color: notifire.getdarkscolor,
                    fontSize: height / 50,
                    fontFamily: 'Gilroy Bold'),
              ),
            ],
          ),
          SizedBox(
            height: height / 60,
          ),
          Container(
            height: height / 25,
            width: width,
            color: Colors.transparent,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: interest.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: width / 20),
                child: Column(
                  children: [
                    Container(
                      height: height / 25,
                      decoration: BoxDecoration(
                        color: notifire.getpinkscolor.withOpacity(0.4),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: width / 60),
                              child: Image.asset(
                                interest[index],
                                color: notifire.getdarkspinkcolor,
                              ),
                            ),
                            SizedBox(
                              width: width / 70,
                            ),
                            Text(
                              name[index],
                              style: TextStyle(
                                  color: notifire.getdarkscolor,
                                  fontSize: height / 50,
                                  fontFamily: 'Gilroy Bold'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 60,
          ),
          Row(
            children: [
              SizedBox(
                width: width / 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CustomStrings.review,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Bold'),
                  ),
                  SizedBox(
                    height: height / 200,
                  ),
                  Text(
                    '(4.7)',
                    style: TextStyle(
                        color: notifire.getgreycolor,
                        fontSize: height / 65,
                        fontFamily: 'Gilroy Medium'),
                  )
                ],
              ),
              SizedBox(
                width: 3,
              ),
            ],
          ),
          SizedBox(
            height: height / 20,
          ),

          WidgetOfProfileReview(
            child: widget.child,
          ),
          SizedBox(
            height: height / 20, // height /60,
          ),

          /// Comment by Fahad
          // widget.childIndicator
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  final int _numPages = 4;
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
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 6.0,
      width: isActive ? 6.0 : 6.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
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
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Image.asset(
                        "image/match11.png",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "image/match8.png",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "image/match10.png",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "image/match4.png",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 20, top: height / 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: height / 19,
                      width: width / 9,
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 2.15),
                  child: Center(
                    child: Container(
                      height: height / 30,
                      width: width / 4.5,
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 2),
                  child: Container(
                    height: height / 2,
                    width: width,
                    decoration: BoxDecoration(
                      color: notifire.getprimerycolor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: ListView.builder(
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
                                    color:
                                        notifire.getgreycolor.withOpacity(0.6),
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
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 20),
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
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 20),
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
                            height: height / 40,
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
                                        color: notifire.getpinkscolor
                                            .withOpacity(0.4),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: width / 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: width / 60),
                                              child: Image.asset(
                                                interest[index],
                                                color: notifire.getdarkspinkcolor,
                                              ),
                                            ),
                                            SizedBox(width: width / 70,),
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
    );
  }
}

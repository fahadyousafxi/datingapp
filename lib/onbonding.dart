import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/login/accounts/account.dart';
import 'package:dating/login/meeting.dart';
import 'package:dating/utils/custombutton.dart';
import 'package:dating/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/colornotifire.dart';
import 'utils/string.dart';

class Onbonding extends StatefulWidget {
  const Onbonding({Key? key}) : super(key: key);

  @override
  _OnbondingState createState() => _OnbondingState();
}

class _OnbondingState extends State<Onbonding> {
  final int _numPages = 3;

  late ColorNotifire notifire;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
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
  final List<dynamic> imageList = [
    "image/match1.png",
    "image/match2.png",
    "image/match3.png",
  ];
  final List<dynamic> image2List = [
    "image/match2.png",
    "image/match3.png",
    "image/match1.png",
  ];
  final List<dynamic> image3List = [
    "image/match3.png",
    "image/match2.png",
    "image/match1.png",
  ];

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 8.0,
      width: isActive ? 30.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive
            ? notifire.getpinkscolor
            : notifire.getpinkscolor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: notifire.getprimerycolor,
                    height: height,
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: height / 9),
                                  CarouselSlider.builder(
                                    itemCount: imageList.length,
                                    options: CarouselOptions(
                                        viewportFraction: 0.55,
                                        height: height / 2.8,
                                        autoPlay: true,
                                        autoPlayInterval:
                                            const Duration(seconds: 1),
                                        aspectRatio: 4,
                                        enlargeCenterPage: true),
                                    itemBuilder: (context, i, id) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          imageList[i],
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: height / 20),
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
                                          padding: EdgeInsets.only(
                                              top: height / 150),
                                          child: Text(
                                            CustomStrings.algorithm,
                                            style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 30,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height / 30),
                                  Text(
                                    CustomStrings.onbonding1,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy Medium',
                                        color: notifire.getgreycolor,
                                        fontSize: height / 50),
                                  ),
                                  SizedBox(
                                    height: height / 200,
                                  ),
                                  Text(
                                    CustomStrings.onbonding2,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy Medium',
                                        color: notifire.getgreycolor,
                                        fontSize: height / 50),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: height / 9),
                                  CarouselSlider.builder(
                                    itemCount: image2List.length,
                                    options: CarouselOptions(
                                        viewportFraction: 0.55,
                                        height: height / 2.8,
                                        autoPlay: true,
                                        autoPlayInterval:
                                            const Duration(seconds: 1),
                                        aspectRatio: 4,
                                        enlargeCenterPage: true),
                                    itemBuilder: (context, i, id) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          image2List[i],
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: height / 20),
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
                                          padding: EdgeInsets.only(
                                              top: height / 150),
                                          child: Text(
                                            CustomStrings.matches,
                                            style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 30,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height / 30),
                                  Text(
                                    CustomStrings.onbonding3,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy Medium',
                                        color: notifire.getgreycolor,
                                        fontSize: height / 50),
                                  ),
                                  SizedBox(
                                    height: height / 200,
                                  ),
                                  Text(
                                    CustomStrings.onbonding4,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy Medium',
                                        color: notifire.getgreycolor,
                                        fontSize: height / 50),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: height / 9),
                                  CarouselSlider.builder(
                                    itemCount: image3List.length,
                                    options: CarouselOptions(
                                        viewportFraction: 0.55,
                                        height: height / 2.8,
                                        autoPlay: true,
                                        autoPlayInterval:
                                            const Duration(seconds: 1),
                                        aspectRatio: 4,
                                        enlargeCenterPage: true),
                                    itemBuilder: (context, i, id) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          image3List[i],
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: height / 20),
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
                                          padding: EdgeInsets.only(
                                              top: height / 150),
                                          child: Text(
                                            CustomStrings.premium,
                                            style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 30,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height / 30),
                                  Text(
                                    CustomStrings.onbonding5,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy Medium',
                                        color: notifire.getgreycolor,
                                        fontSize: height / 50),
                                  ),
                                  SizedBox(
                                    height: height / 200,
                                  ),
                                  Text(
                                    CustomStrings.onbonding6,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'Gilroy Medium',
                                        color: notifire.getgreycolor,
                                        fontSize: height / 50),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _currentPage != _numPages - 1
                ? Column(
                    children: [
                      SizedBox(height: height / 1.40),
                      Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: height / 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Meeting(),
                              ),
                            );
                          },
                          child:
                              Custombutton.button(CustomStrings.createaccount,notifire.getgcolor,notifire.getg2color,notifire.getg3color,notifire.getg4color),),
                      SizedBox(
                        height: height / 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            CustomStrings.account,
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
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Account(),),);
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Text(
                                CustomStrings.signin,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: 'Gilroy Medium',
                                    color: notifire.getdarkpinkscolor,
                                    fontSize: height / 50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(height: height / 1.40),
                      Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: height / 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Meeting(),
                              ),
                            );
                          },
                          child:
                              Custombutton.button(CustomStrings.createaccount,notifire.getgcolor,notifire.getg2color,notifire.getg3color,notifire.getg4color)),
                      SizedBox(
                        height: height / 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            CustomStrings.account,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Gilroy Medium',
                                color: notifire.getgreycolor,
                                fontSize: height / 50),
                          ),
                          SizedBox(
                            width: width / 100,
                          ),
                          Text(
                            CustomStrings.signin,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Gilroy Medium',
                                color: notifire.getdarkpinkscolor,
                                fontSize: height / 50),
                          ),
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

import 'package:dating/profile/all_reviews.dart';
import 'package:dating/profile/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';

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
  final int _numPagesOfReview = 2;
  final PageController _pageController = PageController(initialPage: 0);
  final PageController _pageControllerOfReview = PageController(initialPage: 0);
  int _currentPage = 0;
  int _currentPageOfReview = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> _buildPageIndicatorOfReview() {
    List<Widget> list = [];
    for (int i = 0; i < _numPagesOfReview; i++) {
      list.add(
          i == _currentPageOfReview ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 6.0,
      width: isActive ? 7.0 : 7.0,
      decoration: BoxDecoration(
        color: isActive
            ? notifire.getpinkscolor
            : notifire.getpinkscolor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget _indicatorOfReview(bool isActive) {
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
                      child: PageView(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageControllerOfReview,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPageOfReview = page;
                          });
                        },
                        children: [
                          ProfileInfo(
                              childIndicator: Container(
                                height: height / 30,
                                width: width / 6,
                                decoration: BoxDecoration(
                                  color:
                                      notifire.getpinkscolor.withOpacity(0.3),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: _buildPageIndicatorOfReview(),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint('Next Page');
                                  _pageControllerOfReview.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const Upgrade(),
                                  //   ),
                                  // );
                                },
                                child: Container(
                                  height: height / 20,
                                  width: width / 2.5,
                                  decoration: BoxDecoration(
                                    color: notifire.getlightingcolor
                                        .withOpacity(0.9),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'View All Reviews',
                                      style: TextStyle(
                                          color: notifire.getdarkspinkcolor,
                                          fontSize: height / 60,
                                          fontFamily: 'Gilroy Bold'),
                                    ),
                                  ),
                                ),
                              )),
                          AllReview(
                              childIndicator: Container(
                            height: height / 30,
                            width: width / 6,
                            decoration: BoxDecoration(
                              color: notifire.getpinkscolor.withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicatorOfReview(),
                            ),
                          ))
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

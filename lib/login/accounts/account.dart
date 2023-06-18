import 'package:dating/bottom/bottombar.dart';
import 'package:dating/login/accounts/create_profile.dart';
import 'package:dating/login/accounts/sms.dart';
import 'package:dating/login/accounts/smsverify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colornotifire.dart';
import '../../utils/media.dart';
import '../../utils/string.dart';
import 'interests.dart';
import 'upload.dart';

class Account extends StatefulWidget {
  final String? name;
  final String? email;
  final String? birthDate;
  final String? password;
  final int? initialPage;
  final String? id;

  const Account(
      {required this.name,
      this.id,
      required this.email,
      required this.birthDate,
      required this.password,
      required this.initialPage,
      Key? key})
      : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final int _numPages = 5;

  late ColorNotifire notifire;
  // final PageController _pageController =
  //     PageController(initialPage: 0);
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
                  Expanded(
                    child: Container(
                      color: notifire.getprimerycolor,
                      child: PageView(
                        // physics: const NeverScrollableScrollPhysics(),
                        controller:
                            PageController(initialPage: widget.initialPage!),
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: [
                          Sms(
                              password: widget.password,
                              email: widget.email,
                              name: widget.name,
                              birthDay: widget.birthDate),
                          Verify(
                            id: widget.id,
                          ),
                          Interests(),
                          Media(),
                          // Idealmatch(),
                          CreateProfile()
                        ],
                      ),
                    ),
                  ),
                  _currentPage != _numPages - 1
                      ? Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 18),
                              child: Row(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: _buildPageIndicator(),
                                    ),
                                  ),
                                  const Spacer(),
                                  _currentPage == 1 || _currentPage == 0
                                      ? SizedBox()
                                      : GestureDetector(
                                          onTap: () {
                                            PageController(
                                                    initialPage:
                                                        widget.initialPage!)
                                                .nextPage(
                                                    duration: const Duration(
                                                        microseconds: 300),
                                                    curve: Curves.easeIn);
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                CustomStrings.next,
                                                style: TextStyle(
                                                    color:
                                                        notifire.getpinksscolor,
                                                    fontSize: height / 40,
                                                    fontFamily: 'Gilroy Bold'),
                                              ),
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
                                ],
                              ),
                            ),
                            SizedBox(height: height / 20),
                          ],
                        )
                      : Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: width / 18),
                              child: Row(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: _buildPageIndicator(),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    CustomStrings.next,
                                    style: TextStyle(
                                        color: notifire.getpinksscolor,
                                        fontSize: height / 40,
                                        fontFamily: 'Gilroy Bold'),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const Bottom();
                                          },
                                        ),
                                      );
                                    },
                                    child: Container(
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
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height / 20),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dating/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colornotifire.dart';
import '../../utils/string.dart';

class Interests extends StatefulWidget {
  const Interests({Key? key}) : super(key: key);

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  late ColorNotifire notifire;
  bool selected = true;
  bool selected1 = true;
  bool selected2 = true;
  bool selected3 = true;
  bool selected4 = true;
  bool selected5 = true;
  bool selected6 = true;
  bool selected7 = true;
  bool selected8 = true;
  bool selected9 = true;
  bool selected10 = true;
  bool selected11 = true;
  bool selected12 = true;
  bool selected13 = true;
  bool selected14 = true;
  bool selected15 = true;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }
  final List status = ["Sold", "On Auction", "New Product", "Has Offers"];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 15,
              ),
              Row(
                children: [
                  Container(
                    height: height / 18,
                    width: width / 9,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: notifire.getpinkscolor.withOpacity(0.2)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(height / 60),
                        child: Image.asset("image/interests.png",color: notifire.getpinkscolor,),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Text(
                    CustomStrings.interests,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontSize: height / 28,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ],
              ),
              SizedBox(
                height: height / 40,
              ),
              Text(
                CustomStrings.few,
                style: TextStyle(
                    color: notifire.getgreycolor,
                    fontSize: height / 55,
                    fontFamily: 'Gilroy Medium'),
              ),
              SizedBox(
                height: height / 200,
              ),
              Text(
                CustomStrings.users,
                style: TextStyle(
                    color: notifire.getgreycolor,
                    fontSize: height / 55,
                    fontFamily: 'Gilroy Medium'),
              ),
              SizedBox(
                height: height / 30,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: item(
                      "image/movies.png",
                      CustomStrings.movies,
                      height / 42,
                      selected ? Colors.white : notifire.getdarkpinkscolor,
                      selected ? notifire.getpinkscolor : Colors.white,
                      selected ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected1 = !selected1;
                      });
                    },
                    child: item(
                      "image/cooking.png",
                      CustomStrings.cooking,
                      height / 38,
                      selected1 ? Colors.white : notifire.getdarkpinkscolor,
                      selected1 ? notifire.getpinkscolor : Colors.white,
                      selected1 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 70,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected2 = !selected2;
                      });
                    },
                    child: item(
                      "image/book.png",
                      CustomStrings.booknerd,
                      height / 42,
                      selected2 ? Colors.white : notifire.getdarkpinkscolor,
                      selected2 ? notifire.getpinkscolor : Colors.white,
                      selected2 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected3 = !selected3;
                      });
                    },
                    child: item(
                      "image/music.png",
                      CustomStrings.musicenthusiast,
                      height / 42,
                      selected3 ? Colors.white : notifire.getdarkpinkscolor,
                      selected3? notifire.getpinkscolor : Colors.white,
                      selected3 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 70,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected4 = !selected4;
                      });
                    },
                    child: item(
                      "image/video.png",
                      CustomStrings.videogames,
                      height / 35,
                      selected4 ? Colors.white : notifire.getdarkpinkscolor,
                      selected4 ? notifire.getpinkscolor : Colors.white,
                      selected4 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected5 = !selected5;
                      });
                    },
                    child: item(
                      "image/traveling.png",
                      CustomStrings.traveling,
                      height / 40,
                      selected5 ? Colors.white : notifire.getdarkpinkscolor,
                      selected5 ? notifire.getpinkscolor : Colors.white,
                      selected5 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 70,
              ),
              Row(
                children: [
                  GestureDetector(onTap: () {
                    setState(() {
                      selected6 = !selected6;
                    });
                  },
                    child: item(
                      "image/boating.png",
                      CustomStrings.boating,
                      height / 40,
                      selected6 ? Colors.white : notifire.getdarkpinkscolor,
                      selected6 ? notifire.getpinkscolor : Colors.white,
                      selected6 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected7 = !selected7;
                      });
                    },
                    child: item(
                      "image/athlete.png",
                      CustomStrings.athlete,
                      height / 35,
                      selected7 ? Colors.white : notifire.getdarkpinkscolor,
                      selected7 ? notifire.getpinkscolor : Colors.white,
                      selected7 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 70,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected8 = !selected8;
                      });
                    },
                    child: item(
                      "image/gambling.png",
                      CustomStrings.gambling,
                      height / 35,
                      selected8 ? Colors.white : notifire.getdarkpinkscolor,
                      selected8 ? notifire.getpinkscolor : Colors.white,
                      selected8 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected9 = !selected9;
                      });
                    },
                    child: item(
                      "image/technology.png",
                      CustomStrings.technology,
                      height / 35,
                      selected9 ? Colors.white : notifire.getdarkpinkscolor,
                      selected9 ? notifire.getpinkscolor : Colors.white,
                      selected9 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 70,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected10 = !selected10;
                      });
                    },
                    child: item(
                      "image/swimming.png",
                      CustomStrings.swimming,
                      height / 40,
                      selected10 ? Colors.white : notifire.getdarkpinkscolor,
                      selected10 ? notifire.getpinkscolor : Colors.white,
                      selected10 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected11 = !selected11;
                      });
                    },
                    child: item(
                      "image/shopping.png",
                      CustomStrings.shopping,
                      height / 38,
                      selected11 ? Colors.white : notifire.getdarkpinkscolor,
                      selected11 ? notifire.getpinkscolor : Colors.white,
                      selected11 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 70,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected12 = !selected12;
                      });
                    },
                    child: item(
                      "image/videography.png",
                      CustomStrings.videography,
                      height / 35,
                      selected12 ? Colors.white : notifire.getdarkpinkscolor,
                      selected12 ? notifire.getpinkscolor : Colors.white,
                      selected12 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected13 = !selected13;
                      });
                    },
                    child: item(
                      "image/art.png",
                      CustomStrings.art,
                      height / 35,
                      selected13 ? Colors.white : notifire.getdarkpinkscolor,
                      selected13 ? notifire.getpinkscolor : Colors.white,
                      selected13 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 70,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected14 = !selected14;
                      });
                    },
                    child: item(
                      "image/design.png",
                      CustomStrings.design,
                      height / 35,
                      selected14 ? Colors.white : notifire.getdarkpinkscolor,
                      selected14 ? notifire.getpinkscolor : Colors.white,
                      selected14 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selected15 = !selected15;
                      });
                    },
                    child: item(
                      "image/photography.png",
                      CustomStrings.photography,
                      height / 35,
                      selected15 ? Colors.white : notifire.getdarkpinkscolor,
                      selected15 ? notifire.getpinkscolor : Colors.white,
                      selected15 ? notifire.getgreycolor : Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(img, txt, high, clr1, clr2, clr3) {
    return Container(
      height: height / 16,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: notifire.getpinkscolor,
            blurRadius: 20.0,
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: clr1,
      ),
      child: Row(
        children: [
          SizedBox(
            width: width / 20,
          ),
          Image.asset(img, height: high, color: clr2),
          SizedBox(
            width: width / 25,
          ),
          Text(
            txt,
            style: TextStyle(
                color: clr3, fontSize: height / 55, fontFamily: 'Gilroy Bold'),
          ),
          SizedBox(
            width: width / 20,
          ),
        ],
      ),
    );
  }
}

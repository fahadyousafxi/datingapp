import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colornotifire.dart';
import '../../utils/media.dart';
import '../../utils/string.dart';

class Idealmatch extends StatefulWidget {
  const Idealmatch({Key? key}) : super(key: key);

  @override
  State<Idealmatch> createState() => _IdealmatchState();
}

class _IdealmatchState extends State<Idealmatch> {
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

  int selectedindex = 0;
  final List high = [height / 32,height / 32,height / 25,height / 30,];
  final List name = [CustomStrings.love,CustomStrings.friends,CustomStrings.fling,CustomStrings.business,];
  final List img = ["image/love.png","image/friends.png", "image/fling.png", "image/bussiness.png",];
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
                        child: Image.asset(
                          "image/love.png",
                          color: notifire.getpinkscolor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Text(
                    CustomStrings.idealmatch,
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
                CustomStrings.hoping,
                style: TextStyle(
                    color: notifire.getgreycolor,
                    fontSize: height / 55,
                    fontFamily: 'Gilroy Medium'),
              ),
              SizedBox(
                height: height / 200,
              ),
              Text(
                CustomStrings.dating,
                style: TextStyle(
                    color: notifire.getgreycolor,
                    fontSize: height / 55,
                    fontFamily: 'Gilroy Medium'),
              ),
              SizedBox(
                height: height / 10,
              ),
          Container(
            color: notifire.getprimerycolor,
            height: height / 2.02,
            width: width,
            child: GridView.builder(
              padding: EdgeInsets.only(bottom: height / 15),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: height / 4.5,
                mainAxisExtent: width / 2.3,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: height / 50,
                mainAxisSpacing: height / 50,
              ),
              itemCount: name.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedindex = index;
                    });
                  },
                  child: matches(
                    img[index],
                    high[index],
                    name[index],
                    selectedindex == index ? notifire.getlightpinkcolor : notifire.getprimerycolor
                  ),
                );
              },
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }

  Widget matches(img, high, txt,clr) {
    return Container(
      height: height / 4.5,
      width: width / 2.3,
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: notifire.getpinkscolor,
        //     blurRadius: 10.0,
        //   ),
        // ],
        color: notifire.getlightingcolor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: clr)
      ),
      child: Column(
        children: [
          SizedBox(
            height: height / 40,
          ),
          Container(
            height: height / 10,
            width: width / 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: notifire.getpinkscolor.withOpacity(0.4),
            ),
            child: Center(
              child:
                  Image.asset(img, color: notifire.getpinkscolor, height: high),
            ),
          ),
          SizedBox(
            height: height / 35,
          ),
          Text(
            txt,
            style: TextStyle(
                color: notifire.getdarkscolor,
                fontSize: height / 45,
                fontFamily: 'Gilroy Bold'),
          ),
        ],
      ),
    );
  }
}

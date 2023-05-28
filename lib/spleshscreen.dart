import 'dart:async';
import 'package:dating/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onbonding.dart';
import 'utils/colornotifire.dart';

class Spleshscreen extends StatefulWidget {
  const Spleshscreen({Key? key}) : super(key: key);

  @override
  _SpleshscreenState createState() => _SpleshscreenState();
}

class _SpleshscreenState extends State<Spleshscreen> {
  @override
  void initState() {
    super.initState();
    getdarkmodepreviousstate();
    Timer(
      const Duration(seconds : 4),
      () => Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: const Onbonding(),
        ),
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
           notifire.isDark ?  Image.asset("image/splash2.png",height: height,width: width,fit: BoxFit.cover,) :Image.asset("image/splash.png",height: height,width: width,fit: BoxFit.cover,),
              Column(
                children: [
                  SizedBox(height: height / 3.2,),
                  Center(
                    child: Image.asset(
                      "image/splesh.png",
                      height: height / 3,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Security extends StatefulWidget {
 final String? title;
    const Security(this.title,{Key? key}) : super(key: key);

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  late ColorNotifire notifire;
  bool _switchValue = false;
  bool _switchValue1 = false;
  bool _switchValue2 = false;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 18,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
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
                        color: notifire.getpinkscolor,
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
                  SizedBox(
                    width: width / 4,
                  ),
                  Text(
                   widget.title!,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontSize: height / 40,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            profiles(
              CustomStrings.faceid,
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  trackColor: notifire.getgreycolor,
                  thumbColor: Colors.white,
                  activeColor: notifire.getpinkscolor,
                  value: _switchValue,
                  onChanged: (value) {
                    setState(
                      () {
                        _switchValue = value;
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Divider(
                color: notifire.getgreycolor.withOpacity(0.4),
                thickness: 0.6,
              ),
            ),
            profiles(
              CustomStrings.remember,
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  trackColor: notifire.getgreycolor,
                  thumbColor: Colors.white,
                  activeColor: notifire.getpinkscolor,
                  value: _switchValue1,
                  onChanged: (value) {
                    setState(
                      () {
                        _switchValue1 = value;
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Divider(
                color: notifire.getgreycolor.withOpacity(0.4),
                thickness: 0.6,
              ),
            ),
            profiles(
              CustomStrings.touchid,
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  trackColor: notifire.getgreycolor,
                  thumbColor: Colors.white,
                  activeColor: notifire.getpinkscolor,
                  value: _switchValue2,
                  onChanged: (value) {
                    setState(
                      () {
                        _switchValue2 = value;
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profiles(name, se) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 18),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(
                  color: notifire.getdarkscolor,
                  fontSize: height / 50,
                  fontFamily: 'Gilroy Bold'),
            ),
            const Spacer(),
            se,
          ],
        ),
      ),
    );
  }
}

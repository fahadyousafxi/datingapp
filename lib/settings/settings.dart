import 'package:dating/login/signup.dart';
import 'package:dating/settings/editprofile.dart';
import 'package:dating/settings/notification.dart';
import 'package:dating/settings/security.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title'

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
                  const Spacer(),
                  Text(
                    CustomStrings.settings,
                    style: TextStyle(
                        color: notifire.getdarkscolor,
                        fontSize: height / 40,
                        fontFamily: 'Gilroy Bold'),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Editprofile(),),);
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
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Editprofile(),),);
              },
              child: profiles("image/person.png",CustomStrings.editprofile,Icon(
                Icons.arrow_forward_ios,
                color: notifire.getdarkpinkscolor,
                size: 20,
              ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Divider(
                color: notifire.getgreycolor.withOpacity(0.4),
                thickness: 0.6,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Notifications(),),);
              },
              child: profiles("image/notifications.png",CustomStrings.notification,Icon(
                Icons.arrow_forward_ios,
                color: notifire.getdarkpinkscolor,
                size: 20,
              ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Divider(
                color: notifire.getgreycolor.withOpacity(0.4),
                thickness: 0.6,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   const Security( CustomStrings.security,),),);
              },
              child: profiles("image/lock.png",CustomStrings.security,Icon(
                Icons.arrow_forward_ios,
                color: notifire.getdarkpinkscolor,
                size: 20,
              ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Divider(
                color: notifire.getgreycolor.withOpacity(0.4),
                thickness: 0.6,
              ),
            ),
            profiles("image/mode.png",CustomStrings.darkmode,Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(trackColor: notifire.getgreycolor,
                thumbColor:
                Colors.white,
                activeColor: notifire.getpinkscolor,
                value: notifire.getIsDark,
                onChanged: (val) async {
                  final prefs =
                  await SharedPreferences.getInstance();
                  setState(() {
                    notifire.setIsDark = val;
                    prefs.setBool("setIsDark", val);
                  });
                },
              ),
            ),), Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Divider(
                color: notifire.getgreycolor.withOpacity(0.4),
                thickness: 0.6,
              ),
            ),
            GestureDetector(
              onTap: (){
                share();
              },
              child: profiles("image/invitepeople.png",CustomStrings.invitefriends,Icon(
                Icons.arrow_forward_ios,
                color: notifire.getdarkpinkscolor,
                size: 20,
              ),),
            ), Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Divider(
                color: notifire.getgreycolor.withOpacity(0.4),
                thickness: 0.6,
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUp(),),);
              },
              child: profiles("image/logout.png",CustomStrings.logout,Icon(
                Icons.arrow_forward_ios,
                color: notifire.getprimerycolor,
                size: 20,
              ),),
            ),
          ],
        ),
      ),
    );
  }

  Widget profiles(img,name,se) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 18),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              height: height / 15,
              width: width / 7,
              color: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: notifire.getpinkscolor.withOpacity(0.4),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(height / 50),
                    child: Image.asset(
                      img,
                      color: notifire.getpinkscolor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width / 40,
            ),
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

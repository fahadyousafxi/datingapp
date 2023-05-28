import 'package:dating/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colornotifire.dart';
import '../../utils/media.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
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
                        color: notifire.getpinkscolor.withOpacity(0.4),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: notifire.getdarkpinkscolor,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    "image/profile.png",
                    height: height / 15,
                  ),
                  const Spacer(),
                  Container(
                    height: height / 19,
                    width: width / 9,
                    decoration: BoxDecoration(
                      color: notifire.getpinkscolor.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(height / 80),
                        child: Image.asset(
                          "image/block.png",
                          color: notifire.getdarkpinkscolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 80,
            ),
            Text(
              CustomStrings.catie,
              style: TextStyle(
                  color: notifire.getdarkscolor,
                  fontSize: height / 40,
                  fontFamily: 'Gilroy Bold'),
            ),
            Text(
              CustomStrings.active,
              style: TextStyle(
                  color: notifire.getgreycolor,
                  fontSize: height / 75,
                  fontFamily: 'Gilroy Medium'),
            ),
            SizedBox(
              height: height / 40,
            ),
            Row(
              children: [
                Container(
                  color: notifire.getgreycolor,
                  height: height / 1000,
                  width: width / 4.5,
                ),
                const Spacer(),
                Text(
                  CustomStrings.matched,
                  style: TextStyle(
                      color: notifire.getgreycolor,
                      fontSize: height / 75,
                      fontFamily: 'Gilroy Medium'),
                ),
                const Spacer(),
                Container(
                  color: notifire.getgreycolor,
                  height: height / 1000,
                  width: width / 4.5,
                ),
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CATIE  2:56 PM",
                        style: TextStyle(
                            color: notifire.getgreycolor,
                            fontSize: height / 80,
                            fontFamily: 'Gilroy Medium'),
                      ),
                      SizedBox(
                        height: height / 90,
                      ),
                      Container(
                        height: height / 12,
                        width: width / 1.12,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: notifire.getlightcolor,
                          border: Border.all(
                            color: notifire.getpinkscolor.withOpacity(0.4),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 40),
                          child: Center(
                            child: Text(
                              CustomStrings.chat1,
                              style: TextStyle(
                                color: notifire.getdarkscolor,
                                fontFamily: 'Gilroy Medium',
                                fontSize: height / 55,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "TRAViS  3:02 PM",
                        style: TextStyle(
                            color: notifire.getgreycolor,
                            fontSize: height / 80,
                            fontFamily: 'Gilroy Medium'),
                      ),
                      SizedBox(
                        height: height / 90,
                      ),
                      Container(
                        height: height / 12,
                        width: width / 1.12,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: notifire.getpinkscolor,
                          border: Border.all(color: notifire.getpinkscolor),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 40),
                          child: Center(
                            child: Text(
                              CustomStrings.chat2,
                              style: TextStyle(
                                color: notifire.getlightcolor,
                                fontFamily: 'Gilroy Medium',
                                fontSize: height / 55,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CATIE  3:25 PM",
                        style: TextStyle(
                            color: notifire.getgreycolor,
                            fontSize: height / 80,
                            fontFamily: 'Gilroy Medium'),
                      ),
                      SizedBox(
                        height: height / 90,
                      ),
                      Container(
                        height: height / 12,
                        width: width / 1.12,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: notifire.getlightcolor,
                            border: Border.all(color: notifire.getpinkscolor)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 40),
                          child: Center(
                            child: Text(
                              CustomStrings.chat3,
                              style: TextStyle(
                                color: notifire.getdarkscolor,
                                fontFamily: 'Gilroy Medium',
                                fontSize: height / 55,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "TRAViS  5:07 PM",
                        style: TextStyle(
                            color: notifire.getgreycolor,
                            fontSize: height / 80,
                            fontFamily: 'Gilroy Medium'),
                      ),
                      SizedBox(
                        height: height / 90,
                      ),
                      Container(
                        height: height / 12,
                        width: width / 1.12,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: notifire.getpinkscolor,
                          border: Border.all(color: notifire.getpinkscolor),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 40),
                          child: Center(
                            child: Text(
                              CustomStrings.chat4,
                              style: TextStyle(
                                color: notifire.getlightcolor,
                                fontFamily: 'Gilroy Medium',
                                fontSize: height / 55,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CATIE  5:36 PM",
                        style: TextStyle(
                            color: notifire.getgreycolor,
                            fontSize: height / 80,
                            fontFamily: 'Gilroy Medium'),
                      ),
                      SizedBox(
                        height: height / 90,
                      ),
                      Container(
                        height: height / 20,
                        width: width / 1.7,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: notifire.getlightcolor,
                            border: Border.all(color: notifire.getpinkscolor)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 40),
                          child: Center(
                            child: Text(
                              CustomStrings.chat5,
                              style: TextStyle(
                                color: notifire.getdarkscolor,
                                fontFamily: 'Gilroy Medium',
                                fontSize: height / 55,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 60,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Container(
                child: TextField(
                  style: TextStyle(fontSize: 15.0, color: notifire.getdarkscolor,),
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(height / 100),
                      child: Image.asset("image/button.png"),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Message..',
                    contentPadding: EdgeInsets.only(left: height / 60,top: height / 55),
                    focusedBorder: OutlineInputBorder(
                      borderSide:  BorderSide(color: notifire.getpinkscolor.withOpacity(0.4),),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:  BorderSide(color: notifire.getpinkscolor.withOpacity(0.4),),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30.0),),
                    color: Colors.white,
                border: Border.all(color: notifire.getpinkscolor.withOpacity(0.4),),
                ),
                width: width,
                height: height / 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
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

  String seconddropdownvalue = 'Male';
  var seconditems = [
    'Male',
    'Female',
  ];
  String firstdropdownvalue = '24';
  var firstitems = [
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
  ];

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
                    CustomStrings.editprofile,
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
            Padding(
              padding: EdgeInsets.only(left: width / 15),
              child: Row(
                children: [
                  Text(
                    CustomStrings.fullname,
                    style: TextStyle(
                        color: notifire.getgreycolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Container(
                child: TextField(
                  style:
                      TextStyle(fontSize: 15.0, color: notifire.getdarkscolor),
                  decoration: InputDecoration(
                    hintText: 'Full name',
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 12.0, top: 0.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: notifire.getdarkpinkscolor),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: notifire.getdarkpinkscolor),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                width: width,
                height: height / 20,
              ),
            ),
            SizedBox(
              height: height / 70,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 15),
              child: Row(
                children: [
                  Text(
                    CustomStrings.emaill,
                    style: TextStyle(
                        color: notifire.getgreycolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            textfields(CustomStrings.emaill, "image/mail.png"),
            SizedBox(
              height: height / 70,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 15),
              child: Row(
                children: [
                  Text(
                    CustomStrings.pnumber,
                    style: TextStyle(
                        color: notifire.getgreycolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            textfields(CustomStrings.pnumber, "image/phone.png"),
            SizedBox(
              height: height / 70,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width / 15),
                      child: Row(
                        children: [
                          Text(
                            CustomStrings.gender,
                            style: TextStyle(
                                color: notifire.getgreycolor,
                                fontSize: height / 50,
                                fontFamily: 'Gilroy Bold'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 100,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width / 18),
                      child: Container(
                        height: height / 20,
                        width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.7),
                          border: Border.all(color: notifire.getdarkpinkscolor),
                        ),
                        child: Center(
                          child: DropdownButton(
                            underline: const SizedBox(),
                            value: seconddropdownvalue,
                            icon: Row(
                              children: [
                                SizedBox(width: width / 200),
                                Padding(
                                  padding: EdgeInsets.only(left: width / 6),
                                  child: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: height / 30,
                                    color: notifire.getgreycolor,
                                  ),
                                ),
                              ],
                            ),
                            items: seconditems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: Text(
                                  seconditems,
                                  style: TextStyle(
                                      color: notifire.getdarkscolor,
                                      fontSize: height / 60,
                                      fontFamily: 'Gilroy Medium'),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                seconddropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width / 50),
                      child: Row(
                        children: [
                          Text(
                            CustomStrings.age,
                            style: TextStyle(
                                color: notifire.getgreycolor,
                                fontSize: height / 50,
                                fontFamily: 'Gilroy Bold'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 100,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width / 18),
                      child: Container(
                        height: height / 20,
                        width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.7),
                          border: Border.all(color: notifire.getdarkpinkscolor),
                        ),
                        child: Center(
                          child: DropdownButton(
                            underline: const SizedBox(),
                            value: firstdropdownvalue,
                            icon: Row(
                              children: [
                                SizedBox(width: width / 200),
                                Padding(
                                  padding: EdgeInsets.only(left: width / 4),
                                  child: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: height / 30,
                                    color: notifire.getgreycolor,
                                  ),
                                ),
                              ],
                            ),
                            items: firstitems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: Text(
                                  seconditems,
                                  style: TextStyle(
                                      color: notifire.getdarkscolor,
                                      fontSize: height / 60,
                                      fontFamily: 'Gilroy Medium'),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                firstdropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 70,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 15),
              child: Row(
                children: [
                  Text(
                    CustomStrings.about,
                    style: TextStyle(
                        color: notifire.getgreycolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Container(
                child: TextField(
                  maxLines: 3,
                  style:
                      TextStyle(fontSize: 15.0, color: notifire.getdarkscolor),
                  decoration: InputDecoration(
                    hintText: 'About',
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 12.0, top: 0.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: notifire.getdarkpinkscolor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: notifire.getdarkpinkscolor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                width: width,
                height: height / 12,
              ),
            ),
            SizedBox(
              height: height / 70,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 15),
              child: Row(
                children: [
                  Text(
                    CustomStrings.interest,
                    style: TextStyle(
                        color: notifire.getgreycolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            textfields(CustomStrings.interest, "image/edit.png"),
            SizedBox(
              height: height / 70,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 15),
              child: Row(
                children: [
                  Text(
                    CustomStrings.address,
                    style: TextStyle(
                        color: notifire.getgreycolor,
                        fontSize: height / 50,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 100,
            ),
            textfields(CustomStrings.address, "image/locations.png"),
            SizedBox(
              height: height / 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 18),
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffff6a95),
                        Color(0xffff608e),
                        Color(0xfffe4d82),
                        Color(0xffff427b),
                      ],
                    ),
                  ),
                  height: height / 17,
                  width: width,
                  child: Center(
                    child: Text(
                      CustomStrings.savechanges,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height / 45,
                          fontFamily: 'Gilroy Bold'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textfields(txt, img) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 18),
      child: Container(
        child: TextField(
          style: TextStyle(fontSize: 15.0, color: notifire.getdarkscolor),
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.all(height / 90),
              child: Image(
                image: AssetImage(img),
              ),
            ),
            hintText: txt,
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 12.0, top: 0.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: notifire.getdarkpinkscolor),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: notifire.getdarkpinkscolor),
              borderRadius: BorderRadius.circular(25.7),
            ),
          ),
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        width: width,
        height: height / 20,
      ),
    );
  }
}

import 'package:dating/bottom/matches/viewall.dart';
import 'package:dating/profile/profile.dart';
import 'package:dating/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colornotifire.dart';
import '../../utils/string.dart';

class Matches extends StatefulWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
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

  List img = [
    "image/match2.png",
    "image/match3.png",
    "image/match7.png",
    "image/match8.png",
    "image/match9.png"
  ];

  List imgs = [
    "image/match12.png",
    "image/match11.png",
    "image/match10.png",
    "image/match9.png",
    "image/match8.png",
    "image/match7.png",
    "image/match6.png",
    "image/match5.png"
  ];

  List miles = [
    "4 miles",
    "22 miles",
    "8 miles",
    "76 miles",
    "4 miles",
    "22 miles",
    "8 miles",
    "76 miles",
  ];
  List matches = [
    CustomStrings.beth,
    CustomStrings.quin,
    CustomStrings.skylar,
    CustomStrings.steph,
    CustomStrings.beth,
    CustomStrings.quin,
    CustomStrings.skylar,
    CustomStrings.steph
  ];

  var seconditems = [
    'Popular',
    'Popular1',
    'Popular2',
  ];

  List names = [
    CustomStrings.photography,
    CustomStrings.nature,
    CustomStrings.music,
    CustomStrings.writing,
    CustomStrings.fashion,
  ];

  List items = [
    " 3.2k People",
    " 9.8k People",
    " 4.7k People",
    " 379 People",
    " 657 People",
  ];

  List images = [
    "image/match11.png",
    "image/match4.png",
    "image/match8.png",
    "image/match10.png",
    "image/match11.png",
  ];

  List disimage = [
    "image/match7.png",
    "image/match1.png",
    "image/match3.png",
    "image/match4.png",
    "image/match5.png",
  ];

  List away = [
    "16 km away",
    "4.8 km away",
    "2.2 km away",
    "17 km away",
    "20 km away",
  ];

  List country = [
    "BERLIN",
    "MUNICH",
    "HANOVER",
    "BERLIN",
    "GERMANY",
  ];

  List name = [
    "Halima, 19",
    "Vanessa, 18",
    "James, 20",
    "Vani, 24",
    "Sariya, 19",
  ];
  String seconddropdownvalue = 'Popular';

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
            Row(
              children: [
                SizedBox(
                  width: width / 20,
                ),
                Text(
                  CustomStrings.discover,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontSize: height / 40,
                      fontFamily: 'Gilroy Bold'),
                ),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            Row(
              children: [
                Container(
                  height: height / 4,
                  width: width,
                  color: notifire.getprimerycolor,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: disimage.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: width / 20),

                        child: Container(
                          height: height / 4,
                          width: width / 3,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(22),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(22),
                            ),
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Profile(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    disimage[index],
                                    width: width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: height / 80,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width / 40,
                                        ),
                                        Container(
                                          height: height / 40,
                                          width: width / 10,
                                          decoration: BoxDecoration(
                                            color: notifire.getpinkscolor,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            border: Border.all(
                                              color: notifire.getdarkpinkscolor,
                                              width: 2,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              CustomStrings.news,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: height / 60,
                                                  fontFamily: 'Gilroy Bold'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height / 9,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      height: height / 30,
                                      width: width / 4.5,
                                      child: Center(
                                        child: Text(
                                          away[index],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: height / 60,
                                              fontFamily: 'Gilroy Medium'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height / 300,
                                    ),
                                    Text(
                                      name[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: height / 50,
                                          fontFamily: 'Gilroy Bold'),
                                    ),
                                    SizedBox(
                                      height: height / 300,
                                    ),
                                    Text(
                                      country[index],
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.4),
                                          fontSize: height / 60,
                                          fontFamily: 'Gilroy Medium'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 20,
                ),
                Text(
                  CustomStrings.newmatches,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontSize: height / 40,
                      fontFamily: 'Gilroy Bold'),
                ),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            Row(
              children: [
                Container(
                  height: height / 3,
                  width: width,
                  color: notifire.getprimerycolor,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: width / 20),
                        child: Container(
                          height: height / 3,
                          width: width / 2,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(22),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(22)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const Profile();
                                    },
                                  ),
                                );
                              },
                              child: Image.asset(
                                img[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 20,
                ),
                Text(
                  CustomStrings.allmatches,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontSize: height / 40,
                      fontFamily: 'Gilroy Bold'),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ViewAll();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: height / 35,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        CustomStrings.viewall,
                        style: TextStyle(
                            color: notifire.getdarkpinkscolor,
                            fontSize: height / 55,
                            fontFamily: 'Gilroy Bold'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 20,
                ),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            Row(
              children: [
                Container(
                  height: height / 4.5,
                  width: width,
                  color: notifire.getprimerycolor,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: width / 20),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Profile(),
                                  ),
                                );
                              },
                              child: Container(
                                //height: height / 12,
                                width: width / 4.8,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(22),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(22),
                                  ),
                                  child: Image.asset(
                                    imgs[index],
                                    height: height / 7,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 100,
                            ),
                            Text(
                              matches[index],
                              style: TextStyle(
                                  fontFamily: 'Gilroy Bold',
                                  fontSize: height / 50,
                                  color: notifire.getdarkscolor),
                            ),
                            SizedBox(
                              height: height / 200,
                            ),
                            Text(
                              miles[index],
                              style: TextStyle(
                                  fontFamily: 'Gilroy Medium',
                                  fontSize: height / 60,
                                  color: notifire.getgreycolor),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 20,
                ),
                Text(
                  CustomStrings.discoverby,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontSize: height / 40,
                      fontFamily: 'Gilroy Bold'),
                ),
                const Spacer(),
                Center(
                  child: DropdownButton(
                    underline: const SizedBox(),
                    value: seconddropdownvalue,
                    icon: Row(
                      children: [
                        SizedBox(width: width / 200),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: height / 40,
                          color: notifire.getgreycolor,
                        ),
                      ],
                    ),
                    items: seconditems.map((String seconditems) {
                      return DropdownMenuItem(
                        value: seconditems,
                        child: Text(
                          seconditems,
                          style: TextStyle(
                              color: notifire.getgreycolor,
                              fontSize: 13,
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
                SizedBox(
                  width: width / 20,
                ),
              ],
            ),
            SizedBox(
              height: height / 80,
            ),
            Container(
              height: height / 1.8,
              color: Colors.transparent,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) =>
                    interest(images[index], names[index], items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget interest(img, name, name2) {
    return Column(
      children: [
        SizedBox(
          height: height / 200,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profile(),
                ),
              );
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            CustomStrings.interested,
                            style: TextStyle(
                                color: notifire.getdarkscolor,
                                fontSize: height / 60,
                                fontFamily: 'Gilroy Bold'),
                          ),
                          SizedBox(
                            width: width / 100,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                color: notifire.getdarkpinkscolor,
                                fontSize: height / 60,
                                fontFamily: 'Gilroy Bold'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: height / 28,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.asset(
                                "image/profile.png",
                                height: height / 30,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width / 20,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: height / 28,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Image.asset(
                                        "image/profile.png",
                                        height: height / 30,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width / 20,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            height: height / 28,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Image.asset(
                                                "image/profile.png",
                                                height: height / 30,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: width / 20,
                                              ),
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: height / 28,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.white,
                                                            shape: BoxShape
                                                                .circle),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: Image.asset(
                                                        "image/profile.png",
                                                        height: height / 30,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                name2,
                                style: TextStyle(
                                  color: notifire.getgreycolor,
                                  fontSize: height / 60,
                                  fontFamily: 'Gilroy Bold',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: height / 14,
                    width: width / 4.7,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Image.asset(
                          img,
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: height / 100,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: Divider(
            color: notifire.getgreycolor,
          ),
        ),
      ],
    );
  }
}

import 'package:dating/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../profile/profile.dart';
import '../../utils/colornotifire.dart';
import '../../utils/string.dart';
import '../inbox/chat.dart';

class Like extends StatefulWidget {
  const Like({Key? key}) : super(key: key);

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
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
    "image/match1.png",
    "image/match2.png",
    "image/match3.png",
    "image/match5.png",
    "image/match6.png",
    "image/match7.png",
    "image/match8.png",
  ];

  List date = [
    "Jane, 19",
    "Ali, 19",
    "Joy, 22",
    "Ali, 19",
    "Skylar, 23",
    "Jane, 19",
    "Joy, 22",
  ];

  List miles = [
    "16 miles",
    "7 miles",
    "22 miles",
    "7 miles",
    "8 miles",
    "4 miles",
    "7 miles",
  ];

  var seconditems = [
    'People near by',
    'People near by1',
    'People near by2',
  ];
  String selected = "";
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": CustomStrings.makefriends,
    },
    {
      "id": 1,
      "value": false,
      "title": CustomStrings.datings,
    },
  ];

  List checkList2Items = [
    {
      "id": 0,
      "value": false,
      "title": CustomStrings.makefriends,
    },
    {
      "id": 1,
      "value": false,
      "title": CustomStrings.datings,
    },
    {
      "id": 2,
      "value": false,
      "title": CustomStrings.datings,
    },
    {
      "id": 3,
      "value": false,
      "title": CustomStrings.datings,
    },
  ];



  String seconddropdownvalue = 'People near by';


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
                  SizedBox(
                    width: width / 5,
                  ),
                  Text(
                    CustomStrings.like,
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
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Container(
                color: Colors.transparent,
                height: height / 1.1,
                width: width,
                child: GridView.builder(
                    padding: EdgeInsets.only(bottom: height / 15),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: height / 3.5,
                      mainAxisExtent: height / 3.7,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: height / 50,
                      mainAxisSpacing: height / 50,
                    ),
                    itemCount: img.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Stack(
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
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          img[index],
                                        ),
                                        fit: BoxFit.cover),
                                    color: Colors.transparent,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(22),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: height / 4.8,
                                    ),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        GestureDetector(
                                            onTap: () {
                                              showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  //insetPadding: EdgeInsets.all(10),
                                                  child: Stack(
                                                    // overflow: Overflow.visible,
                                                    alignment: Alignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                        width: width / 1.3,
                                                        height: height / 2,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color: notifire
                                                                .getprimerycolor),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        child: Column(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                topRight: Radius
                                                                    .circular(
                                                                        15),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Image.asset(
                                                                    "image/itsmatch.png",
                                                                    height:
                                                                        height /
                                                                            3.5,
                                                                    width:
                                                                        width,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: width /
                                                                            4,
                                                                        top: height /
                                                                            11),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        CircleAvatar(
                                                                          backgroundColor:
                                                                              Colors.white,
                                                                          radius:
                                                                              height / 14,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.only(
                                                                              top: height / 200,
                                                                              left: width / 160),
                                                                          child:
                                                                              Image.asset(
                                                                            "image/profile.png",
                                                                            height:
                                                                                height / 7.5,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height / 80,
                                                            ),
                                                            Text(
                                                              CustomStrings
                                                                  .lauragilbert,
                                                              style: TextStyle(
                                                                  color: notifire
                                                                      .getdarkscolor,
                                                                  fontSize:
                                                                      height /
                                                                          45,
                                                                  fontFamily:
                                                                      'Gilroy Bold'),
                                                            ),
                                                            Text(
                                                              CustomStrings.usa,
                                                              style: TextStyle(
                                                                  color: notifire
                                                                      .getgreycolor,
                                                                  fontSize:
                                                                      height /
                                                                          50,
                                                                  fontFamily:
                                                                      'Gilroy Medium'),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height / 30,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const Chat(),
                                                                  ),
                                                                );
                                                              },
                                                              child: Container(
                                                                height:
                                                                    height / 18,
                                                                width:
                                                                    width / 2,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .bottomLeft,
                                                                    end: Alignment
                                                                        .bottomRight,
                                                                    colors: [
                                                                      Color(
                                                                          0xffd257c4),
                                                                      Color(
                                                                          0xffbb52d6),
                                                                      Color(
                                                                          0xff8c4af1),
                                                                      Color(
                                                                          0xff784df2),
                                                                    ],
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            30),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    CustomStrings
                                                                        .send,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            height /
                                                                                50,
                                                                        fontFamily:
                                                                            'Gilroy Medium'),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  height / 80,
                                                            ),
                                                            Text(
                                                              CustomStrings
                                                                  .keepplaying,
                                                              style: TextStyle(
                                                                  color: notifire
                                                                      .getgreycolor
                                                                      .withOpacity(
                                                                          0.7),
                                                                  fontSize:
                                                                      height /
                                                                          60,
                                                                  fontFamily:
                                                                      'Gilroy Medium'),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Image.asset(
                                              "image/like.png",
                                              height: height / 40,
                                              color: notifire.getdarkpinkscolor,
                                            )),
                                        SizedBox(
                                          width: width / 30,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 5,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        date[index],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: 'Gilroy Bold',
                                            color: Colors.white,
                                            fontSize: height / 45),
                                      ),
                                      Text(
                                        miles[index],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontFamily: 'Gilroy Medium',
                                            color: Colors.white,
                                            fontSize: height / 60),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

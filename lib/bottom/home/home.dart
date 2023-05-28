import 'package:dating/bottom/home/like.dart';
import 'package:dating/utils/media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../utils/colornotifire.dart';
import '../../utils/string.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> img = [
    'image/match1.png',
    'image/match2.png',
    'image/match3.png',
    'image/match4.png',
    'image/match5.png',
    'image/match6.png',
    'image/match7.png',
    'image/match8.png',
    'image/match9.png',
    'image/match10.png',
    'image/match11.png',
    'image/match12.png',
  ];

  final List<String> name = [
    CustomStrings.allie,
    CustomStrings.alligen,
    CustomStrings.tapsi,
    CustomStrings.dutto,
    CustomStrings.lara,
    CustomStrings.kina,
    CustomStrings.luccie,
    CustomStrings.susya,
    CustomStrings.kriti,
    CustomStrings.jasmee,
    CustomStrings.ukti,
    CustomStrings.rubi,
  ];

  final List<String> distances = [
    CustomStrings.distances,
    CustomStrings.distances1,
    CustomStrings.distances2,
    CustomStrings.distances3,
    CustomStrings.distances4,
    CustomStrings.distances5,
    CustomStrings.distances6,
    CustomStrings.distances7,
    CustomStrings.distances8,
    CustomStrings.distances5,
    CustomStrings.distances3,
    CustomStrings.distances2,
  ];

  @override
  void initState() {
    swipemethod();
    super.initState();
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

  var seconditems = ['Germany', 'Canada', 'U.K', 'India'];
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

  bool _switchValue = false;

  double _currentSliderValue = 10;

  RangeValues _currentRangeValues = const RangeValues(20, 25);
  String seconddropdownvalue = 'Germany';

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      key: _scaffoldKey,
      body: Column(
        children: [
          SizedBox(
            height: height / 18,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height / 30,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset(
                            "image/location.png",
                            height: height / 50,
                          ),
                          SizedBox(
                            width: width / 100,
                          ),
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
                                    color: notifire.getpinkscolor,
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
                        ],
                      ),
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
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Like(),
                      ),
                    );
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
                      child: Padding(
                        padding: EdgeInsets.all(height / 70),
                        child: Image.asset(
                          "image/like.png",
                          color: notifire.getdarkpinkscolor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 50,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<dynamic>(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0)),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext bc) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Wrap(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: notifire.getprimerycolor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                  ),
                                  height: height / 1.4,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height / 80,
                                      ),
                                      Center(
                                        child: Container(
                                          height: height / 90,
                                          width: width / 7,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            color: notifire.getgreycolor
                                                .withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 80,
                                      ),
                                      Text(
                                        CustomStrings.filters,
                                        style: TextStyle(
                                            color: notifire.getdarkscolor,
                                            fontSize: height / 40,
                                            fontFamily: 'Gilroy Bold'),
                                      ),
                                      SizedBox(
                                        height: height / 80,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width / 20),
                                        child: Row(
                                          children: [
                                            Text(
                                              CustomStrings.location,
                                              style: TextStyle(
                                                  color: notifire.getdarkscolor,
                                                  fontSize: height / 50,
                                                  fontFamily: 'Gilroy Bold'),
                                            ),
                                            const Spacer(),
                                            Center(
                                              child: DropdownButton(
                                                underline: const SizedBox(),
                                                value: seconddropdownvalue,
                                                icon: Row(
                                                  children: [
                                                    SizedBox(
                                                        width: width / 200),
                                                    Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: height / 40,
                                                      color:
                                                          notifire.getgreycolor,
                                                    ),
                                                  ],
                                                ),
                                                items: seconditems
                                                    .map((String seconditems) {
                                                  return DropdownMenuItem(
                                                    value: seconditems,
                                                    child: Text(
                                                      seconditems,
                                                      style: TextStyle(
                                                          color: notifire
                                                              .getgreycolor,
                                                          fontSize: 13,
                                                          fontFamily:
                                                              'Gilroy Medium'),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    seconddropdownvalue =
                                                        newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width / 20),
                                        child: Divider(
                                          color: notifire.getpinkscolor
                                              .withOpacity(0.4),
                                          thickness: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 100,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Text(
                                            CustomStrings.preferences,
                                            style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 50,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: width / 40),
                                        child: Row(
                                          children: List.generate(
                                            checkListItems.length,
                                            (index) => Container(
                                              color: Colors.transparent,
                                              width: width / 2.5,
                                              child: CheckboxListTile(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                side: MaterialStateBorderSide
                                                    .resolveWith(
                                                  (states) => BorderSide(
                                                      width: 1.0,
                                                      color: notifire
                                                          .getgreycolor),
                                                ),
                                                checkColor: Colors.white,
                                                activeColor:
                                                    notifire.getdarkpinkscolor,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                contentPadding: EdgeInsets.zero,
                                                title: Text(
                                                  checkListItems[index]
                                                      ["title"],
                                                  style: TextStyle(
                                                      color:
                                                          notifire.getgreycolor,
                                                      fontSize: height / 60,
                                                      fontFamily:
                                                          'Gilroy Medium'),
                                                ),
                                                value: checkListItems[index]
                                                    ["value"],
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      for (var element
                                                          in checkListItems) {
                                                        element["value"] =
                                                            false;
                                                      }
                                                      checkListItems[index]
                                                          ["value"] = value;
                                                      selected =
                                                          "${checkListItems[index]["id"]}, ${checkListItems[index]["title"]}, ${checkListItems[index]["value"]}";
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width / 20),
                                        child: Divider(
                                          color: notifire.getpinkscolor
                                              .withOpacity(0.4),
                                          thickness: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 100,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Text(
                                            CustomStrings.distance,
                                            style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 50,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "${_currentSliderValue.round().toString()} Kg",
                                            style: TextStyle(
                                                color:
                                                    notifire.getdarkpinkscolor,
                                                fontSize: height / 60,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                        ],
                                      ),
                                      Slider(
                                        value: _currentSliderValue,
                                        max: 100,
                                        activeColor: notifire.getdarkpinkscolor,
                                        inactiveColor: notifire.getpinkscolor
                                            .withOpacity(0.4),
                                        //divisions: 5,
                                        label: _currentSliderValue
                                            .round()
                                            .toString(),
                                        onChanged: (double value) {
                                          setState(() {
                                            _currentSliderValue = value;
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width / 20),
                                        child: Divider(
                                          color: notifire.getpinkscolor
                                              .withOpacity(0.4),
                                          thickness: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 100,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Text(
                                            CustomStrings.age,
                                            style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 50,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                          const Spacer(),
                                          Text(
                                            _currentRangeValues.start
                                                .round()
                                                .toString(),
                                            style: TextStyle(
                                                color:
                                                    notifire.getdarkpinkscolor,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                          Text(
                                            " : ",
                                            style: TextStyle(
                                                color:
                                                    notifire.getdarkpinkscolor),
                                          ),
                                          Text(
                                            _currentRangeValues.end
                                                .round()
                                                .toString(),
                                            style: TextStyle(
                                                color:
                                                    notifire.getdarkpinkscolor,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          RangeSlider(
                                            activeColor:
                                                notifire.getdarkpinkscolor,
                                            inactiveColor: notifire
                                                .getpinkscolor
                                                .withOpacity(0.4),
                                            values: _currentRangeValues,
                                            min: 0,
                                            //divisions: 20,
                                            max: 100,
                                            // labels: RangeLabels(
                                            //   _currentRangeValues.start
                                            //       .round()
                                            //       .toString(),
                                            //   _currentRangeValues.end
                                            //       .round()
                                            //       .toString(),
                                            // ),
                                            onChanged: (RangeValues values) {
                                              setState(() {
                                                _currentRangeValues = values;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width / 20),
                                        child: Divider(
                                          color: notifire.getpinkscolor
                                              .withOpacity(0.4),
                                          thickness: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 100,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Text(
                                            CustomStrings.onlinenow,
                                            style: TextStyle(
                                                color: notifire.getdarkscolor,
                                                fontSize: height / 50,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                          const Spacer(),
                                          Transform.scale(
                                            scale: 0.7,
                                            child: CupertinoSwitch(
                                              trackColor: notifire.getgreycolor,
                                              thumbColor: Colors.white,
                                              activeColor:
                                                  notifire.getpinkscolor,
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
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width / 20),
                                        child: Divider(
                                          color: notifire.getpinkscolor
                                              .withOpacity(0.4),
                                          thickness: 1,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 100,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width / 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: height / 18,
                                              width: width / 2.5,
                                              decoration: BoxDecoration(
                                                color: notifire.getpinkscolor
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  CustomStrings.reset,
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getdarkpinkscolor,
                                                      fontSize: height / 50,
                                                      fontFamily:
                                                          'Gilroy Bold'),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: height / 18,
                                                width: width / 2.5,
                                                decoration: BoxDecoration(
                                                  color: notifire
                                                      .getdarkpinkscolor,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(20),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    CustomStrings.apply,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: height / 50,
                                                        fontFamily:
                                                            'Gilroy Bold'),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
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
                      child: Padding(
                        padding: EdgeInsets.all(height / 70),
                        child: Image.asset(
                          "image/filter.png",
                          color: notifire.getdarkpinkscolor,
                        ),
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
          Center(
            child: Container(
              height: height / 1.35,
              color: notifire.getprimerycolor,
              child: SwipeCards(
                matchEngine: _matchEngine,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: height / 1.48,
                                    width: width / 1.15,
                                    //alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        img[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: height / 2,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: width / 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: height / 30,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                          SizedBox(
                                            height: height / 100,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                "image/location2.png",
                                                height: height / 40,
                                              ),
                                              SizedBox(
                                                width: width / 100,
                                              ),
                                              Text(
                                                distances[index],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: height / 55,
                                                    fontFamily:
                                                        'Gilroy Medium'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 1.6,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: width / 5),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _matchEngine.currentItem?.nope();
                                      },
                                      child: Container(
                                        height: height / 13,
                                        width: width / 7,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(height / 45),
                                            child: Image.asset(
                                              "image/close.png",
                                              color: const Color(0xff4B164C),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // ElevatedButton(
                                    //     style: ButtonStyle(
                                    //         backgroundColor:
                                    //             MaterialStateProperty.all(
                                    //                 Colors.orange)),
                                    //     onPressed: () {},
                                    //     child: const Text("Nope")),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        _matchEngine.currentItem?.superLike();
                                      },
                                      child: Container(
                                        height: height / 10,
                                        width: width / 5,
                                        decoration: BoxDecoration(
                                          color: notifire.getdarkpinkscolor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(height / 35),
                                            child: Image.asset(
                                              "image/like.png",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        _matchEngine.currentItem?.like();
                                      },
                                      child: Container(
                                        height: height / 13,
                                        width: width / 7,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff4B164C),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(height / 50),
                                            child: Image.asset(
                                              "image/star.png",
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // ElevatedButton(
                                    //     style: ButtonStyle(
                                    //         backgroundColor:
                                    //             MaterialStateProperty.all(
                                    //                 Colors.green)),
                                    //     onPressed: () {
                                    //       _matchEngine.currentItem?.like();
                                    //     },
                                    //     child: const Text("Like"))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
                onStackFinished: () {
                  setState(() {
                    swipemethod();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void swipemethod() {
    for (int i = 0; i < img.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: Content(
            text: img[i],
          ),
          likeAction: () {
            Fluttertoast.showToast(
                msg: "Like ♥",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.red,
                fontSize: 16.0);
            // MotionToast(
            //   height: height / 20,
            //   //position: MOTION_TOAST_POSITION.CENTER,
            //   color: notifire.getdarkpinkscolor,
            //   description: "Like",
            //   icon: Icons.favorite,
            //   animationType: ANIMATION.FROM_LEFT,  animationCurve : Curves.bounceOut
            // ).show(context);
          },
          nopeAction: () {
            Fluttertoast.showToast(
                msg: "Nope 💔",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.red,
                fontSize: 16.0);
          },
          superlikeAction: () {
            Fluttertoast.showToast(
                msg: "Super Like ♥",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.red,
                fontSize: 16.0);
          },
        ),
      );
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }
}

class Content {
  final String text;

  Content({required this.text});
}

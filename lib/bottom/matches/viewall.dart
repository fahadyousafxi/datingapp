import 'package:dating/utils/media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../profile/profile.dart';
import '../../utils/colornotifire.dart';
import '../../utils/string.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({Key? key}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
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

  bool _switchValue = false;

  double _currentSliderValue = 10;

  String seconddropdownvalue = 'People near by';

  RangeValues _currentRangeValues = const RangeValues(20, 25);

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
                  Column(
                    children: [
                      Text(
                        CustomStrings.allmatches,
                        style: TextStyle(
                            color: notifire.getdarkscolor,
                            fontSize: height / 40,
                            fontFamily: 'Gilroy Bold'),
                      ),
                      Text(
                        "423 matches",
                        style: TextStyle(
                            color: notifire.getgreycolor,
                            fontSize: height / 60,
                            fontFamily: 'Gilroy Medium'),
                      ),
                    ],
                  ),
                  const Spacer(),
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
                                                    color:
                                                        notifire.getdarkscolor,
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
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        size: height / 40,
                                                        color: notifire
                                                            .getgreycolor,
                                                      ),
                                                    ],
                                                  ),
                                                  items: seconditems.map(
                                                      (String seconditems) {
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
                                                  onChanged:
                                                      (String? newValue) {
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
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  side: MaterialStateBorderSide
                                                      .resolveWith(
                                                    (states) => BorderSide(
                                                        width: 1.0,
                                                        color: notifire
                                                            .getgreycolor),
                                                  ),
                                                  checkColor: Colors.white,
                                                  activeColor: notifire
                                                      .getdarkpinkscolor,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  title: Text(
                                                    checkListItems[index]
                                                        ["title"],
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getgreycolor,
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
                                                  color: notifire
                                                      .getdarkpinkscolor,
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
                                          activeColor:
                                              notifire.getdarkpinkscolor,
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
                                                  color: notifire
                                                      .getdarkpinkscolor,
                                                  fontFamily: 'Gilroy Bold'),
                                            ),
                                            Text(
                                              " : ",
                                              style: TextStyle(
                                                  color: notifire
                                                      .getdarkpinkscolor),
                                            ),
                                            Text(
                                              _currentRangeValues.end
                                                  .round()
                                                  .toString(),
                                              style: TextStyle(
                                                  color: notifire
                                                      .getdarkpinkscolor,
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
                                                thumbColor:
                                                    notifire.getdarkpinkscolor,
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
                                                onTap: (){
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
                          child: Image.asset("image/filter.png",color: notifire.getdarkpinkscolor,),
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
                            child: Container(
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

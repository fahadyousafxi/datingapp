import 'dart:io';

import 'package:dating/search_screen.dart';
import 'package:dating/utils/color.dart';
import 'package:dating/utils/colornotifire.dart';
import 'package:dating/utils/media.dart';
import 'package:dating/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom/home/like.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ColorNotifire notifire;
  PickedFile? imageFile;
  final PageController _pageController = PageController(initialPage: 0);
  final PageController _pageController2 = PageController(initialPage: 0);
  final PageController _pageController3 = PageController(initialPage: 0);
  int _currentPage = 0;
  int _currentPage2 = 0;
  int _currentPage3 = 0;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  var seconditems = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Cape Verde',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo',
    'Congo (Democratic Republic)',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czechia',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'East Timor',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Ivory Coast',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Kosovo',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar (Burma)',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Korea',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Korea',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'St Kitts and Nevis',
    'St Lucia',
    'St Vincent',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'The Bahamas',
    'The Gambia',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe',
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
  final int _numPages = 7;

  double _currentSliderValue = 10;

  RangeValues _currentRangeValues = const RangeValues(20, 25);
  String seconddropdownvalue = 'United Kingdom';

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  child: SizedBox(
                                    width: 111,
                                    child: Text(
                                      seconditems,
                                      style: TextStyle(
                                          color: notifire.getgreycolor,
                                          fontSize: height / 60,
                                          fontFamily: 'Gilroy Medium'),
                                    ),
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
                      'Feed',
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
                        builder: (context) => SearchScreen(),
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
                        padding: EdgeInsets.all(height / 80),
                        child: Icon(
                          Icons.search,
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
                                  height: height / 1.7,
                                  decoration: BoxDecoration(
                                    color: notifire.getprimerycolor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25.0),
                                      topRight: Radius.circular(25.0),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
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

                                        /// Fahad changes in filter
                                        // Row(
                                        //   children: [
                                        //     SizedBox(
                                        //       width: width / 20,
                                        //     ),
                                        //     Text(
                                        //       CustomStrings.preferences,
                                        //       style: TextStyle(
                                        //           color: notifire.getdarkscolor,
                                        //           fontSize: height / 50,
                                        //           fontFamily: 'Gilroy Bold'),
                                        //     ),
                                        //   ],
                                        // ),
                                        // Padding(
                                        //   padding:
                                        //       EdgeInsets.only(left: width / 40),
                                        //   child: Row(
                                        //     children: List.generate(
                                        //       checkListItems.length,
                                        //       (index) => Container(
                                        //         color: Colors.transparent,
                                        //         width: width / 2.5,
                                        //         child: CheckboxListTile(
                                        //           shape: RoundedRectangleBorder(
                                        //             borderRadius:
                                        //                 BorderRadius.circular(5),
                                        //           ),
                                        //           side: MaterialStateBorderSide
                                        //               .resolveWith(
                                        //             (states) => BorderSide(
                                        //                 width: 1.0,
                                        //                 color: notifire
                                        //                     .getgreycolor),
                                        //           ),
                                        //           checkColor: Colors.white,
                                        //           activeColor:
                                        //               notifire.getdarkpinkscolor,
                                        //           controlAffinity:
                                        //               ListTileControlAffinity
                                        //                   .leading,
                                        //           contentPadding: EdgeInsets.zero,
                                        //           title: Text(
                                        //             checkListItems[index]
                                        //                 ["title"],
                                        //             style: TextStyle(
                                        //                 color:
                                        //                     notifire.getgreycolor,
                                        //                 fontSize: height / 60,
                                        //                 fontFamily:
                                        //                     'Gilroy Medium'),
                                        //           ),
                                        //           value: checkListItems[index]
                                        //               ["value"],
                                        //           onChanged: (value) {
                                        //             setState(
                                        //               () {
                                        //                 for (var element
                                        //                     in checkListItems) {
                                        //                   element["value"] =
                                        //                       false;
                                        //                 }
                                        //                 checkListItems[index]
                                        //                     ["value"] = value;
                                        //                 selected =
                                        //                     "${checkListItems[index]["id"]}, ${checkListItems[index]["title"]}, ${checkListItems[index]["value"]}";
                                        //               },
                                        //             );
                                        //           },
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        // Padding(
                                        //   padding: EdgeInsets.symmetric(
                                        //       horizontal: width / 20),
                                        //   child: Divider(
                                        //     color: notifire.getpinkscolor
                                        //         .withOpacity(0.4),
                                        //     thickness: 1,
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   height: height / 100,
                                        // ),
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
                                                trackColor:
                                                    notifire.getgreycolor,
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
          Expanded(
            child: Container(
              // height: mediaHeight * 0.58,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: height / 40,
                  ),
                  Stack(
                    children: [
                      Image.asset("image/bg.png"),
                      Column(
                        children: [
                          SizedBox(
                            height: height / 9,
                          ),
                          Stack(
                            children: [
                              Center(
                                child: GestureDetector(
                                  // onTap: () {
                                  //   _openCamera(context);
                                  // },
                                  child: (imageFile == null)
                                      ? Container(
                                          color: Colors.transparent,
                                          height: height / 4.5,
                                          width: width / 2,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                notifire.getlightcolor,
                                            child: Container(
                                              height: height / 4.7,
                                              width: width / 2.4,
                                              decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  shape: BoxShape.circle),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(400),
                                                child: Image.asset(
                                                  "image/profile.png",
                                                  height: height / 4.7,
                                                  width: width,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: height / 4.5,
                                          width: width / 2,
                                          color: Colors.transparent,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                notifire.getlightcolor,
                                            child: Container(
                                              height: height / 4.7,
                                              width: width / 2.4,
                                              decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  shape: BoxShape.circle),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(400),
                                                child: Image.file(
                                                  File(
                                                    imageFile!.path,
                                                  ),
                                                  height: height / 4.7,
                                                  width: width,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // child: ClipRRect(
                                          //   borderRadius: const BorderRadius.all(
                                          //     Radius.circular(15),
                                          //   ),
                                          //   child: Image.file(
                                          //     File(
                                          //       imageFile!.path,
                                          //     ),
                                          //     fit: BoxFit.cover,
                                          //   ),
                                          // ),
                                        ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: height / 50,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width / 1.65,
                                      ),
                                      // Container(
                                      //   height: height / 28,
                                      //   width: width / 10,
                                      //   decoration: BoxDecoration(
                                      //       color: notifire.getlightcolor,
                                      //       shape: BoxShape.circle),
                                      //   child: Icon(Icons.edit,
                                      //       color: notifire.getgreycolor,
                                      //       size: height / 40),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 300,
                          ),
                          Text(
                            CustomStrings.hayes,
                            style: TextStyle(
                                color: notifire.getlightcolor,
                                fontSize: height / 40,
                                fontFamily: 'Gilroy Bold'),
                          ),
                          SizedBox(
                            height: height / 300,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: notifire.getlightcolor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Age, 25',
                                  style: TextStyle(
                                      color: notifire.getlightcolor,
                                      fontSize: height / 60,
                                      fontFamily: 'Gilroy Bold'),
                                ),
                              ]),
                          SizedBox(
                            height: height / 300,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_city,
                                  color: notifire.getlightcolor,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Washington, USA',
                                  style: TextStyle(
                                      color: notifire.getlightcolor,
                                      fontSize: height / 60,
                                      fontFamily: 'Gilroy Bold'),
                                ),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: height / 20),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height / 100,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: height / 50),
                                child: Column(
                                  children: [],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 90,
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 18),
                    child: Container(
                      height: height / 4,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: notifire.getpinkscolor.withOpacity(0.3),
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.transparent,
                            height: height / 10,
                            child: PageView(
                              physics: const ClampingScrollPhysics(),
                              controller: _pageController,
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage = page;
                                });
                              },
                              children: <Widget>[
                                matches(),
                                matches(),
                                matches(),
                                matches(),
                                matches(),
                                matches(),
                                matches(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const Upgrade(),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: height / 20,
                              width: width / 2.5,
                              decoration: BoxDecoration(
                                color:
                                    notifire.getlightingcolor.withOpacity(0.9),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  CustomStrings.viewAllNotifications,
                                  style: TextStyle(
                                      color: notifire.getdarkspinkcolor,
                                      fontSize: height / 60,
                                      fontFamily: 'Gilroy Bold'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 18),
                    child: Container(
                      height: height / 4,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: notifire.getpinkscolor.withOpacity(0.3),
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.transparent,
                            height: height / 10,
                            child: PageView(
                              physics: const ClampingScrollPhysics(),
                              controller: _pageController2,
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage2 = page;
                                });
                              },
                              children: <Widget>[
                                matches2(),
                                matches2(),
                                matches2(),
                                matches2(),
                                matches2(),
                                matches2(),
                                matches2(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator2(),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const Upgrade(),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: height / 20,
                              width: width / 2.5,
                              decoration: BoxDecoration(
                                color:
                                    notifire.getlightingcolor.withOpacity(0.9),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  CustomStrings.viewAllMessages,
                                  style: TextStyle(
                                      color: notifire.getdarkspinkcolor,
                                      fontSize: height / 60,
                                      fontFamily: 'Gilroy Bold'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 18),
                    child: Container(
                      height: height / 4,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: notifire.getpinkscolor.withOpacity(0.3),
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.transparent,
                            height: height / 10,
                            child: PageView(
                              physics: const ClampingScrollPhysics(),
                              controller: _pageController2,
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage2 = page;
                                });
                              },
                              children: <Widget>[
                                matches3(),
                                matches3(),
                                matches3(),
                                matches3(),
                                matches3(),
                                matches3(),
                                matches3(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator2(),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const Upgrade(),
                              //   ),
                              // );
                            },
                            child: Container(
                              height: height / 20,
                              width: width / 2.5,
                              decoration: BoxDecoration(
                                color:
                                    notifire.getlightingcolor.withOpacity(0.9),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  CustomStrings.viewAllNews,
                                  style: TextStyle(
                                      color: notifire.getdarkspinkcolor,
                                      fontSize: height / 60,
                                      fontFamily: 'Gilroy Bold'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                ]),
              ),
            ),
          ),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: width / 18),
          //   child: Container(
          //     height: height / 4,
          //     decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.all(
          //         Radius.circular(10),
          //       ),
          //       color: notifire.getpinkscolor.withOpacity(0.3),
          //     ),
          //     child: Column(
          //       children: [
          //         Container(
          //           color: Colors.transparent,
          //           height: height / 10,
          //           child: PageView(
          //             physics: const ClampingScrollPhysics(),
          //             controller: _pageController,
          //             onPageChanged: (int page) {
          //               setState(() {
          //                 _currentPage = page;
          //               });
          //             },
          //             children: <Widget>[
          //               matches(),
          //               matches(),
          //               matches(),
          //               matches(),
          //               matches(),
          //               matches(),
          //               matches(),
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //           height: height / 50,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: _buildPageIndicator(),
          //         ),
          //         SizedBox(
          //           height: height / 30,
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             // Navigator.push(
          //             //   context,
          //             //   MaterialPageRoute(
          //             //     builder: (context) => const Upgrade(),
          //             //   ),
          //             // );
          //           },
          //           child: Container(
          //             height: height / 20,
          //             width: width / 2.5,
          //             decoration: BoxDecoration(
          //               color: notifire.getlightingcolor.withOpacity(0.9),
          //               borderRadius: const BorderRadius.all(
          //                 Radius.circular(20),
          //               ),
          //             ),
          //             child: Center(
          //               child: Text(
          //                 CustomStrings.vip,
          //                 style: TextStyle(
          //                     color: notifire.getdarkspinkcolor,
          //                     fontSize: height / 60,
          //                     fontFamily: 'Gilroy Bold'),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> _buildPageIndicator2() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage2 ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> _buildPageIndicator3() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage3 ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 7.0,
      width: isActive ? 7.0 : 7.0,
      decoration: BoxDecoration(
        color: isActive
            ? notifire.getpinkscolor
            : notifire.getpinkscolor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget matches() {
    return Column(
      children: [
        SizedBox(
          height: height / 30,
        ),
        Text(
          CustomStrings.notifications,
          style: TextStyle(
              color: notifire.getdarkscolor.withOpacity(0.7),
              fontSize: height / 40,
              fontFamily: 'Gilroy Bold'),
        ),
        SizedBox(
          height: height / 100,
        ),
        Text(
          CustomStrings.boost,
          style: TextStyle(
              color: notifire.getdarkscolor.withOpacity(0.6),
              fontSize: height / 60,
              fontFamily: 'Gilroy Medium'),
        ),
      ],
    );
  }

  Widget matches2() {
    return Column(
      children: [
        SizedBox(
          height: height / 30,
        ),
        Text(
          CustomStrings.recentMessages,
          style: TextStyle(
              color: notifire.getdarkscolor.withOpacity(0.7),
              fontSize: height / 40,
              fontFamily: 'Gilroy Bold'),
        ),
        SizedBox(
          height: height / 100,
        ),
        Text(
          CustomStrings.boost,
          style: TextStyle(
              color: notifire.getdarkscolor.withOpacity(0.6),
              fontSize: height / 60,
              fontFamily: 'Gilroy Medium'),
        ),
      ],
    );
  }

  Widget matches3() {
    return Column(
      children: [
        SizedBox(
          height: height / 30,
        ),
        Text(
          CustomStrings.latestNews,
          style: TextStyle(
              color: notifire.getdarkscolor.withOpacity(0.7),
              fontSize: height / 40,
              fontFamily: 'Gilroy Bold'),
        ),
        SizedBox(
          height: height / 100,
        ),
        Text(
          CustomStrings.boost,
          style: TextStyle(
              color: notifire.getdarkscolor.withOpacity(0.6),
              fontSize: height / 60,
              fontFamily: 'Gilroy Medium'),
        ),
      ],
    );
  }
}

class SecondCard extends StatelessWidget {
  const SecondCard({
    Key? key,
    required this.mediaWidth,
  }) : super(key: key);

  final double mediaWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: lightg2pinkColor,
      ),
      width: mediaWidth,
      padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              'Politics . 2hr ago',
              style: TextStyle(color: Color(0xff68626F)),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Icon(
              Icons.more_horiz,
              color: Color(0xff68626F),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Should the US raise the debt of ceiling\navoid bankruptcy?",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                'image/match1.png',
              ),
              radius: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Kevin Dukkon',
              style: TextStyle(color: Color(0xff68626F), fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 10,
          color: Color(0xff40374A),
          thickness: 1,
          indent: 0,
          endIndent: 0,
        ),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 80,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'image/match1.png',
                  ),
                  radius: 20,
                ),
                Positioned(
                  left: 15,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'image/match1.png',
                    ),
                    radius: 20,
                  ),
                ),
                Positioned(
                  left: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'image/match1.png',
                    ),
                    radius: 20,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '112 responses',
              style: TextStyle(color: Color(0xff68626F), fontSize: 16),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff271A2D),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Color(0xff362B3C),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Color(0xff362B3C),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Color(0xff362B3C),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Color(0xff362B3C),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    )
                  ],
                ))
          ],
        )
      ]),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            Text(
              'Back',
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Text(
              'keviduck',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Icon(
              Icons.arrow_back_ios,
              color: Colors.transparent,
            ),
            Icon(
              Icons.more_horiz,
              color: Colors.white,
            )
          ],
        ));
  }
}

class FirstCard extends StatelessWidget {
  FirstCard({Key? key}) : super(key: key);
  late ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: lightg2pinkColor,
      ),
      width: mediaWidth,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          // CircleAvatar(
          //   backgroundImage: AssetImage(
          //     'image/match1.png',
          //   ),
          //   radius: 50,
          // ),
          Container(
            color: Colors.transparent,
            height: height / 4.5,
            width: width / 2,
            child: CircleAvatar(
              backgroundColor: notifire.getlightcolor,
              child: Container(
                height: height / 4.7,
                width: width / 2.4,
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(400),
                  child: Image.asset(
                    "image/profile.png",
                    height: height / 4.7,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Kevin Dukkon',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Head of design',
                style: TextStyle(color: Color(0xff68626F), fontSize: 16),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '@fintory',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.speaker,
                color: Colors.blue,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'I love helping designes find their voice',
                style: TextStyle(color: Color(0xff68626F), fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_downward,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '1M+ UI Kit Downloads',
                style: TextStyle(color: Color(0xff68626F), fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'www.fintory.com',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: mediaHeight * 0.06,
            width: mediaWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.keyboard_arrow_down,
                  color: greyColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Show More',
                  style: TextStyle(
                      color: greyColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:dating/profile/profile.dart';
import 'package:dating/utils/colornotifire.dart';
import 'package:dating/utils/media.dart';
import 'package:dating/utils/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String seconddropdownvalue = 'Germany';
  var seconditems = ['Germany', 'Canada', 'U.K', 'India'];
  bool _switchValue = false;
  double _currentSliderValue = 10;
  RangeValues _currentRangeValues = const RangeValues(20, 25);
  String selected = "";

  late ColorNotifire notifire;
  final TextEditingController _textEditingController = TextEditingController();
  List<String> suggestions = [
    'United Kingdom',
  ];

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

  List<String> filteredSuggestions = [];
  bool isTextFieldTapped = false;

  void updateFilteredSuggestions(String input) {
    setState(() {
      if (input.isNotEmpty) {
        filteredSuggestions = suggestions
            .where((suggestion) =>
                suggestion.toLowerCase().startsWith(input.toLowerCase()))
            .toList();
      } else {
        filteredSuggestions = suggestions;
      }
    });
  }

  void selectSuggestion(String suggestion) {
    setState(() {
      _textEditingController.text = suggestion;
      filteredSuggestions = [];
    });
  }

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  String maptheme = '';
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _marker = [];

  final List<LatLng> _latLang = const [
    LatLng(31.4504, 73.1350), // Faisalabad
    LatLng(31.4620, 73.1486), // NTU Faisalabad
    LatLng(31.4576, 73.1581), // TUF Faisalabad
  ];

  List name = [
    CustomStrings.design,
    CustomStrings.music,
  ];
  List interest = ["image/design.png", "image/photography.png"];

  // Initial Position
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(31.4504, 73.1350), zoom: 15);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredSuggestions = suggestions;
    // Theme Setting
    DefaultAssetBundle.of(context)
        .loadString('assets/maptheme/silver_theme.json')
        .then((value) {
      maptheme = value;
    });
    // Load Image on Map
    loadLocation();
  }

  // Load Image on Map
  loadLocation() async {
    for (int i = 0; i < _latLang.length; i++) {
      Uint8List? image = await loadImage('assets/images/profile.png');
      final ui.Codec markerImage = await instantiateImageCodec(
        image!.buffer.asUint8List(),
        targetHeight: 120,
        targetWidth: 120,
      );
      final ui.FrameInfo frameInfo = await markerImage.getNextFrame();
      final ByteData? byteData =
          await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List resizedImageMarker = byteData!.buffer.asUint8List();
      _marker.add(
        Marker(
            markerId: MarkerId(i.toString()),
            position: _latLang[i],
            icon: BitmapDescriptor.fromBytes(resizedImageMarker),
            onTap: () {
              showModalBottomSheet<dynamic>(
                // changes by Fahad
                backgroundColor: notifire.getprimerycolor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0)),
                ),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext bc) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Wrap(
                        children: <Widget>[
                          Column(
                            children: [
                              SizedBox(
                                height: height / 80,
                              ),
                              Center(
                                child: Container(
                                  height: height / 90,
                                  width: width / 7,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color:
                                        notifire.getgreycolor.withOpacity(0.4),
                                  ),
                                ),
                              ),
                              Container(
                                height: height / 2,
                                width: width,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    topRight: Radius.circular(35),
                                  ),
                                ),
                                child: ListView.builder(
                                  itemCount: 3,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                InkWell(
                                                  onTap: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Profile())),
                                                  child: Container(
                                                    height: height / 5,
                                                    width: width / 3,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(22),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(22),
                                                      ),
                                                      child: Image.asset(
                                                        'image/match6.png',
                                                        width: width,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              CustomStrings
                                                                  .jamyee,
                                                              style: TextStyle(
                                                                color: notifire
                                                                    .getdarkscolor,
                                                                fontSize:
                                                                    height / 40,
                                                                fontFamily:
                                                                    'Gilroy Bold',
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: height /
                                                                    90),
                                                            Row(
                                                              children: [
                                                                Image.asset(
                                                                  "image/personal.png",
                                                                  height:
                                                                      height /
                                                                          50,
                                                                ),
                                                                SizedBox(
                                                                    width:
                                                                        width /
                                                                            50),
                                                                Text(
                                                                  CustomStrings
                                                                      .personal,
                                                                  style:
                                                                      TextStyle(
                                                                    color: notifire
                                                                        .getgreycolor,
                                                                    fontSize:
                                                                        height /
                                                                            50,
                                                                    fontFamily:
                                                                        'Gilroy Bold',
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: height /
                                                                    50),
                                                            Row(
                                                              children: [
                                                                Image.asset(
                                                                  "image/msg.png",
                                                                  height:
                                                                      height /
                                                                          55,
                                                                ),
                                                                SizedBox(
                                                                    width:
                                                                        width /
                                                                            50),
                                                                Text(
                                                                  "32 MILES",
                                                                  style:
                                                                      TextStyle(
                                                                    color: notifire
                                                                        .getgreycolor
                                                                        .withOpacity(
                                                                            0.6),
                                                                    fontSize:
                                                                        height /
                                                                            55,
                                                                    fontFamily:
                                                                        'Gilroy Bold',
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                        height: height / 40),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          CustomStrings
                                                              .interests,
                                                          style: TextStyle(
                                                            color: notifire
                                                                .getdarkscolor,
                                                            fontSize:
                                                                height / 55,
                                                            fontFamily:
                                                                'Gilroy Bold',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                        height: height / 60),
                                                    Container(
                                                      height: height / 15,
                                                      width: width,
                                                      color: Colors.transparent,
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            interest.length,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Column(
                                                          children: [
                                                            Container(
                                                              height:
                                                                  height / 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: notifire
                                                                    .getpinkscolor
                                                                    .withOpacity(
                                                                        0.4),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            width /
                                                                                30),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              width / 50),
                                                                      child: Image
                                                                          .asset(
                                                                        interest[
                                                                            index],
                                                                        color: notifire
                                                                            .getdarkspinkcolor,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      name[
                                                                          index],
                                                                      style:
                                                                          TextStyle(
                                                                        color: notifire
                                                                            .getdarkscolor,
                                                                        fontSize:
                                                                            height /
                                                                                70,
                                                                        fontFamily:
                                                                            'Gilroy',
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.9,
                                        child: Divider(
                                          color: notifire.getdarkpinkscolor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              );
              _latLang[i];
            }),
      );
      setState(() {});
    }
  }

  Future<Uint8List?> loadImage(String path) async {
    final completer = Completer<ImageInfo>();
    var image = AssetImage(path);
    image.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener(
            (info, _) => completer.complete(info),
          ),
        );
    final imageInfo = await completer.future;
    final byteData =
        await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 30),
              child: Column(
                children: [
                  Container(
                    color: notifire.getprimerycolor,
                    height: height / 12,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
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
                            'Search Match',
                            style: TextStyle(
                                color: notifire.getdarkscolor,
                                fontSize: height / 40,
                                fontFamily: 'Gilroy Bold'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 36,
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                contentPadding: const EdgeInsets.only(
                                  left: 14.0,
                                  bottom: 2.0,
                                  top: 2.0,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.pink),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.pink),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _textEditingController.clear();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: notifire.getlightpinkcolor,
                                  ),
                                ),
                              ),
                              controller: _textEditingController,
                              onTap: () {
                                if (!isTextFieldTapped) {
                                  setState(() {
                                    isTextFieldTapped = true;
                                  });
                                }
                              },
                              onChanged: (input) {
                                updateFilteredSuggestions(input);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 30,
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
                                  builder: (BuildContext context,
                                      StateSetter setState) {
                                    return Wrap(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            color: notifire.getprimerycolor,
                                            borderRadius:
                                                const BorderRadius.only(
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
                                                    color:
                                                        notifire.getdarkscolor,
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
                                                          color: notifire
                                                              .getdarkscolor,
                                                          fontSize: height / 50,
                                                          fontFamily:
                                                              'Gilroy Bold'),
                                                    ),
                                                    const Spacer(),
                                                    Center(
                                                      child: DropdownButton(
                                                        underline:
                                                            const SizedBox(),
                                                        value:
                                                            seconddropdownvalue,
                                                        icon: Row(
                                                          children: [
                                                            SizedBox(
                                                                width: width /
                                                                    200),
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
                                                            (String
                                                                seconditems) {
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
                                                        color: notifire
                                                            .getdarkscolor,
                                                        fontSize: height / 50,
                                                        fontFamily:
                                                            'Gilroy Bold'),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: width / 40),
                                                child: Row(
                                                  children: List.generate(
                                                    checkListItems.length,
                                                    (index) => Container(
                                                      color: Colors.transparent,
                                                      width: width / 2.5,
                                                      child: CheckboxListTile(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        side:
                                                            MaterialStateBorderSide
                                                                .resolveWith(
                                                          (states) => BorderSide(
                                                              width: 1.0,
                                                              color: notifire
                                                                  .getgreycolor),
                                                        ),
                                                        checkColor:
                                                            Colors.white,
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
                                                              fontSize:
                                                                  height / 60,
                                                              fontFamily:
                                                                  'Gilroy Medium'),
                                                        ),
                                                        value: checkListItems[
                                                            index]["value"],
                                                        onChanged: (value) {
                                                          setState(
                                                            () {
                                                              for (var element
                                                                  in checkListItems) {
                                                                element["value"] =
                                                                    false;
                                                              }
                                                              checkListItems[
                                                                          index]
                                                                      [
                                                                      "value"] =
                                                                  value;
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
                                                        color: notifire
                                                            .getdarkscolor,
                                                        fontSize: height / 50,
                                                        fontFamily:
                                                            'Gilroy Bold'),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    "${_currentSliderValue.round().toString()} Kg",
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getdarkpinkscolor,
                                                        fontSize: height / 60,
                                                        fontFamily:
                                                            'Gilroy Bold'),
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
                                                inactiveColor: notifire
                                                    .getpinkscolor
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
                                                        color: notifire
                                                            .getdarkscolor,
                                                        fontSize: height / 50,
                                                        fontFamily:
                                                            'Gilroy Bold'),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    _currentRangeValues.start
                                                        .round()
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getdarkpinkscolor,
                                                        fontFamily:
                                                            'Gilroy Bold'),
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
                                                        fontFamily:
                                                            'Gilroy Bold'),
                                                  ),
                                                  SizedBox(
                                                    width: width / 20,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  RangeSlider(
                                                    activeColor: notifire
                                                        .getdarkpinkscolor,
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
                                                    onChanged:
                                                        (RangeValues values) {
                                                      setState(() {
                                                        _currentRangeValues =
                                                            values;
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
                                                        color: notifire
                                                            .getdarkscolor,
                                                        fontSize: height / 50,
                                                        fontFamily:
                                                            'Gilroy Bold'),
                                                  ),
                                                  const Spacer(),
                                                  Transform.scale(
                                                    scale: 0.7,
                                                    child: CupertinoSwitch(
                                                      trackColor:
                                                          notifire.getgreycolor,
                                                      thumbColor: Colors.white,
                                                      activeColor: notifire
                                                          .getpinkscolor,
                                                      value: _switchValue,
                                                      onChanged: (value) {
                                                        setState(
                                                          () {
                                                            _switchValue =
                                                                value;
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
                                                        color: notifire
                                                            .getpinkscolor
                                                            .withOpacity(0.4),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(20),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          CustomStrings.reset,
                                                          style: TextStyle(
                                                              color: notifire
                                                                  .getdarkpinkscolor,
                                                              fontSize:
                                                                  height / 50,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: notifire
                                                              .getdarkpinkscolor,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(20),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            CustomStrings.apply,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    height / 50,
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
                ],
              ),
            ),
            if (isTextFieldTapped)
              if (filteredSuggestions.isNotEmpty)
                SizedBox(
                  height: height / 18,
                  child: ListView.builder(
                    itemCount: filteredSuggestions.length,
                    itemBuilder: (context, index) {
                      final suggestion = filteredSuggestions[index];
                      return ListTile(
                        title: Text(suggestion),
                        onTap: () {
                          selectSuggestion(suggestion);
                        },
                      );
                    },
                  ),
                ),
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    markers: Set<Marker>.of(_marker),
                    onTap: (position) {
                      _customInfoWindowController.hideInfoWindow!();
                    },
                    onCameraMove: (position) {
                      _customInfoWindowController.onCameraMove!();
                    },
                    onMapCreated: (GoogleMapController controller) {
                      controller.setMapStyle(maptheme);
                      _controller.complete(controller);
                      _customInfoWindowController.googleMapController =
                          controller;
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

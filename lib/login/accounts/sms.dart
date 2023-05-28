 
import 'package:dating/utils/media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colornotifire.dart';
import '../../utils/custombutton.dart';
import '../../utils/string.dart';

class Sms extends StatefulWidget {
  const Sms({Key? key}) : super(key: key);

  @override
  State<Sms> createState() => _SmsState();
}

class _SmsState extends State<Sms> {
  final List<Map> _myjson = [
    {
      'id': '1',
      'image': 'image/flag.png',
      'Text': "+91",
    },
    {
      'id': '2',
      'image': 'image/flagtwo.png.png',
      'Text': "+92",
    },
    {
      'id': '3',
      'image': 'image/flagthree.jpg',
      'Text': "+93",
    },
    {
      'id': '4',
      'image': 'image/flagfour.png',
      'Text': "+91",
    },
    {
      'id': '5',
      'image': 'image/flagfive.png',
      'Text': "+95",
    }
  ];
  String? _selectedindex;
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
              height: height / 6,
            ),
            Row(
              children: [
                SizedBox(
                  width: width / 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CustomStrings.canget,
                      style: TextStyle(
                          color: notifire.getdarkspinkcolor,
                          fontSize: height / 18,
                          fontFamily: 'Gilroy Bold'),
                    ),
                    Text(
                      CustomStrings.digits,
                      style: TextStyle(
                          color: notifire.getdarkspinkcolor,
                          fontSize: height / 18,
                          fontFamily: 'Gilroy Bold'),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    Text(
                      CustomStrings.number1,
                      style: TextStyle(
                          color: notifire.getgreycolor,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                    Text(
                      CustomStrings.number2,
                      style: TextStyle(
                          color: notifire.getgreycolor,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Medium'),
                    ),
                    SizedBox(
                      height: height / 10,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: notifire.getpinkscolor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          height: height / 20,
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              buttonColor: notifire.getdarkpinkscolor,
                              child: DropdownButton<String>(dropdownColor: notifire.getpinkscolor.withOpacity(0.4),
                                icon: Padding(
                                  padding: EdgeInsets.only(right: width / 100),
                                  child: const Icon(Icons.keyboard_arrow_down_rounded,
                                      color: Colors.white),
                                ),
                                hint: Row(
                                  children: [
                                    SizedBox(
                                      width: width / 40,
                                    ),
                                    Image.asset(
                                      "image/flagfour.png",
                                      width: width / 15,
                                    ),
                                    SizedBox(
                                      width: width / 40,
                                    ),
                                    const Text(
                                      "+91",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Gilroy Medium'),
                                    )
                                  ],
                                ),
                                value: _selectedindex,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedindex = newValue;
                                  });
                                },
                                items: _myjson.map(
                                  (Map map) {
                                    return DropdownMenuItem<String>(
                                      value: map["id"].toString(),
                                      child: Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: width / 40,
                                          ),
                                          Image.asset(
                                            map["image"].toString(),
                                            width: width / 15,
                                          ),
                                          SizedBox(
                                            width: width / 40,
                                          ),
                                          Text(
                                            map["Text"].toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                          SizedBox(
                                            width: width / 50,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width / 20,
                        ),
                        Container(
                          color: Colors.transparent,
                          height: height / 16,
                          width: width / 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: notifire.getdarkscolor),
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.only(left: height / 80),
                              fillColor: notifire.getprimerycolor,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "800-111-2222",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: height / 40,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height / 4.5,),
            GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const Verify(),),);
                },
                child: Custombutton.button(CustomStrings.continues,notifire.getgcolor,notifire.getg2color,notifire.getg3color,notifire.getg4color)),
          ],
        ),
      ),
    );
  }
}

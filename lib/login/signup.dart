import 'package:dating/login/accounts/account.dart';
import 'package:dating/utils/media.dart';
import 'package:dating/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/itextfield.dart';
import '../utils/string.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthDayController = TextEditingController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  int bDYear = DateTime.now().year - 5;
  int bDMonth = DateTime.now().month;
  int bDDay = DateTime.now().day;

  String yearsDropdownValue = '2005';

  // changes
  var yearsItems = [
    // '2023',
    // '2022',
    // '2021',
    // '2020',
    // '2019',
    // '2018',
    // '2017',
    // '2016',
    // '2015',
    // '2014',
    // '2013',
    // '2012',
    // '2011',
    // '2010',
    // '2009',
    // '2008',
    // '2007',
    // '2006',
    '2005',
    '2004',
    '2003',
    '2002',
    '2001',
    '2000',
    '1999',
    '1998',
    '1997',
    '1996',
    '1995',
    '1994',
    '1993',
    '1992',
    '1991',
    '1990',
    '1989',
    '1988',
    '1987',
    '1986',
    '1985',
    '1984',
    '1983',
    '1982',
    '1981',
    '1980',
    '1979',
    '1978',
    '1977',
    '1976',
    '1975',
    '1974',
    '1973',
    '1972',
    '1971',
    '1970',
    '1969',
    '1968',
    '1967',
    '1966',
    '1965',
    '1964',
    '1963',
    '1962',
    '1961',
    '1960',
    '1959',
    '1958',
    '1957',
    '1956',
    '1955',
    '1954',
    '1953',
    '1952',
    '1951',
    '1950',
    '1949',
    '1948',
    '1947',
    '1946',
    '1945',
    '1944',
    '1943',
    '1942',
    '1941',
    '1940',
    '1939',
    '1938',
    '1937',
    '1936',
    '1935',
    '1934',
    '1933',
    '1932',
    '1931',
    '1930',
    '1929',
    '1928',
    '1927',
    '1926',
    '1925',
    '1924',
    '1923',
    '1922',
    '1921',
    '1920',
    '1919',
    '1918',
    '1917',
    '1916',
    '1915',
    '1914',
    '1913',
    '1912',
    '1911',
    '1910',
    '1909',
    '1908',
    '1907',
    '1906',
    '1905',
    '1904',
    '1903',
    '1902',
    '1901',
    '1900',
  ];

  String monthsDropdownValue = '01';
  var monthsItems = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
  ];

  String daysDropdownValue = '01';
  var daysItems = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
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
    '31',
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "image/meets.png",
                height: height / 3,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: height / 50,
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: height / 19,
                      width: width / 2.9,
                      color: notifire.getpinkscolor,
                    ),
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          height: height / 32,
                          width: width / 2.9,
                          color: notifire.getprimerycolor,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 150),
                      child: Text(
                        CustomStrings.welcome,
                        style: TextStyle(
                            color: notifire.getdarkscolor,
                            fontSize: height / 30,
                            fontFamily: 'Gilroy Bold'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 55,
              ),
              Text(
                CustomStrings.today,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Gilroy Medium',
                    color: notifire.getgreycolor,
                    fontSize: height / 50),
              ),
              SizedBox(
                height: height / 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 15,
                  ),
                  Text(
                    CustomStrings.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Gilroy Bold',
                        color: notifire.getdarkpinkscolor,
                        fontSize: height / 60),
                  ),
                ],
              ),
              SizedBox(
                height: height / 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 18),
                child: Customtextfild2.textField(
                  _nameController,
                  CustomStrings.names,
                  notifire.getdarkscolor,
                  Image.asset("image/name.png"),
                  notifire.getlightingcolor,
                ),
              ),
              SizedBox(
                height: height / 40,
              ),

              /// ios style calender testing by Fahad
              // SizedBox(
              //   height: 120,
              //   child: CupertinoDatePicker(
              //     mode: CupertinoDatePickerMode.date,
              //     initialDateTime: DateTime.now(),
              //     onDateTimeChanged: (DateTime newDateTime) {
              //       // Do something
              //       print('${newDateTime.month}');
              //       print('${newDateTime.year}');
              //       print('${newDateTime.day}');
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: 22,
              // ),

              Row(
                children: [
                  SizedBox(
                    width: width / 15,
                  ),
                  Text(
                    CustomStrings.email,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Gilroy Bold',
                        color: notifire.getdarkpinkscolor,
                        fontSize: height / 60),
                  ),
                ],
              ),
              SizedBox(
                height: height / 100,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width / 18),
                color: Colors.transparent,
                // height: height / 16,
                width: width,
                child: TextFormField(
                  validator: (String? txt) {
                    bool emailValid = RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(txt!);
                    if (txt == null || txt.isEmpty) {
                      return "Please provide your Email";
                    }
                    if (emailValid) {
                      return null;
                    }
                    return "Your Email is Wrong";
                  },
                  controller: _emailController,
                  style: TextStyle(color: notifire.getdarkscolor),
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.zero,
                    fillColor: notifire.getlightingcolor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: CustomStrings.emails,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: height / 50,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(height / 50),
                      child: Image.asset(
                        "image/email.png",
                        height: height / 46,
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: width / 18),
              //   child: Customtextfild2.textField(
              //     _emailController,
              //     CustomStrings.emails,
              //     notifire.getdarkscolor,
              //     Padding(
              //       padding: EdgeInsets.all(height / 400),
              //       child: Image.asset("image/email.png"),
              //     ),
              //     notifire.getlightingcolor,
              //     validator: (String? txt) {
              //       bool emailValid = RegExp(
              //               r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
              //           .hasMatch(txt!);
              //       if (txt == null || txt.isEmpty) {
              //         return "Please provide your Email";
              //       }
              //       if (emailValid) {
              //         return null;
              //       }
              //       return "Your Email is Wrong";
              //     },
              //   ),
              // ),
              SizedBox(
                height: height / 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 15,
                  ),
                  Text(
                    CustomStrings.birthdate,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Gilroy Bold',
                        color: notifire.getdarkpinkscolor,
                        fontSize: height / 60),
                  ),
                ],
              ),

              SizedBox(
                height: height / 100,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Text(
                                'Day',
                                style: TextStyle(
                                    color: notifire.getgreycolor,
                                    fontSize: height / 50,
                                    fontFamily: 'Gilroy Bold'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 400,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: height / 20,
                          // width: width / 2.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.7),
                              color: notifire.getlightingcolor
                              // border: Border.all(color: notifire.getdarkpinkscolor),
                              ),
                          child: Center(
                            child: DropdownButton(
                              underline: const SizedBox(),
                              value: daysDropdownValue,
                              icon: Row(
                                children: [
                                  SizedBox(width: width / 200),
                                  Padding(
                                    padding: EdgeInsets.only(left: width / 11),
                                    child: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: height / 30,
                                      color: notifire.getgreycolor,
                                    ),
                                  ),
                                ],
                              ),
                              items: daysItems.map((String seconditems) {
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
                                  debugPrint(newValue);
                                  daysDropdownValue = newValue!;
                                });
                              },
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
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Text(
                                'Month',
                                style: TextStyle(
                                    color: notifire.getgreycolor,
                                    fontSize: height / 50,
                                    fontFamily: 'Gilroy Bold'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 400,
                        ),
                        Container(
                          height: height / 20,
                          // width: width / 2.3,
                          padding: EdgeInsets.symmetric(horizontal: 10),

                          decoration: BoxDecoration(
                            color: notifire.getlightingcolor,
                            borderRadius: BorderRadius.circular(25.7),
                            // border: Border.all(color: notifire.getdarkpinkscolor),
                          ),
                          child: Center(
                            child: DropdownButton(
                              underline: const SizedBox(),
                              value: monthsDropdownValue,
                              icon: Row(
                                children: [
                                  SizedBox(width: width / 200),
                                  Padding(
                                    padding: EdgeInsets.only(left: width / 11),
                                    child: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: height / 30,
                                      color: notifire.getgreycolor,
                                    ),
                                  ),
                                ],
                              ),
                              items: monthsItems.map((String seconditems) {
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
                                  debugPrint(newValue);
                                  monthsDropdownValue = newValue!;
                                });
                              },
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
                          padding: EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Text(
                                'Year',
                                style: TextStyle(
                                    color: notifire.getgreycolor,
                                    fontSize: height / 50,
                                    fontFamily: 'Gilroy Bold'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 400,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: height / 20,
                          // width: width / 2.3,
                          decoration: BoxDecoration(
                            color: notifire.getlightingcolor,
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          child: Center(
                            child: DropdownButton(
                              underline: const SizedBox(),
                              value: yearsDropdownValue,
                              icon: Row(
                                children: [
                                  // SizedBox(width: width / 20),
                                  Padding(
                                    padding: EdgeInsets.only(left: width / 11),
                                    child: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: height / 30,
                                      color: notifire.getgreycolor,
                                    ),
                                  ),
                                ],
                              ),
                              items: yearsItems.map((String seconditems) {
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
                                  debugPrint(newValue);
                                  yearsDropdownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /*Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 18),
                child: Customtextfild2.textField(
                  _birthDayController,
                  'dd / mm / yyyy',
                  notifire.getdarkscolor,
                  Image.asset(
                    "image/birthday.png",
                  ),
                  notifire.getlightingcolor,
                ),
              ),*/

              // InkWell(
              //   onTap: () {
              //     showCupertinoModalPopup(
              //       // barrierColor: Colors.red,
              //       context: context,
              //       builder: (BuildContext context) {
              //         return Container(
              //           height: 200,
              //           margin: EdgeInsets.symmetric(horizontal: 33, vertical: 0),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(22),
              //               topRight: Radius.circular(22),
              //             ),
              //             color: notifire.getprimerycolor,
              //           ),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.end,
              //             children: [
              //               // TextButton(
              //               //     onPressed: () {
              //               //       Navigator.pop(context);
              //               //     },
              //               //     child: Text('Done')),
              //               Padding(
              //                 padding: const EdgeInsets.symmetric(
              //                   vertical: 30.0,
              //                 ),
              //                 child: SizedBox(
              //                   height: 130,
              //                   child: CupertinoDatePicker(
              //                     mode: CupertinoDatePickerMode.date,
              //                     initialDateTime: DateTime.now(),
              //                     onDateTimeChanged: (DateTime newDateTime) {
              //                       // Do something
              //                       setState(() {
              //                         bDYear = newDateTime.year;
              //                         bDMonth = newDateTime.month;
              //                         bDDay = newDateTime.day;
              //                       });
              //                       if (kDebugMode) {
              //                         print('${newDateTime.year}');
              //                         print('${newDateTime.month}');
              //                         print('${newDateTime.day}');
              //                       }
              //                     },
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         );
              //         //   Container(
              //         //   height: 333,
              //         //   color: Colors.grey.shade200,
              //         // );
              //       },
              //     );
              //   },
              //   child: Container(
              //     margin: EdgeInsets.symmetric(horizontal: width / 18),
              //     height: height / 16,
              //     width: width,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: notifire.getlightingcolor,
              //     ),
              //     child: Row(
              //       children: [
              //         Padding(
              //           padding: EdgeInsets.all(height / 50),
              //           child: Image.asset(
              //             "image/birthday.png",
              //           ),
              //         ),
              //         Text(
              //           '$bDDay - $bDMonth - $bDYear',
              //           textAlign: TextAlign.start,
              //           style: TextStyle(
              //
              //               // fontFamily: 'Gilroy Bold',
              //               // fontWeight: FontWeight.w400,
              //               color: notifire.getdarkscolor,
              //               fontSize: height / 60),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              // calender by a button
              // Center(
              //   child: ElevatedButton(
              //       onPressed: () {
              //         showCupertinoModalPopup(
              //           // barrierColor: Colors.red,
              //           context: context,
              //           builder: (BuildContext context) {
              //             return Container(
              //               height: 250,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(22),
              //                 color: Colors.grey.shade200,
              //               ),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.end,
              //                 children: [
              //                   TextButton(
              //                       onPressed: () {
              //                         Navigator.pop(context);
              //                       },
              //                       child: Text('Done')),
              //                   Padding(
              //                     padding:
              //                         const EdgeInsets.symmetric(vertical: 30.0),
              //                     child: SizedBox(
              //                       height: 130,
              //                       child: CupertinoDatePicker(
              //                         mode: CupertinoDatePickerMode.date,
              //                         initialDateTime: DateTime.now(),
              //                         onDateTimeChanged: (DateTime newDateTime) {
              //                           // Do something
              //                           setState(() {
              //                             bDYear = newDateTime.year;
              //                             bDMonth = newDateTime.month;
              //                             bDDay = newDateTime.day;
              //                           });
              //                           if (kDebugMode) {
              //                             print('${newDateTime.year}');
              //                             print('${newDateTime.month}');
              //                             print('${newDateTime.day}');
              //                           }
              //                         },
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             );
              //             //   Container(
              //             //   height: 333,
              //             //   color: Colors.grey.shade200,
              //             // );
              //           },
              //         );
              //       },
              //       child: Text('Testing')),
              // ),

              SizedBox(
                height: height / 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 15,
                  ),
                  Text(
                    CustomStrings.password,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Gilroy Bold',
                        color: notifire.getdarkpinkscolor,
                        fontSize: height / 60),
                  ),
                ],
              ),
              SizedBox(
                height: height / 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 18),
                child: Customtextfild2.textField(
                  _passwordController,
                  CustomStrings.passwords,
                  notifire.getdarkscolor,
                  Image.asset("image/password.png"),
                  notifire.getlightingcolor,
                ),
              ),
              SizedBox(
                height: height / 15.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 18),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (_nameController.text.trim().isNotEmpty &&
                          _emailController.text.trim().isNotEmpty &&
                          _passwordController.text.trim().isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Account(
                                name: _nameController.text.trim().toString(),
                                email: _emailController.text.toString().trim(),
                                birthDate:
                                    '$daysDropdownValue-$monthsDropdownValue-$yearsDropdownValue',
                                password:
                                    _passwordController.text.toString().trim(),
                                initialPage: 0,
                              );
                            },
                          ),
                        );
                      } else {
                        Utils.flutterToast('Please fill all the fields');
                      }
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        CustomStrings.continues,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Gilroy Bold',
                            color: notifire.getpinkscolor,
                            fontSize: height / 40),
                      ),
                      const Spacer(),
                      Container(
                        height: height / 20,
                        width: width / 7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              notifire.getgcolor,
                              notifire.getg2color,
                              notifire.getg3color,
                              notifire.getg4color
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

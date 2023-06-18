import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colornotifire.dart';
import '../../utils/media.dart';
import '../../utils/string.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
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

  String heightDropdownValue = '170cm';
  var heightItems = [
    '150cm',
    '151cm',
    '152cm',
    '153cm',
    '154cm',
    '155cm',
    '156cm',
    '157cm',
    '158cm',
    '159cm',
    '160cm',
    '161cm',
    '162cm',
    '163cm',
    '164cm',
    '165cm',
    '166cm',
    '167cm',
    '168cm',
    '169cm',
    '170cm',
    '171cm',
    '172cm',
    '173cm',
    '174cm',
    '175cm',
    '176cm',
    '177cm',
    '178cm',
    '179cm',
    '180cm',
    '181cm',
    '182cm',
    '183cm',
    '184cm',
    '185cm',
    '186cm',
    '187cm',
    '188cm',
    '189cm',
    '190cm',
    '191cm',
    '192cm',
    '193cm',
    '194cm',
    '195cm',
    '196cm',
    '197cm',
    '198cm',
    '199cm',
    '200cm',
    '201cm',
    '202cm',
    '203cm',
    '204cm',
    '205cm',
    '206cm',
    '207cm',
    '208cm',
    '209cm',
    '210cm',
    '211cm',
    '212cm',
    '213cm',
    '214cm',
    '215cm',
    '216cm',
    '217cm',
    '218cm',
    '219cm',
    '220cm',
    '221cm',
    '222cm',
    '223cm',
    '224cm',
    '225cm',
    '226cm',
    '227cm',
    '228cm',
    '229cm',
    '230cm',
    '231cm',
    '232cm',
    '233cm',
    '234cm',
    '235cm',
    '236cm',
    '237cm',
    '238cm',
    '239cm',
    '240cm',
    '240+cm',
  ];

  String noOfChildrenDropdownValue = '0';
  var noOfChildrenItems = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '10+',
  ];

  String maritalStatusDropdownValue = 'Single';
  var maritalStatusItems = [
    'Single',
    'Married',
    'Divorced',
    'Widowed',
  ];

  String sectDropdownValue = 'Sunni';
  var sectItems = [
    'Sunni',
    'Shia',
    'Other',
  ];

  String muslimOrRevertDownValue = 'Born Muslim';
  var muslimOrRevertItems = [
    'Born Muslim',
    'Revert',
    'Other',
  ];

  String areYouOnMedicationDownValue = 'No';
  var areYouOnMedicationItems = [
    'No',
    'Yes',
  ];

  String doYouDrinkDownValue = 'No';
  var doYouDrinkItems = [
    'No',
    'Yes',
  ];

  String doYouSmokeDownValue = 'No';
  var doYouSmokeItems = [
    'No',
    'Yes',
  ];

  String ethnicityDownValue = 'South Asian';
  var ethnicityItems = [
    'South Asian',
    'Arab',
    'Oriental',
    'African',
    'Caucasian',
    'North African',
    'Turkish',
    'Hispanic',
    'Other',
  ];

  String levelOfReligiouslyDropdownValue = 'Moderate';
  var levelOfReligiouslyItems = [
    'Moderate',
    'Conservative',
    'Liberal',
  ];

  String nationalityDropdownValue = 'British';
  var nationalityItems = [
    'Afghan',
    'Albanian',
    'Algerian',
    'American',
    'Andorran',
    'Angolan',
    'Anguillan',
    'Argentine',
    'Armenian',
    'Australian',
    'Austrian',
    'Azerbaijani',
    'Bahamian',
    'Bahraini',
    'Bangladeshi',
    'Barbadian',
    'Belgian',
    'Belizean',
    'Beninese',
    'Bermudian',
    'Bhutanese',
    'Bolivian',
    'Botswanan',
    'Brazilian',
    'Belarusian',
    'British Virgin Islander',
    'Bruneian',
    'Bulgarian',
    'Burkinan',
    'Burmese',
    'Burundian',
    'British',
    'Cameroonian',
    'Cambodian',
    'Canadian',
    'Cape Verdean',
    'Cayman Islander',
    'Central African',
    'Chadian',
    'Chilean',
    'Chinese',
    'Citizen of Antigua and Barbuda',
    'Citizen of Bosnia and Herzegovina',
    'Citizen of Guinea-Bissau',
    'Citizen of Kiribati',
    'Citizen of Seychelles',
    'Citizen of the Dominican Republic',
    'Citizen of Vanuatu',
    'Colombian',
    'Comoran',
    'Congolese (Congo)',
    'Congolese (DRC)',
    'Cook Islander',
    'Costa Rican',
    'Croatian',
    'Cuban',
    'Cymraes',
    'Cymro',
    'Cypriot',
    'Czech',
    'Danish',
    'Djiboutian',
    'Dominican',
    'Dutch',
    'East Timorese',
    'Ecuadorean',
    'Egyptian',
    'Emirati',
    'English',
    'Equatorial Guinean',
    'Eritrean',
    'Estonian',
    'Ethiopian',
    'Faroese',
    'Fijian',
    'Filipino',
    'Finnish',
    'French',
    'Gabonese',
    'Gambian',
    'Georgian',
    'German',
    'Ghanaian',
    'Gibraltarian',
    'Greek',
    'Greenlandic',
    'Grenadian',
    'Guamanian',
    'Guatemalan',
    'Guinean',
    'Guyanese',
    'Haitian',
    'Honduran',
    'Hong Konger',
    'Hungarian',
    'Icelandic',
    'Indian',
    'Indonesian',
    'Iranian',
    'Iraqi',
    'Irish',
    'Israeli',
    'Italian',
    'Ivorian',
    'Jamaican',
    'Japanese',
    'Jordanian',
    'Kazakh',
    'Kenyan',
    'Kittitian',
    'Kosovan',
    'Kuwaiti',
    'Kyrgyz',
    'Lao',
    'Latvian',
    'Lebanese',
    'Liberian',
    'Libyan',
    'Liechtenstein citizen',
    'Lithuanian',
    'Luxembourger',
    'Macanese',
    'Macedonian',
    'Malagasy',
    'Malawian',
    'Malaysian',
    'Maldivian',
    'Malian',
    'Maltese',
    'Marshallese',
    'Martiniquais',
    'Mauritanian',
    'Mauritian',
    'Mexican',
    'Micronesian',
    'Moldovan',
    'Monegasque',
    'Mongolian',
    'Montenegrin',
    'Montserratian',
    'Moroccan',
    'Mosotho',
    'Mozambican',
    'Namibian',
    'Nauruan',
    'Nepalese',
    'New Zealander',
    'Nicaraguan',
    'Nigerian',
    'Nigerien',
    'Niuean',
    'North Korean',
    'Northern Irish',
    'Norwegian',
    'Omani',
    'Pakistani',
    'Palauan',
    'Palestinian',
    'Panamanian',
    'Papua New Guinean',
    'Paraguayan',
    'Peruvian',
    'Pitcairn Islander',
    'Polish',
    'Portuguese',
    'Prydeinig',
    'Puerto Rican',
    'Qatari',
    'Romanian',
    'Russian',
    'Rwandan',
    'Salvadorean',
    'Sammarinese',
    'Samoan',
    'Sao Tomean',
    'Saudi Arabian',
    'Scottish',
    'Senegalese',
    'Serbian',
    'Sierra Leonean',
    'Singaporean',
    'Slovak',
    'Slovenian',
    'Solomon Islander',
    'Somali',
    'South African',
    'South Korean',
    'South Sudanese',
    'Spanish',
    'Sri Lankan',
    'St Helenian',
    'St Lucian',
    'Stateless',
    'Sudanese',
    'Surinamese',
    'Swazi',
    'Swedish',
    'Swiss',
    'Syrian',
    'Taiwanese',
    'Tajik',
    'Tanzanian',
    'Thai',
    'Togolese',
    'Tongan',
    'Trinidadian',
    'Tristanian',
    'Tunisian',
    'Turkish',
    'Turkmen',
    'Turks Caicos Islander',
    'Tuvaluan',
    'Ugandan',
    'Ukrainian',
    'Uruguayan',
    'Uzbek',
    'Vatican citizen',
    'Venezuelan',
    'Vietnamese',
    'Vincentian',
    'Wallisian',
    'Welsh',
    'Yemeni',
    'Zambian',
    'Zimbabwean',
  ];

  String seconddropdownvalue = 'Male';
  var seconditems = [
    'Male',
    'Female',
  ];
  String firstdropdownvalue = '24';
  var firstitems = [
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
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60',
    '61',
    '62',
    '63',
    '64',
    '65',
    '66',
    '67',
    '68',
    '69',
    '70',
    '70+',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: Container(
                  //     height: height / 19,
                  //     width: width / 9,
                  //     decoration: BoxDecoration(
                  //       color: notifire.getpinkscolor,
                  //       borderRadius: const BorderRadius.all(
                  //         Radius.circular(10),
                  //       ),
                  //     ),
                  //     child: const Center(
                  //       child: Icon(
                  //         Icons.arrow_back_ios_outlined,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: width / 4,
                  // ),
                  Text(
                    'Create profile',
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
            // Padding(
            //   padding: EdgeInsets.only(left: width / 15),
            //   child: Row(
            //     children: [
            //       Text(
            //         CustomStrings.emaill,
            //         style: TextStyle(
            //             color: notifire.getgreycolor,
            //             fontSize: height / 50,
            //             fontFamily: 'Gilroy Bold'),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: height / 100,
            // ),
            // textfields(CustomStrings.emaill, "image/mail.png"),
            // SizedBox(
            //   height: height / 70,
            // ),

            // Padding(
            //   padding: EdgeInsets.only(left: width / 15),
            //   child: Row(
            //     children: [
            //       Text(
            //         CustomStrings.pnumber,
            //         style: TextStyle(
            //             color: notifire.getgreycolor,
            //             fontSize: height / 50,
            //             fontFamily: 'Gilroy Bold'),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: height / 100,
            // ),
            // textfields(CustomStrings.pnumber, "image/phone.png"),
            // SizedBox(
            //   height: height / 70,
            // ),
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
                            icon:
                                // Row(
                                //   children: [
                                //     SizedBox(width: width / 200),
                                //     Padding(
                                //       padding: EdgeInsets.only(left: width / 6),
                                //       child:
                                Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            //     ),
                            //   ],
                            // ),
                            items: seconditems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 2.3 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
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
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            items: firstitems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 2.3 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
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
                    'About Me',
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
                    hintText: 'About Me',
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

            // Padding(
            //   padding: EdgeInsets.only(left: width / 15),
            //   child: Row(
            //     children: [
            //       Text(
            //         CustomStrings.interest,
            //         style: TextStyle(
            //             color: notifire.getgreycolor,
            //             fontSize: height / 50,
            //             fontFamily: 'Gilroy Bold'),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: height / 100,
            // ),
            // textfields(CustomStrings.interest, "image/edit.png"),
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
            textfields(CustomStrings.address, img: "image/locations.png"),
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
                            'Marital Status',
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
                            value: maritalStatusDropdownValue,
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
                            items: maritalStatusItems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: Expanded(
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                maritalStatusDropdownValue = newValue!;
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
                            'Height',
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
                            value: heightDropdownValue,
                            icon: Row(
                              children: [
                                // SizedBox(width: width / 20),
                                Padding(
                                  padding: EdgeInsets.only(left: width / 5),
                                  child: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: height / 30,
                                    color: notifire.getgreycolor,
                                  ),
                                ),
                              ],
                            ),
                            items: heightItems.map((String seconditems) {
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
                                heightDropdownValue = newValue!;
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
                    'Profession',
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
            textfields(
              'Profession',
            ),
            SizedBox(
              height: height / 70,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 15),
              child: Row(
                children: [
                  Text(
                    'What Am I Looking For',
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
                    hintText: 'What Am I Looking For',
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
                            'No of Children',
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
                            value: noOfChildrenDropdownValue,
                            icon:
                                // Row(
                                //   children: [
                                //     SizedBox(width: width / 200),
                                //     Padding(
                                //       padding: EdgeInsets.only(left: width / 6),
                                //       child:
                                Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            //     ),
                            //   ],
                            // ),
                            items: noOfChildrenItems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 2.3 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                noOfChildrenDropdownValue = newValue!;
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
                            'Sect',
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
                            value: sectDropdownValue,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            items: sectItems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 2.3 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                sectDropdownValue = newValue!;
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
                    'Did You Have Any Health Issues? ',
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
                    hintText: 'Did You Have Any Health Issues?',
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
                            'Do You Drink?',
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
                            value: doYouDrinkDownValue,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            items: doYouDrinkItems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 2.3 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                doYouDrinkDownValue = newValue!;
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
                            'Do You Smoke?',
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
                            value: doYouSmokeDownValue,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            items: doYouSmokeItems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 2.3 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                doYouSmokeDownValue = newValue!;
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
                            'Born Muslim? Revert?',
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
                            value: muslimOrRevertDownValue,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            items:
                                muslimOrRevertItems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 2.3 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                muslimOrRevertDownValue = newValue!;
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
                            'Are You On Medication?',
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
                            value: areYouOnMedicationDownValue,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            items: areYouOnMedicationItems
                                .map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 2.3 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                areYouOnMedicationDownValue = newValue!;
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
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width / 15),
                      child: Row(
                        children: [
                          Text(
                            'Ethnicity',
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
                      padding: EdgeInsets.only(
                        left: width / 18,
                        right: width / 18,
                      ),
                      child: Container(
                        height: height / 20,
                        // width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.7),
                          border: Border.all(color: notifire.getdarkpinkscolor),
                        ),
                        child: Center(
                          child: DropdownButton(
                            underline: const SizedBox(),
                            value: ethnicityDownValue,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            items: ethnicityItems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 1.125 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                ethnicityDownValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: width / 18,
                        right: width / 18,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Nationality?',
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
                      padding:
                          EdgeInsets.only(right: width / 18, left: width / 18),
                      child: Container(
                        height: height / 20,
                        // width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.7),
                          border: Border.all(color: notifire.getdarkpinkscolor),
                        ),
                        child: Center(
                          child: DropdownButton(
                            underline: const SizedBox(),
                            value: nationalityDropdownValue,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            items: nationalityItems.map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 1.125 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                nationalityDropdownValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: width / 18,
                        right: width / 18,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Level Of Religiously',
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
                      padding:
                          EdgeInsets.only(right: width / 18, left: width / 18),
                      child: Container(
                        height: height / 20,
                        // width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.7),
                          border: Border.all(color: notifire.getdarkpinkscolor),
                        ),
                        child: Center(
                          child: DropdownButton(
                            underline: const SizedBox(),
                            value: levelOfReligiouslyDropdownValue,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              size: height / 30,
                              color: notifire.getgreycolor,
                            ),
                            items: levelOfReligiouslyItems
                                .map((String seconditems) {
                              return DropdownMenuItem(
                                value: seconditems,
                                child: SizedBox(
                                  width: width / 1.125 - 50,
                                  child: Text(
                                    seconditems,
                                    style: TextStyle(
                                        color: notifire.getdarkscolor,
                                        fontSize: height / 60,
                                        fontFamily: 'Gilroy Medium'),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                levelOfReligiouslyDropdownValue = newValue!;
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
              height: height / 20,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: width / 18),
            //   child: Center(
            //     child: Container(
            //       decoration: const BoxDecoration(
            //         borderRadius: BorderRadius.all(
            //           Radius.circular(30),
            //         ),
            //         gradient: LinearGradient(
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter,
            //           colors: [
            //             Color(0xffff6a95),
            //             Color(0xffff608e),
            //             Color(0xfffe4d82),
            //             Color(0xffff427b),
            //           ],
            //         ),
            //       ),
            //       height: height / 17,
            //       width: width,
            //       child: Center(
            //         child: Text(
            //           CustomStrings.savechanges,
            //           style: TextStyle(
            //               color: Colors.white,
            //               fontSize: height / 45,
            //               fontFamily: 'Gilroy Bold'),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget textfields(txt, {img}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 18),
      child: Container(
        child: TextField(
          style: TextStyle(fontSize: 15.0, color: notifire.getdarkscolor),
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: EdgeInsets.all(height / 90),
              child: img == null
                  ? SizedBox()
                  : Image(
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

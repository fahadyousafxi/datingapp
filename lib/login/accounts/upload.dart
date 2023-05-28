import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colornotifire.dart';
import '../../utils/media.dart';
import '../../utils/string.dart';

class Media extends StatefulWidget {
  const Media({Key? key}) : super(key: key);

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
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

  PickedFile? imageFile;
  PickedFile? imageFile1;
  PickedFile? imageFile2;
  PickedFile? imageFile3;
  PickedFile? imageFile4;
  PickedFile? imageFile5;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 15,
              ),
              Center(
                child: Text(
                  CustomStrings.upload,
                  style: TextStyle(
                      color: notifire.getdarkscolor,
                      fontSize: height / 28,
                      fontFamily: 'Gilroy Bold'),
                ),
              ),
              SizedBox(
                height: height / 10,
              ),
              Row(
                children: [
                  (imageFile == null)
                      ? Container(
                          height: height / 3.6,
                          width: width / 1.7,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset(
                                    "image/match4.png",
                                    fit: BoxFit.cover,
                                    width: width,
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: height / 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // setState(() {
                                        //   _openCamera(context);
                                        // });
                                      },
                                      child: Center(
                                        child: Container(
                                          height: height / 22,
                                          width: width / 2.5,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                                size: height / 40,
                                              ),
                                              SizedBox(
                                                width: width / 100,
                                              ),
                                              Text(
                                                CustomStrings.changephoto,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: height / 60,
                                                    fontFamily: 'Gilroy Bold'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          height: height / 3.6,
                          width: width / 1.7,
                          color: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Image.file(
                                  File(
                                    imageFile!.path,
                                  ),
                                  width: width,
                                  fit: BoxFit.cover,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: height / 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // setState(() {
                                        //   _openCamera(context);
                                        // });
                                      },
                                      child: Center(
                                        child: Container(
                                          height: height / 22,
                                          width: width / 2.5,
                                          decoration: BoxDecoration(
                                            color:
                                            Colors.white.withOpacity(0.6),
                                            borderRadius:
                                            BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                                size: height / 40,
                                              ),
                                              SizedBox(
                                                width: width / 100,
                                              ),
                                              Text(
                                                CustomStrings.changephoto,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: height / 60,
                                                    fontFamily: 'Gilroy Bold'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                  const Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   _openCamera1(context);
                          // });
                        },
                        child: (imageFile1 == null)
                            ? Container(
                                height: height / 7.5,
                                width: width / 3.5,
                                decoration: BoxDecoration(
                                  color: notifire.getlightingcolor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height / 100,
                                    ),
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      color: notifire.getpinkscolor
                                          .withOpacity(0.4),
                                      size: height / 20,
                                    ),
                                    SizedBox(
                                      height: height / 80,
                                    ),
                                    Container(
                                      height: height / 30,
                                      width: width / 5,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: notifire.getpinkscolor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Add",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: height / 60,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                height: height / 7.5,
                                width: width / 3.5,
                                color: Colors.transparent,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  child: Image.file(
                                    File(
                                      imageFile1!.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   _openCamera2(context);
                          // });
                        },
                        child: (imageFile2 == null)
                            ? Container(
                                height: height / 7.5,
                                width: width / 3.5,
                                decoration: BoxDecoration(
                                  color: notifire.getlightingcolor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height / 100,
                                    ),
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      color: notifire.getpinkscolor
                                          .withOpacity(0.4),
                                      size: height / 20,
                                    ),
                                    SizedBox(
                                      height: height / 80,
                                    ),
                                    Container(
                                      height: height / 30,
                                      width: width / 5,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: notifire.getpinkscolor),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Add",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: height / 60,
                                                fontFamily: 'Gilroy Bold'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                height: height / 7.5,
                                width: width / 3.5,
                                color: Colors.transparent,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  child: Image.file(
                                    File(
                                      imageFile2!.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height / 100,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   _openCamera3(context);
                      // });
                    },
                    child: (imageFile3 == null)
                        ? Container(
                            height: height / 7.5,
                            width: width / 3.5,
                            decoration: BoxDecoration(
                              color: notifire.getlightingcolor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height / 100,
                                ),
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color:
                                      notifire.getpinkscolor.withOpacity(0.4),
                                  size: height / 20,
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  height: height / 30,
                                  width: width / 5,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: notifire.getpinkscolor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Add",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height / 60,
                                            fontFamily: 'Gilroy Bold'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: height / 7.5,
                            width: width / 3.5,
                            color: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: Image.file(
                                File(
                                  imageFile3!.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   _openCamera4(context);
                      // });
                    },
                    child: (imageFile4 == null)
                        ? Container(
                            height: height / 7.5,
                            width: width / 3.5,
                            decoration: BoxDecoration(
                              color: notifire.getlightingcolor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height / 100,
                                ),
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color:
                                      notifire.getpinkscolor.withOpacity(0.4),
                                  size: height / 20,
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  height: height / 30,
                                  width: width / 5,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: notifire.getpinkscolor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Add",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height / 60,
                                            fontFamily: 'Gilroy Bold'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: height / 7.5,
                            width: width / 3.5,
                            color: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: Image.file(
                                File(
                                  imageFile4!.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   _openCamera5(context);
                      // });
                    },
                    child: (imageFile5 == null)
                        ? Container(
                            height: height / 7.5,
                            width: width / 3.5,
                            decoration: BoxDecoration(
                              color: notifire.getlightingcolor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height / 100,
                                ),
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color:
                                      notifire.getpinkscolor.withOpacity(0.4),
                                  size: height / 20,
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Container(
                                  height: height / 30,
                                  width: width / 5,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: notifire.getpinkscolor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Add",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: height / 60,
                                            fontFamily: 'Gilroy Bold'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: height / 7.5,
                            width: width / 3.5,
                            color: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: Image.file(
                                File(
                                  imageFile5!.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              SizedBox(height: height / 10,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30),),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        notifire.getg4color,notifire.getg3color,notifire.getg2color,notifire.getgcolor
                      ],
                    ),
                  ),
                  height: height / 17,
                  width: width / 1.3,
                  child: Center(
                    child: Text(
                      CustomStrings.next,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height / 45,
                          fontFamily: 'Gilroy Bold'),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: width / 50),
              //   child: Row(
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           setState(() {
              //             _openCamera(context);
              //           });
              //         },
              //         child: ClipRRect(
              //           borderRadius:
              //               const BorderRadius.all(Radius.circular(20)),
              //           child: Container(
              //             child: (imageFile == null)
              //                 ? DottedBorder(
              //                     dashPattern: const [6, 6, 6, 6],
              //                     borderType: BorderType.RRect,
              //                     color: notifire.getdarkpinkscolor,
              //                     radius: const Radius.circular(20),
              //                     child: Container(
              //                       height: height / 4.3,
              //                       width: width / 2.8,
              //                       color:
              //                           notifire.getpinkscolor.withOpacity(0.3),
              //                       child: Center(
              //                         child: Container(
              //                           height: height / 10,
              //                           width: width / 7,
              //                           decoration: BoxDecoration(
              //                             color: notifire.getpinkscolor,
              //                             shape: BoxShape.circle,
              //                           ),
              //                           child: const Icon(
              //                             Icons.add,
              //                             color: Colors.white,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   )
              //                 : Container(
              //                     height: height / 4.3,
              //                     width: width / 2.8,
              //                     color: Colors.transparent,
              //                     child: ClipRRect(
              //                       borderRadius: const BorderRadius.all(
              //                         Radius.circular(15),
              //                       ),
              //                       child: Image.file(
              //                         File(
              //                           imageFile!.path,
              //                         ),
              //                         fit: BoxFit.cover,
              //                       ),
              //                     ),
              //                   ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // void _openCamera(BuildContext context) async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //   );
  //   setState(() {
  //     imageFile = pickedFile!;
  //   });
  // }

  // void _openCamera1(BuildContext context) async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //   );
  //   setState(() {
  //     imageFile1 = pickedFile!;
  //   });
  // }

  // void _openCamera2(BuildContext context) async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //   );
  //   setState(() {
  //     imageFile2 = pickedFile!;
  //   });
  // }

  // void _openCamera3(BuildContext context) async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //   );
  //   setState(() {
  //     imageFile3 = pickedFile!;
  //   });
  // }

  // void _openCamera4(BuildContext context) async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //   );
  //   setState(() {
  //     imageFile4 = pickedFile!;
  //   });
  // }

  // void _openCamera5(BuildContext context) async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //   );
  //   setState(() {
  //     imageFile5 = pickedFile!;
  //   });
  // }
}

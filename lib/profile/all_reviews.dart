import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colornotifire.dart';
import '../utils/media.dart';
import '../utils/string.dart';

class AllReview extends StatefulWidget {
  final Widget? childIndicator;
  const AllReview({required this.childIndicator, Key? key}) : super(key: key);

  @override
  State<AllReview> createState() => _AllReviewState();
}

class _AllReviewState extends State<AllReview> {
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
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: SizedBox(
        // width: size.width / 2,
        child:
            // sellerProvider.getSellerReviewsDataList.isEmpty
            //     ? Center(child: Text('No Reviews'))
            //     :
            ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            // var data = sellerProvider.getSellerReviewsDataList[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                index == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            CustomStrings.review,
                            style: TextStyle(
                                color: notifire.getdarkscolor,
                                fontSize: height / 50,
                                fontFamily: 'Gilroy Bold'),
                          ),
                        ],
                      )
                    : SizedBox(),
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  height: height / 5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: notifire.getpinkscolor.withOpacity(0.3),
                  ),
                  child: Column(
                    children: [
                      index == 1 ? matches() : matches2(),
                      SizedBox(
                        height: height / 80,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 80,
                ),
                index == 2 ? widget.childIndicator! : SizedBox(),

                /// old review ui
                // Container(
                //   // height: 111,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade200,
                //     borderRadius: BorderRadius.circular(22),
                //     border: Border.all(
                //       color: Colors.black,
                //     ),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.5),
                //         spreadRadius: 5,
                //         blurRadius: 7,
                //         offset: Offset(0, 3), // changes position of shadow
                //       ),
                //     ],
                //   ),
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: 5,
                //       ),
                //       Row(
                //         children: [
                //           CircleAvatar(
                //             backgroundImage:
                //                 AssetImage('assets/images/profile.png'),
                //           ),
                //           Text(
                //             '    John',
                //             style: TextStyle(
                //                 fontSize: 18, fontWeight: FontWeight.bold),
                //           )
                //         ],
                //       ),
                //       SizedBox(
                //         height: 15,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Row(
                //             children: List.generate(
                //                 // data.reviewRating!,
                //                 5,
                //                 (index) => const Icon(
                //                       Icons.star,
                //                       color: Colors.orange,
                //                       size: 20,
                //                     )),
                //           ),
                //           Row(
                //             children: List.generate(
                //                 // 5 - data.reviewRating!,
                //                 0,
                //                 (index) => const Icon(
                //                       Icons.star,
                //                       color: Colors.grey,
                //                       size: 20,
                //                     )),
                //           ),
                //           Text(
                //             '(5)',
                //             style: TextStyle(
                //                 fontSize: 18, fontWeight: FontWeight.bold),
                //           )
                //         ],
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           'Goon one',
                //           style: TextStyle(fontSize: 18),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 8,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget matches() {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amelia',
                  style: TextStyle(
                      color: notifire.getdarkscolor.withOpacity(0.7),
                      fontSize: height / 40,
                      fontFamily: 'Gilroy Bold'),
                ),
                Text(
                  '5 Jun 2023',
                  style: TextStyle(
                      color: notifire.getdarkscolor.withOpacity(0.6),
                      fontSize: height / 60,
                      fontFamily: 'Gilroy Medium'),
                ),
              ],
            )
          ],
        ),

        SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: List.generate(
                  // data.reviewRating!,
                  5,
                  (index) => const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 20,
                      )),
            ),
            Row(
              children: List.generate(
                  // 5 - data.reviewRating!,
                  0,
                  (index) => const Icon(
                        Icons.star,
                        color: Colors.grey,
                        size: 20,
                      )),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Good one',
            style: TextStyle(
                color: notifire.getdarkscolor.withOpacity(0.6),
                fontSize: height / 60,
                fontFamily: 'Gilroy Medium'),
          ),
        ),
        // Text(
        //   CustomStrings.getmatches,
        //   style: TextStyle(
        //       color: notifire.getdarkscolor.withOpacity(0.7),
        //       fontSize: height / 40,
        //       fontFamily: 'Gilroy Bold'),
        // ),
        // SizedBox(
        //   height: height / 100,
        // ),
        // Text(
        //   CustomStrings.boost,
        //   style: TextStyle(
        //       color: notifire.getdarkscolor.withOpacity(0.6),
        //       fontSize: height / 60,
        //       fontFamily: 'Gilroy Medium'),
        // ),
      ],
    );
  }

  Widget matches2() {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Karn',
                  style: TextStyle(
                      color: notifire.getdarkscolor.withOpacity(0.7),
                      fontSize: height / 40,
                      fontFamily: 'Gilroy Bold'),
                ),
                Text(
                  '2 May 2023',
                  style: TextStyle(
                      color: notifire.getdarkscolor.withOpacity(0.6),
                      fontSize: height / 60,
                      fontFamily: 'Gilroy Medium'),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: List.generate(
                  // data.reviewRating!,
                  5,
                  (index) => const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 20,
                      )),
            ),
            Row(
              children: List.generate(
                  // 5 - data.reviewRating!,
                  0,
                  (index) => const Icon(
                        Icons.star,
                        color: Colors.grey,
                        size: 20,
                      )),
            ),
            // Text(
            //   '(5)',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'One of my favourite people',
            style: TextStyle(
                color: notifire.getdarkscolor.withOpacity(0.6),
                fontSize: height / 60,
                fontFamily: 'Gilroy Medium'),
          ),
        ),
      ],
    );
  }
}

import 'package:dating/bottom/inbox/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colornotifire.dart';
import '../../utils/media.dart';
import '../../utils/string.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
  List imgs = [
    "image/match1.png",
    "image/match2.png",
    "image/match3.png",
    "image/match7.png",
    "image/match5.png",
    "image/match6.png",
    "image/match3.png",
    "image/match11.png"
  ];

  List img = [
    "image/match3.png",
    "image/match5.png",
    "image/match11.png",
    "image/match1.png",
    "image/match5.png",
    "image/match6.png",
    "image/match3.png",
    "image/match5.png"
  ];
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getdarkpinkscolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 20,
            ),
            Center(
              child: Text(
                CustomStrings.messages,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: height / 40,
                    fontFamily: 'Gilroy Bold'),
              ),
            ),
            SizedBox(height: height / 30,),
            Row(
              children: [
                SizedBox(width: width / 20,),
                Text(
                  CustomStrings.recent,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 50,
                      fontFamily: 'Gilroy Bold'),
                ),
              ],
            ),
            SizedBox(height: height / 40,),
            Container(
              height: height / 10,
              width: width,
              color: notifire.getdarkpinkscolor,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: width / 20),
                    child: Column(
                      children: [
                        Container(
                          height: height / 10,
                          width: width / 5,
                          decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(15),),
                              child: Image.asset(imgs[index],fit: BoxFit.cover,)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: height / 40,),
         Container(
           height: height / 1.5,
           color: Colors.transparent,
           child: ListView.builder(itemCount: 1,padding: EdgeInsets.zero,itemBuilder: (context, index) {
             return Container(
               height: height / 1.5,
               width: width,
               decoration: BoxDecoration(
                   color: notifire.getlightingscolor,
                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(20))
               ),
               child: Column(
                 children: [
                   SizedBox(height: height / 80,),
                   Container(
                     height: height / 1.6,
                     color: Colors.transparent,
                     child: ListView.builder(padding: EdgeInsets.only(bottom: height / 100),itemCount: 8,itemBuilder: (context, index) {
                       return GestureDetector(
                           onTap:(){
                             Navigator.push(context, MaterialPageRoute(builder: (context){
                               return const Chat();
                             },),);
                           },child: chats(imgs[index],),);
                     },),
                   ),

                 ],
               ),
             );
           },),
         )
          ],
        ),
      ),
    );
  }
  Widget chats(img){
    return  Column(
      children: [
        SizedBox(height: height / 100,),
        Padding(
          padding:EdgeInsets.symmetric(horizontal: width / 20),
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  height: height / 12,
                  width: width / 7,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(img),
                  ),
                ),

                SizedBox(width: width / 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      CustomStrings.alfredo,
                      style: TextStyle(
                          color: notifire.getdarkscolor,
                          fontSize: height / 50,
                          fontFamily: 'Gilroy Bold'),
                    ),
                    SizedBox(height: height / 150,),
                    Text(
                      CustomStrings.iknow,
                      style: TextStyle(
                          color: notifire.getgreycolor,
                          fontSize: height / 60,
                          fontFamily: 'Gilroy Medium'),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: height / 70,
                      width: width / 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: notifire.getdarkpinkscolor
                      ),
                    ),
                    SizedBox(height: height / 100,),
                    Text(
                      "09:18",
                      style: TextStyle(
                          color: notifire.getgreycolor,
                          fontSize: height / 60,
                          fontFamily: 'Gilroy Medium'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
       SizedBox(height: height / 100,),
       Container(
         height: height / 1000,
         width: width,
         color: Colors.grey,
       ),
      ],
    );
  }
}

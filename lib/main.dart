import 'package:dating/spleshscreen.dart';
import 'package:dating/view_model/auth_view_model.dart';
import 'package:dating/view_model/profile_view_model.dart';
import 'package:dating/view_model/uploads_photos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/colornotifire.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorNotifire()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UploadPhotosViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: const MaterialApp(
        home: Spleshscreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

//
//
// import 'package:flutter/material.dart';
// import 'package:swipe_cards/swipe_cards.dart';
//
// void main() {
//   runApp(SwipeGallery());
// }
//
// class SwipeGallery extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Swipe Gallery Items',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<SwipeItem> _swipeItems = <SwipeItem>[];
//   late MatchEngine _matchEngine;
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//   final List<String> _names = [
//     'image/onbonding1.png',
//     'image/onbonding2.png',
//     'image/onbonding3.png',
//     'image/onbonding1.png',
//     'image/onbonding2.png',
//     'image/onbonding3.png',
//     'image/onbonding1.png',
//     'image/onbonding2.png',
//     'image/onbonding3.png',
//   ];
//
//   @override
//   void initState() {
//
//     for (int i = 0; i < _names.length; i++) {
//       _swipeItems.add(SwipeItem(
//           content: Content(
//             text: _names[i],
//           ),
//           likeAction: () {
//             _scaffoldKey.currentState!.showSnackBar(SnackBar(
//               content: Text("Liked ${_names[i]}"),
//               duration: const Duration(milliseconds: 500),
//             ));
//           },
//           nopeAction: () {
//             _scaffoldKey.currentState!.showSnackBar(SnackBar(
//               content: Text("Nope ${_names[i]}"),
//               duration: const Duration(milliseconds: 500),
//             ));
//           },
//           superlikeAction: () {
//             _scaffoldKey.currentState!.showSnackBar(SnackBar(
//               content: Text("Superliked ${_names[i]}"),
//               duration: const Duration(milliseconds: 500),
//             ));
//           }));
//     }
//
//     _matchEngine = MatchEngine(swipeItems: _swipeItems);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//       ),
//       body: Stack(
//         children: [
//           Container(
//             height: 300,
//             color: Colors.blue,
//             child: SwipeCards(
//               matchEngine: _matchEngine,
//               itemBuilder: (BuildContext context, int index) {
//                 return Stack(
//                   children: [
//                     Container(
//                         alignment: Alignment.center,
//                         color: Colors.red,
//                         child: Image.asset(
//                           '${_names[index]}',
//                           fit: BoxFit.cover,
//                         ) ,
//                     ),
//                     Column(
//                       children: [
//                         SizedBox(height: 250,),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             ElevatedButton(
//                                 style: ButtonStyle(
//                                     backgroundColor:
//                                     MaterialStateProperty.all(Colors.orange)),
//                                 onPressed: () {
//                                   _matchEngine.currentItem?.nope();
//                                 },
//                                 child: Text("Nope")),
//                             ElevatedButton(
//                                 onPressed: () {
//                                   _matchEngine.currentItem?.superLike();
//                                 },
//                                 child: Text("Superlike")),
//                             ElevatedButton(
//                                 style: ButtonStyle(
//                                     backgroundColor:
//                                     MaterialStateProperty.all(Colors.green)),
//                                 onPressed: () {
//                                   _matchEngine.currentItem?.like();
//                                 },
//                                 child: Text("Like"))
//                           ],
//                         ),
//                       ],
//                     ),
//
//                   ],
//                 );
//               },
//               onStackFinished: () {
//                 _scaffoldKey.currentState!.showSnackBar(SnackBar(
//                   content: Text("Stack Finished"),
//                   duration: Duration(milliseconds: 500),
//                 ));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

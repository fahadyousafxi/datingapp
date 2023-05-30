// import 'package:another_flushbar/flushbar.dart';
// import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  // static final auth = FirebaseAuth.instance.currentUser;

  static flutterToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // static void flushBarErrorMessage(context, {required String? message}) {
  //   showFlushbar(
  //     context: context,
  //     flushbar: Flushbar(
  //       message: message,
  //       backgroundColor: Colors.red,
  //       forwardAnimationCurve: Curves.decelerate,
  //       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //       padding: EdgeInsets.all(15),
  //       duration: Duration(seconds: 3),
  //       flushbarPosition: FlushbarPosition.TOP,
  //       reverseAnimationCurve: Curves.easeInOut,
  //       positionOffset: 20,
  //       borderRadius: BorderRadius.circular(10),
  //       icon: Icon(
  //         Icons.error,
  //         size: 28,
  //         color: Colors.white,
  //       ),
  //     )..show(context),
  //   );
  // }

  static snackBar(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    ));
  }

  /// Field Focus Change Function
  static void fieldFocusChange(
    BuildContext context, {
    required FocusNode current,
    required FocusNode nextFocus,
  }) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

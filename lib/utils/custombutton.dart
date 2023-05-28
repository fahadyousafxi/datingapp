import 'package:flutter/material.dart';
import 'media.dart';

class Custombutton {
  static Widget button(text,clr1,clr2,clr3,clr4){
    return Center(
        child: Container(
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30),),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  clr4,
                  clr3,
                  clr2,
                  clr1,
                ],
              ),
          ),
          height: height / 17,
          width: width / 1.3,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: height / 45,
                  fontFamily: 'Gilroy Bold'),
            ),
          ),
        ),
    );
  }
}
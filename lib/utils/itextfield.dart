import 'package:flutter/material.dart';

import 'media.dart';

class Customtextfild2 {
  static Widget textField(name1,textcolor,se,clr) {
    return Container(
        color: Colors.transparent,
        height: height / 16,
        width: width,
        child: TextField(
          style: TextStyle(color: textcolor),
          decoration: InputDecoration(filled: true,contentPadding: EdgeInsets.zero,
            fillColor: clr,
            border: OutlineInputBorder(borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),hintText: name1,
            hintStyle: TextStyle(color: Colors.grey,fontSize: height / 50,),
            prefixIcon: Padding(
                padding: EdgeInsets.all(height / 50),
                child: se
            ),
          ),
        ),
      );
  }
}

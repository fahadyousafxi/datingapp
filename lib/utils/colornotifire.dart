import 'package:flutter/material.dart';
import 'color.dart';

class ColorNotifire with ChangeNotifier {
  bool isDark = false;
  set setIsDark(value) {
    isDark = value;
    notifyListeners();
  }

  get getIsDark => isDark;
  get getprimerycolor => isDark ? darkPrimeryColor : primeryColor;
  get getdarkscolor => isDark ? lightColor : darkColor;
  get getlightcolor => isDark ? darkColor : lightColor;
  get getlightpinkcolor => isDark ? greyColor : pinkColor;
  get getlightingcolor => isDark ? darkpinkColor.withOpacity(0.4) : lightColor;
  get getlightingscolor => isDark ? darkg4pinkColor : lightColor;
  get getpinkscolor => isDark ? darkpinkColor : pinkColor;
  get getpinksscolor => isDark ? lightColor : pinkColor;
  get getdarkpinkscolor => isDark ? darkspinksColor : darkspinkColor;
  get getdarkspinkcolor => isDark ? lightColor : darkspinkColor;
  get getgreycolor => isDark ? darkgreyColor : greyColor;
  get getgcolor => isDark ? darkgpinkColor : lightgpinkColor;
  get getg2color => isDark ? darkg2pinkColor : lightg2pinkColor;
  get getg3color => isDark ? darkg3pinkColor : lightg3pinkColor;
  get getg4color => isDark ? darkg4pinkColor : lightg4pinkColor;
  get getg5color => isDark ? darkg5pinkColor : lightg5pinkColor;
  get getg6color => isDark ? darkg6pinkColor : lightg6pinkColor;
  get getg7color => isDark ? darkg7pinkColor : lightg7pinkColor;
  get getg8color => isDark ? darkg8pinkColor : lightg8pinkColor;

}

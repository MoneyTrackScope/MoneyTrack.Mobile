import 'package:flutter/material.dart';

import './constants.dart';

ThemeData basicTheme() => ThemeData(
    brightness: Brightness.dark,
    // bottomAppBarColor: Colors.teal,
    // colorScheme: ColorScheme(
    //   brightness: Brightness.dark,
    //   surface: Colors.red,
    //   onSurface: Colors.teal,
    //   background: Colors.yellow,
    //   onBackground: Colors.yellow,
    //   onSecondary: Colors.yellow,
    //   secondary: Colors.yellow,
    //   onPrimary: Colors.yellow,
    //   primary: Colors.yellow,
    //   error: Colors.yellow,
    //   onError: Colors.yellow,
    // ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontFamily: FontNameTitle,
        fontSize: LargeTextSize,
      ),
      headline4: TextStyle(
        fontFamily: FontNameDefault,
        fontSize: MediumTextSize,
        fontWeight: FontWeight.w800,
      ),
      bodyText1: TextStyle(
        fontFamily: FontNameDefault,
        fontSize: BodyTextSize,
      ),
    ));

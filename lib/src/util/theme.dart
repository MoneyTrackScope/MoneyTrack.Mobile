import 'package:flutter/material.dart';

import './constants.dart';

ThemeData basicTheme() => ThemeData(
      brightness: Brightness.dark,
      primaryColor: kPrimaryColor,
      textTheme: TextTheme(
        headline6: const TextStyle(
          fontFamily: FontNameTitle,
          fontSize: LargeTextSize,
          color: Color.fromARGB(255, 27, 142, 242),
        ),
        headline4: TextStyle(
          fontFamily: FontNameDefault,
          fontSize: MediumTextSize,
          fontWeight: FontWeight.w800,
          color: kSecondaryColor,
        ),
        bodyText1: const TextStyle(
          fontFamily: FontNameDefault,
          fontSize: BodyTextSize,
          color: Colors.green,
        ),
      ),
      iconTheme: const IconThemeData(
        // color: Colors.red,
        size: 25.0,
        color: Colors.blue,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.red,
        foregroundColor: Colors.purple,
      ),
      buttonTheme: const ButtonThemeData(
        height: 80,
        buttonColor: Colors.deepPurple,
        textTheme: ButtonTextTheme.accent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              primary: Color.fromARGB(255, 177, 23, 215), // background color
              textStyle: const TextStyle(
                  fontFamily: FontNameDefault,
                  fontSize: BodyTextSize,
                  color: Color.fromARGB(255, 176, 47, 33)))
          // bottomAppBarColor: Colors.deepPurple,
          // cardColor: Colors.orange.shade100,
          // scaffoldBackgroundColor: Colors.yellow,
          ),
    );

import 'package:flutter/material.dart';

import './constants.dart';

ThemeData basicTheme() => ThemeData(
    brightness: Brightness.dark,
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

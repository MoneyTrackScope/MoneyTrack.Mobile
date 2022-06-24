// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

const double? LargeTextSize = 26.0;
const double? MediumTextSize = 15.0;
const double? BodyTextSize = 11.0;

const String FontNameDefault = 'DMSans';
const String FontNameTitle = 'WorkSans';

//Color kPrimaryColor = const Color.fromARGB(255, 26, 46, 64);
Color kPrimaryColor = const Color.fromARGB(255, 26, 46, 64);
Color kSecondaryColor = const Color.fromARGB(255, 125, 183, 234);
//Color kSecondaryColor = const Color.fromARGB(255, 6, 8, 13);
Color kBackgroundColor = Color.fromARGB(221, 6, 8, 13);

//Color kAccentColor =const Color.fromARGB(255, 190, 43, 43);
Color kAccentColor = Color.fromARGB(255, 180, 8, 45);

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'WorkSans',
);

const kLabelStyle = TextStyle(
  color: Color.fromARGB(255, 120, 192, 236),
  fontWeight: FontWeight.bold,
  fontFamily: 'DMSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: const Color.fromARGB(59, 92, 184, 242),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(86, 0, 0, 0),
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

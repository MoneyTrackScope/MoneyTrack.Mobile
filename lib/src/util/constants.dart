// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

const double? LargeTextSize = 26.0;
const double? MediumTextSize = 20.0;
const double? BodyTextSize = 16.0;

const String FontNameDefault = 'DMSans';
const String FontNameTitle = 'WorkSans';

//Color kPrimaryColor = const Color.fromARGB(255, 26, 46, 64);
Color kPrimaryColor = const Color.fromARGB(255, 26, 46, 64);
Color kSecondaryColor = const Color.fromARGB(255, 34, 162, 242);
//Color kSecondaryColor = const Color.fromARGB(255, 6, 8, 13);
Color kBackgroundColor = const Color.fromARGB(155, 6, 8, 13);

//Color kAccentColor =const Color.fromARGB(255, 190, 43, 43);
Color kAccentColor = const Color.fromARGB(255, 190, 43, 43);

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'WorkSans',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'DMSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color.fromARGB(83, 92, 184, 242),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

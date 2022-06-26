import 'package:flutter/material.dart';

class ThemeBase {
  String fontNameDefault = 'DMSans';
  String fontNameTitle = 'WorkSans';

  double largeTextSize = 26.0;
  double mediumTextSize = 15.0;
  double bodyTextSize = 11.0;

  Color primaryColor = const Color.fromARGB(255, 26, 46, 64);
  Color secondaryColor = const Color.fromARGB(255, 125, 183, 234);

  Color primaryButtonTextColor = const Color.fromARGB(221, 6, 8, 13);
  late LinearGradient primaryButtonGradient;
  late List<BoxShadow> primaryButtonShadowList;
  late List<Shadow> primaryButtonTextShadowList;
  late TextStyle primaryButtonTextStyle;

  ThemeBase() {
    primaryButtonGradient = const LinearGradient(
      colors: [
        Color.fromARGB(159, 27, 142, 242),
        Color.fromARGB(151, 92, 184, 242),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    primaryButtonShadowList = [
      BoxShadow(
        color: secondaryColor.withOpacity(0.2),
        spreadRadius: 4,
        blurRadius: 10,
        offset: const Offset(0, 3),
      )
    ];

    primaryButtonTextShadowList = const [
      Shadow(
        offset: Offset(0.0, 0.0),
        blurRadius: 1.0,
        color: Color.fromARGB(255, 7, 18, 24),
      ),
      Shadow(
        offset: Offset(0.0, 0.0),
        blurRadius: 5.0,
        color: Color.fromARGB(53, 4, 13, 19),
      ),
    ];

    primaryButtonTextStyle = TextStyle(
        fontWeight: FontWeight.normal,
        color: primaryButtonTextColor,
        shadows: primaryButtonTextShadowList,
        fontSize: mediumTextSize);
  }
}

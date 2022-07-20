import 'package:flutter/material.dart';

class ThemeBase {
  String fontNameDefault = 'DMSans';
  String fontNameTitle = 'WorkSans';

  double titleTextSize = 33;
  double largeTextSize = 26.0;
  double mediumLargeTextStyle = 20.0;
  double mediumTextSize = 15.0;
  double bodyTextSize = 11.0;

  Color primaryColor = const Color.fromARGB(255, 17, 30, 42);
  Color secondaryColor = const Color.fromARGB(255, 125, 183, 234);

  Color lastBackgroundGradientColor = const Color.fromARGB(255, 27, 37, 62);
  //Color appBarTitleColor = Colors.white70;

  Color nonAccentColor = Colors.white54;

  // Primary button styles
  Color primaryButtonTextColor = const Color.fromARGB(221, 6, 8, 13);
  late LinearGradient primaryButtonGradient;
  late List<BoxShadow> primaryButtonShadowList;
  late List<Shadow> primaryButtonTextShadowList;
  late TextStyle primaryButtonTextStyle;

  late List<Color> backgroundColorList;

  late TextStyle titleTextStyle;

  late TextStyle labelTextStyle;

  final textInputDecorationStyle = BoxDecoration(
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

  late TextStyle hintTextStyle;

  final Color inputColor = Colors.white;
  late TextStyle inputTextStyle;

  late LinearGradient appOutlineButtonGradient;
  late TextStyle appOutlineButtonContentStyle;

  LinearGradient introductionBackgroundGradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromARGB(0, 36, 65, 91),
        Color.fromARGB(162, 27, 37, 62),
        Color.fromARGB(255, 27, 37, 62),
      ]);

  late TextStyle appBarTitleStyle;

  late TextStyle drawerTextStyle;

  ThemeBase() {
    backgroundColorList = [
      const Color.fromARGB(255, 36, 65, 91),
      const Color.fromARGB(255, 27, 37, 62),
      lastBackgroundGradientColor
    ];

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
        fontSize: mediumTextSize,
        fontFamily: fontNameDefault);

    titleTextStyle = TextStyle(
      fontFamily: fontNameTitle,
      fontSize: titleTextSize,
      color: secondaryColor,
      shadows: const [
        Shadow(
          offset: Offset(0.0, 0.0),
          blurRadius: 5.0,
          color: Color.fromARGB(138, 34, 162, 242),
        ),
        Shadow(
          offset: Offset(0.0, 0.0),
          blurRadius: 15.0,
          color: Color.fromARGB(98, 34, 162, 242),
        ),
      ],
    );

    labelTextStyle = TextStyle(
      fontFamily: fontNameDefault,
      fontSize: mediumTextSize,
      fontWeight: FontWeight.w800,
      color: secondaryColor,
      shadows: const <Shadow>[
        Shadow(
          offset: Offset(0.0, 0.0),
          blurRadius: 2.0,
          color: Color.fromARGB(214, 34, 162, 242),
        ),
      ],
    );

    hintTextStyle = TextStyle(
      color: nonAccentColor,
      fontFamily: fontNameTitle,
    );

    inputTextStyle = TextStyle(color: inputColor, fontFamily: fontNameDefault);

    appOutlineButtonGradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(159, 27, 142, 242),
          Color.fromARGB(151, 92, 184, 242),
        ]);

    appOutlineButtonContentStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: mediumTextSize,
        color: Colors.white);

    appBarTitleStyle = TextStyle(
        fontFamily: fontNameTitle,
        fontSize: largeTextSize,
        color: secondaryColor);

    drawerTextStyle = TextStyle(color: inputColor, fontFamily: fontNameDefault);
  }
}

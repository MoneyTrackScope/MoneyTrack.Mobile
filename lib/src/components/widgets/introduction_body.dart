import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/util/themes/base_theme.dart';

class IntroductionBody extends StatelessWidget {
  final ThemeBase theme = GetIt.I.get<ThemeBase>();
  final Widget body;

  IntroductionBody({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/animation/background_introduction.gif',
              ),
            ),
          ),
        ),
        Container(
          decoration:
              BoxDecoration(gradient: theme.introductionBackgroundGradient),
        ),
        SizedBox(
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 40.0,
              ),
              child: body,
            ))
      ]),
    );
  }
}

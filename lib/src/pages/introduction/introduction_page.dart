import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../components/widgets/app_outline_button.dart';
import '../../components/widgets/primary_button.dart';
import '../../util/themes/base_theme.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage({Key? key}) : super(key: key);
  final ThemeBase theme = GetIt.I.get<ThemeBase>();

  Widget _buildLoginBtn() {
    return PrimaryButton(
      onPressed: () {},
      text: "LOGIN",
      height: 50,
    );
  }

  Widget _buildSignUpBtn() {
    return AppOutlineButton(
      onPressed: () {},
      text: "SIGN UP",
      height: 50,
    );
  }

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
      ]),
    );
  }
}

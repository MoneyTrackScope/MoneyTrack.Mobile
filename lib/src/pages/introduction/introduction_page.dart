import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/components/widgets/introduction_body.dart';
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
      height: 40,
    );
  }

  Widget _buildSignUpBtn() {
    return AppOutlineButton(
      onPressed: () {},
      text: "SIGN UP",
      height: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionBody(
        body: Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              'assets/image/light_logo.png',
              height: 500,
              width: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: _buildLoginBtn(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: _buildSignUpBtn(),
          ),
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/components/widgets/common_body.dart';
import 'package:money_track/src/components/widgets/input_with_label.dart';
import 'package:money_track/src/components/widgets/primary_button.dart';
import 'package:money_track/src/util/constants.dart';

import '../../util/themes/base_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ThemeBase theme = GetIt.I.get<ThemeBase>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false;

  Widget _buildEmailInput() {
    return InputWithLabel(
        controller: _emailController,
        label: 'Email',
        hint: 'Enter your Email',
        inputType: TextInputType.emailAddress);
  }

  Widget _buildPasswordTF() {
    return InputWithLabel(
        controller: _passwordController,
        label: 'Password',
        hint: 'Enter your Password',
        obscureText: true);
  }

  Widget _buildRemeberAndForgetRow() {
    return SizedBox(
      height: 70.0,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            child: CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: kSecondaryColor,
              checkColor: kPrimaryColor,
              title: Text(
                "Remember me",
                style: theme.labelTextStyle,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          )),
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () => print('Forgot Password Button Pressed'),
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Text(
                    'Forgot Password?',
                    style: theme.labelTextStyle,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return PrimaryButton(
      onPressed: () {},
      text: "LOGIN",
      height: 50,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CommonBody(
            content: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 100),
            child: Text('Sign In', style: theme.titleTextStyle),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: _buildEmailInput(),
          ),
          _buildPasswordTF(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: _buildRemeberAndForgetRow(),
          ),
          _buildLoginBtn()
        ],
      ),
    )));
  }
}

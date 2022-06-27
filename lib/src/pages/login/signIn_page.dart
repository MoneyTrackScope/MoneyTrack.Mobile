// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/components/widgets/common_body.dart';
import 'package:money_track/src/components/widgets/primary_button.dart';
import 'package:money_track/src/util/constants.dart';

import '../../util/themes/base_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ThemeBase theme = GetIt.I.get<ThemeBase>();

  bool _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: theme.labelTextStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: theme.textInputDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: theme.inputTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: theme.inputColor,
              ),
              hintText: 'Enter your Email',
              hintStyle: theme.hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: theme.labelTextStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: theme.textInputDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: theme.inputTextStyle,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: theme.inputColor,
              ),
              hintText: 'Enter your Password',
              hintStyle: theme.hintTextStyle,
            ),
          ),
        ),
      ],
    );
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
            content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Sign In', style: theme.titleTextStyle),
        const SizedBox(height: 30.0),
        _buildEmailTF(),
        const SizedBox(
          height: 30.0,
        ),
        _buildPasswordTF(),
        _buildRemeberAndForgetRow(),
        const SizedBox(
          height: 30.0,
        ),
        _buildLoginBtn()
      ],
    )));
  }
}

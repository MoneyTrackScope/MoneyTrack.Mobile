// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_track/src/components/common_body.dart';
import 'package:money_track/src/components/primary_button.dart';
import 'package:money_track/src/util/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
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
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
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
              title: const Text(
                "Remember me",
                style: kLabelStyle,
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
                    style: kLabelStyle,
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
        Text('Sign In',
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 30)),
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

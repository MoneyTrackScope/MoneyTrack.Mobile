// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_track/src/components/common_body.dart';
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
    return Center(
      child: ElevatedButton(
        onPressed: () {
          print('Hi there');
        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(25.0),
              ),
            )),
        child: Container(
          //width: 200,
          height: 60,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color.fromARGB(159, 27, 142, 242),
                  Color.fromARGB(151, 92, 184, 242),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(25.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 92, 185, 242).withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ]),
          alignment: Alignment.center,
          child: Text('LOGIN',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 15,
                color: kBackgroundColor,
                shadows: <Shadow>[
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
                ],
              )),
        ),
      ),
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

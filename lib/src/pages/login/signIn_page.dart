// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: const EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return SizedBox(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(
                unselectedWidgetColor: Color.fromARGB(255, 128, 196, 238)),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Color.fromARGB(221, 6, 8, 13),
              activeColor: Color.fromARGB(255, 92, 185, 242),
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
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
      child: Center(
        child: GestureDetector(
          onTap: () {},
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

  Widget _buildSignInWithText() {
    return Column(
      children: const <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 36, 65, 91),
                      Color.fromARGB(255, 37, 66, 92),
                      Color.fromARGB(255, 27, 37, 62),
                      Color.fromARGB(255, 27, 37, 62),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 30)),
                      const SizedBox(height: 30.0),
                      _buildEmailTF(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildSignInWithText(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

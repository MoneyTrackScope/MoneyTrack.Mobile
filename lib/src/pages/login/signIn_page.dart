import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/exceptions/auth_exception.dart';
import 'package:money_track/src/main_app.dart';
import 'package:money_track/src/pages/login/signUp_page.dart';
import 'package:money_track/src/services/user_service.dart';
import 'package:money_track/src/util/constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserService _userService = GetIt.I.get<UserService>();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showErrorLoginMessage = false;
  String _errorMessage = "";

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign in")),
      body: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'MoneyTrack',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: LargeTextSize),
                      )),
                  if (_showErrorLoginMessage)
                    Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          _errorMessage,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white70),
                        )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _loginController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter user name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: const Text(
                      'Forgot Password',
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: _isLoading
                            ? const Image(
                                image: AssetImage(
                                    'assets/animation/downloading.gif'))
                            : const Text("Login"),
                        onPressed: () async {
                          var valid = _formKey.currentState!.validate();
                          if (!valid) {
                            return;
                          }
                          try {
                            setState(() {
                              _isLoading = true;
                            });

                            var user = await _userService.signIn(
                                _loginController.text,
                                _passwordController.text);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MainApp(user: user)));
                          } on AuthException {
                            setState(() {
                              _errorMessage = "WRONG EMAIL OR PASSWORD.";
                              _showErrorLoginMessage = true;
                              _isLoading = false;
                            });
                            return;
                          } on Exception {
                            setState(() {
                              _errorMessage = "Server error.";
                              _showErrorLoginMessage = true;
                              _isLoading = false;
                            });
                            return;
                          }
                        },
                      )),
                  Row(
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignUpPage()));
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ))),
    );
  }
}

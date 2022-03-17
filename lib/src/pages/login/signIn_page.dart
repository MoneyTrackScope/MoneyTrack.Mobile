import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/exceptions/auth_exception.dart';
import 'package:money_track/src/main_app.dart';
import 'package:money_track/src/models/user_model.dart';
import 'package:money_track/src/services/user_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserService _userService = GetIt.I.get<UserService>();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showErrorLoginMessage = false;
  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'MoneyTrack',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            )),
            if (_showErrorLoginMessage)
            Container(
              color: Colors.red,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                _errorMessage,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white70
                ),
              )
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _loginController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
                validator: (value) {
                  if(value!.isEmpty){
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
                  if(value!.isEmpty){
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
              child: const Text('Forgot Password',),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  var valid = _formKey.currentState!.validate();
                  if (!valid) {
                    return;
                  }
                  try{
                    var user = await _userService.signIn(_loginController.text, _passwordController.text);

                    Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder: (_) => MainApp(user: user)));
                  }
                  on AuthException {
                    setState(() {
                      _errorMessage = "WRONG EMAIL OR PASSWORD.";
                      _showErrorLoginMessage = true;
                    });
                    return;
                  }
                  on Exception {
                    setState(() {
                      _errorMessage = "Server error.";
                      _showErrorLoginMessage = true;
                    });
                    return;
                  }
                },
              )
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )
      )
    );
  }
}
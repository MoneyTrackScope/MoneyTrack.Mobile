import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/main.dart';
import 'package:money_track/src/exceptions/auth_exception.dart';
import 'package:money_track/src/models/user_model.dart';
import 'package:money_track/src/services/user_service.dart';

import '../../main_app.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final UserService _userService = GetIt.I.get<UserService>();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _showErrorLoginMessage = false;
  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign up")),
      body: Form(
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
                    fontSize: 16,
                    color: Colors.white
                  ),
                )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _loginController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please enter email";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First name',
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please enter first name";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last name',
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please enter last name";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
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
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: true,
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm password',
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please confirm password";
                    }
                    if(value != _passwordController.text){
                      return "Shoud be equal to password";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () async {
                    var valid = _formKey.currentState!.validate();
                    if (!valid) {
                      return;
                    }
                    try{
                      var user = UserModel(
                        email: _loginController.text,
                        firstName: _firstNameController.text,
                        lastName: _lastNameController.text
                      );

                      var newUser = await _userService.signUp(user, _passwordController.text);

                      Navigator.pushReplacement(context, 
                        MaterialPageRoute(builder: (_) => MainApp(user: newUser)));
                    }
                    on AuthException {
                      setState(() {
                        _errorMessage = "User with this login exist";
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
              )
            ],
          )
        )
      ),
    );
  }
}
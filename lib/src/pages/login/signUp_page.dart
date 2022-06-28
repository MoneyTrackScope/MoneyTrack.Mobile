import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/components/widgets/common_body.dart';
import 'package:money_track/src/components/widgets/input_with_label.dart';
import 'package:money_track/src/components/widgets/primary_button.dart';
import 'package:money_track/src/exceptions/auth_exception.dart';
import 'package:money_track/src/models/user_model.dart';
import 'package:money_track/src/services/user_service.dart';
import 'package:money_track/src/util/themes/base_theme.dart';

import '../../main_app.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ThemeBase theme = GetIt.I.get<ThemeBase>();

  final UserService _userService = GetIt.I.get<UserService>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _showErrorLoginMessage = false;
  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CommonBody(
      content: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 50),
                child: Text('Sign Up', style: theme.titleTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InputWithLabel(
                  controller: _emailController,
                  label: 'Email',
                  hint: 'Enter your Email',
                  inputType: TextInputType.emailAddress,
                  icon: Icons.email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InputWithLabel(
                    controller: _firstNameController,
                    label: 'Fist Name',
                    hint: 'Enter your First Name',
                    inputType: TextInputType.name,
                    icon: Icons.person),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InputWithLabel(
                    controller: _lastNameController,
                    label: 'Last Name',
                    hint: 'Enter your Last Name',
                    inputType: TextInputType.name,
                    icon: Icons.person),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InputWithLabel(
                    controller: _passwordController,
                    label: 'Password',
                    hint: 'Enter your Password',
                    obscureText: true,
                    icon: Icons.lock),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: InputWithLabel(
                    controller: _confirmPasswordController,
                    label: 'Confirm Password',
                    hint: 'Confirm your Password',
                    obscureText: true,
                    icon: Icons.lock),
              ),
              PrimaryButton(
                onPressed: () {},
                text: "SIGN UP",
                height: 50,
              )
            ],
          )),
    ));
  }
}

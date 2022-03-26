import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/pages/login/signIn_page.dart';
import 'package:money_track/src/services/user_service.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({ Key? key }) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final UserService _userService = GetIt.I.get<UserService>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              child: const Text("Sign out"),
              onPressed: () async {
                await _userService.signOut();
                
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (_) => const SignInPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
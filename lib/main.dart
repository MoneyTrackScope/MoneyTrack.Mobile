import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/pages/login/signIn_page.dart';
import 'package:money_track/src/services/account_service.dart';
import 'package:money_track/src/services/category_service.dart';
import 'package:money_track/src/services/internal/app_http_client.dart';
import 'package:money_track/src/services/internal/secure_storeage.dart';
import 'package:money_track/src/services/transaction_service.dart';
import 'package:money_track/src/services/user_service.dart';

Future main() async{
  setupDependencies();

  runApp(const App());
}

void setupDependencies(){
  GetIt.I.registerSingleton(StorageService());
  GetIt.I.registerSingleton(AppHtppClient());

  GetIt.I.registerSingleton(TransactionService());
  GetIt.I.registerSingleton(AccountService());
  GetIt.I.registerSingleton(CategoryService());
  GetIt.I.registerSingleton(UserService());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoenyTrack',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const SignInPage()
    );
  }
}
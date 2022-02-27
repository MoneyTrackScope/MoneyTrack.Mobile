import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/services/account_service.dart';
import 'package:money_track/src/services/category_service.dart';
import 'package:money_track/src/services/transaction_service.dart';

import 'src/pages/home/home_page.dart';
import 'src/pages/setting/setting_page.dart';

Future main() async{
  setupDependencies();

  runApp(const FormApp());
}

void setupDependencies(){
  GetIt.I.registerSingleton(TransactionService());
  GetIt.I.registerSingleton(AccountService());
  GetIt.I.registerSingleton(CategoryService());
}

class FormApp extends StatelessWidget {
  const FormApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Samples',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Widget app = const HomePage(restorationId: "home");
  
  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text(
        "test account",
      ),
      accountEmail: Text(
        "test email",
      ),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
      ),
    );

    final listItems = ListView(
          children: [
            drawerHeader,
            ListTile(
                title: const Text("Home"),
                leading: const Icon(Icons.home),
                onTap: () {
                  setState(() {
                    app = const HomePage(restorationId: "home");
                  });
                  Navigator.pop(context);
                }),
            ListTile(
              title: const Text("Settings"),
              leading: const Icon(Icons.settings),
              onTap: () {
                setState(() {
                  app = const SettingPage();
                });
                Navigator.pop(context);
              },
            ),
          ],
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Track'),
      ),
      drawer: Drawer(
        child: listItems
      ),
      body: app,
    );
  }
}

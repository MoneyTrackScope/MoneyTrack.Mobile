import 'package:flutter/material.dart';
import 'package:money_track/src/models/user_model.dart';
import 'pages/home/home_page.dart';

import 'pages/setting/setting_page.dart';

class MainApp extends StatefulWidget {
  final UserModel user;

  const MainApp({Key? key, required this.user}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  Widget app = const HomePage(restorationId: "home");
  
  @override
  Widget build(BuildContext context) {
    var drawerHeader = UserAccountsDrawerHeader(
      accountName: Text(
        "${widget.user.firstName} ${widget.user.lastName}"
      ),
      accountEmail: Text(
        widget.user.email
      ),
      currentAccountPicture: const CircleAvatar(
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

import 'package:flutter/material.dart';
import 'package:money_track/src/pages/home/home_page.dart';

void main() {
  runApp(const FormApp());
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
  var text = "test";
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
                  app = const App2();
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

class App1 extends StatelessWidget {
  const App1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("App1");
  }
}

class App2 extends StatelessWidget {
  const App2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("App2");
  }
}

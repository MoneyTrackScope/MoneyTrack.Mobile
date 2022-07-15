import 'package:flutter/material.dart';
import 'package:money_track/src/models/user_model.dart';
import 'package:money_track/src/pages/home/home_page.dart';
import 'package:money_track/src/pages/setting/setting_page.dart';

class NavigationDrawer extends StatefulWidget {
  final UserModel user;

  const NavigationDrawer({Key? key, required this.user}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  Widget _buildHeader() => Material(
        color: Colors.red,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: UserAccountsDrawerHeader(
              accountName:
                  Text("${widget.user.firstName} ${widget.user.lastName}"),
              accountEmail: Text(widget.user.email),
              currentAccountPicture: const CircleAvatar(
                child: FlutterLogo(size: 42.0),
              ),
            ),
          ),
        ),
      );

  Widget _buildMenuItems() => Container(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          runSpacing: 10,
          children: [
            ListTile(
                title: const Text("Home"),
                leading: const Icon(Icons.home),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                }),
            ListTile(
              title: const Text("Settings"),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const SettingPage()));
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        children: [_buildHeader(), _buildMenuItems()],
      )),
    );
  }
}

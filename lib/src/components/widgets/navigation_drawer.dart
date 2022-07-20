import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/components/widgets/common_body.dart';
import 'package:money_track/src/models/user_model.dart';
import 'package:money_track/src/pages/home/home_page.dart';
import 'package:money_track/src/pages/setting/setting_page.dart';
import 'package:money_track/src/util/themes/base_theme.dart';

class NavigationDrawer extends StatefulWidget {
  final ThemeBase theme = GetIt.I.get<ThemeBase>();

  final UserModel user;

  NavigationDrawer({Key? key, required this.user}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  Widget _buildHeader() => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.transparent),
              accountName: Text(
                "${widget.user.firstName} ${widget.user.lastName}",
                style: widget.theme.drawerTextStyle
                    .copyWith(fontSize: widget.theme.largeTextSize),
              ),
              accountEmail: Text(widget.user.email,
                  style: widget.theme.drawerTextStyle
                      .copyWith(fontSize: widget.theme.mediumLargeTextStyle)),
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
                title: Text("Home",
                    style: widget.theme.drawerTextStyle
                        .copyWith(fontSize: widget.theme.mediumLargeTextStyle)),
                leading: const Icon(Icons.home),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                }),
            ListTile(
              title: Text("Settings",
                  style: widget.theme.drawerTextStyle
                      .copyWith(fontSize: widget.theme.mediumLargeTextStyle)),
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
        child: CommonBody(
      padding: const EdgeInsets.all(5),
      content: SingleChildScrollView(
          child: Column(
        children: [_buildHeader(), _buildMenuItems()],
      )),
    ));
  }
}

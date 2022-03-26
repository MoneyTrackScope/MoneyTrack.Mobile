import 'package:flutter/material.dart';
import 'package:money_track/src/pages/setting/user/account_page.dart';
import 'package:settings_ui/settings_ui.dart';

import 'manage/manage_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({ Key? key }) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("Managing"),
            tiles: [
              SettingsTile(
                title: const Text("Manage categories & accounts"),
                leading: const Icon(Icons.category),
                onPressed: (BuildContext context) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (_) => const ManagePage())
                  );
                },
              ),
              SettingsTile(
                title: const Text("Integrated banks"),
                leading: const Icon(Icons.account_balance),
                onPressed: (BuildContext context) {
                  // to categories and accounts page
                },
              )
            ],
          ),
          SettingsSection(
            title: const Text("User"),
            tiles: [
              SettingsTile(
                title: const Text("Account"),
                leading: const Icon(Icons.person),
                onPressed: (BuildContext context) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (_) => const AccountPage())
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:money_track/src/pages/setting/manage/categories_list.dart';

import 'accounts_list.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({ Key? key }) : super(key: key);

  @override
  _ManagePageState createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(child: Text("Categories")),
              Tab(child: Text("Accounts")),
            ],
          ),
          title: const Text("Managing"),
        ),
        body: const TabBarView(
          children: [
            CategoriesList(),
            AccountsList()
          ],
        ),
      ),
    );
  }
}
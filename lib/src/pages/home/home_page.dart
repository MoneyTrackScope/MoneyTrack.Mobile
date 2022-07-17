import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/main.dart';
import 'package:money_track/src/components/widgets/navigation_drawer.dart';
import 'package:money_track/src/models/user_model.dart';
import 'package:money_track/src/pages/home/add_transaction_page.dart';
import 'package:money_track/src/pages/home/info_page.dart';
import 'package:money_track/src/pages/home/transaction_list_page.dart';
import 'package:money_track/src/util/themes/base_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final String restorationId = "bottom_navigation_tab_index";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RestorationMixin {
  final ThemeBase theme = GetIt.I.get<ThemeBase>();

  final RestorableInt _currentIndex = RestorableInt(0);

  final _pages = <Widget>[
    const InfoPage(),
    const TransactionListPage(),
  ];
  final _titles = ["Home", "Transactions"];

  @override
  String get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, restorationId);
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  Widget _buildNavigationBar() {
    return Container(
      decoration: BoxDecoration(color: theme.lastBackgroundGradientColor),
      child: BottomAppBar(
          color: theme.primaryColor,
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          child: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    setState(() {
                      _currentIndex.value = 0;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.list_alt),
                  onPressed: () {
                    setState(() {
                      _currentIndex.value = 1;
                    });
                  },
                ),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _titles[_currentIndex.value],
          style: theme.appBarTitleStyle,
        ),
        backgroundColor: theme.primaryColor,
      ),
      drawer: NavigationDrawer(user: UserModel()),
      body: _pages[_currentIndex.value],
      bottomNavigationBar: _buildNavigationBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.secondaryColor,
        onPressed: () {
          //code to execute on button press
        },
        child: const Icon(Icons.add), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

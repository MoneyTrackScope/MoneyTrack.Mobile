import 'package:flutter/material.dart';
import 'package:money_track/main.dart';
import 'package:money_track/src/components/widgets/navigation_drawer.dart';
import 'package:money_track/src/models/user_model.dart';
import 'package:money_track/src/pages/home/add_transaction_page.dart';
import 'package:money_track/src/pages/home/transaction_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final String restorationId = "";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);

  final _pages = <Widget>[
    const AddTransactionPage(),
    const TransactionListPage(),
    const Center(
      child: Text("Analytics"),
    )
  ];

  @override
  String get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.note_add),
        label: "Add Transaction",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: "Transactions List",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.analytics),
        label: "Analytics",
      )
    ];

    return Scaffold(
      appBar: AppBar(),
      drawer: NavigationDrawer(user: UserModel()),
      body: _pages[_currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          });
        },
      ),
    );
  }
}

class _NavigationDestinationView extends StatelessWidget {
  const _NavigationDestinationView({Key? key, required this.item})
      : super(key: key);

  final BottomNavigationBarItem item;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Text(item.label.toString()),
      )
    ]);
  }
}

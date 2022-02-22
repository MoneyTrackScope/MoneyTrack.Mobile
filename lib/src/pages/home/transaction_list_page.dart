import 'dart:developer';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:money_track/src/components/add_transaction_form.dart';
import 'package:money_track/src/components/transaction_group_separator.dart';
import 'package:money_track/src/models/account_model.dart';
import 'package:money_track/src/models/category_model.dart';
import 'package:money_track/src/models/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionListPage extends StatefulWidget {
  const TransactionListPage({ Key? key }) : super(key: key);

  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  final _formKey = GlobalKey<AddTransactionFormState>();

  ScrollController _controller = ScrollController();

  List<TransactionModel> _transactionList = [];


  //test
  Iterable<int> countDownFromSync(int num1, int num2) sync* {
    int counter = num1;
    while (counter <= num2) {
      yield counter++;
    }
  }

  int _currnetCount = 20;

  _TransactionListPageState(){
    _transactionList = countDownFromSync(1, _currnetCount).map((e) => TransactionModel(
        addeDttm: DateTime.now().add(Duration(days: -e)), 
        description: "Description" + e.toString(), 
        quantity: Decimal.parse(e.toString()),
        category:  CategoryModel(id: e, name: "Cat" + e.toString(), isSystem: false), 
        account: AccountModel(id: e, name: "Acc" + e.toString(), balance: Decimal.zero))
      ).toList();
  }
  
  @override
  void initState(){
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GroupedListView<TransactionModel, DateTime>(
        elements: _transactionList,
        controller: _controller,
        groupBy: (transaction){
          // Take only date, without time
          final DateFormat formatter = DateFormat('yyyy-MM-dd');
          final forrmated = formatter.format(transaction.addeDttm);
          
          return DateTime.parse(forrmated);
        },
        groupSeparatorBuilder: (DateTime date) => TransactionGroupSeparator(date),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: true,
        itemBuilder: (context, transaction) => GestureDetector(
          onTap: () => {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context){
                return Container(
                  margin: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        AddTransactionForm(key: _formKey, model: transaction),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              child: const Text("Update"),
                              onPressed: () => {
                                // Update
                              },
                            ),
                            TextButton(
                              child: const Text("Delete"),
                              onPressed: () => {
                                // Delete
                              },
                            ),
                            OutlinedButton(
                              child: const Text("Cancel"),
                              onPressed: () => {
                                Navigator.pop(context)
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              isScrollControlled:true
            )
          },
          child: Card (
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 3, top: 3),
            elevation: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon (
                      Icons.send,
                      size: 15
                  ),
                  title: Text(
                    transaction.category?.name ?? "Oher",
                    style: const TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    transaction.account?.name ?? "Undefined",
                    style: const TextStyle(fontSize: 15),
                  ),
                  trailing: Text(
                    transaction.quantity.toString(),
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.w800,
                      color: transaction.quantity > Decimal.zero ? Colors.green : Colors.black),
                  ),
                ),
                ListTile(
                  title: Text(
                    transaction.description.length > 100
                    ? transaction.description.substring(0, 100) + "..."
                    : transaction.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      DateFormat('Hms').format(transaction.addeDttm),
                      style: const TextStyle(fontSize: 14),
                    ),
                  )
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  void _scrollListener() {
    if (_controller.position.extentAfter < 500) {
      setState(() {
        var newCount = _currnetCount + 10;

          _transactionList.addAll(countDownFromSync(_currnetCount + 1, newCount).map((e) => TransactionModel(
          addeDttm: DateTime.now().add(Duration(days: -e)), 
          description: "Description" + e.toString(), 
          quantity: Decimal.parse(e.toString()),
          category:  CategoryModel(id: e, name: "Cat" + e.toString(), isSystem: false), 
          account: AccountModel(id: e, name: "Acc" + e.toString(), balance: Decimal.zero))
      ).toList());

      _currnetCount = newCount;
      });
    }
  }
}
import 'dart:developer';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:money_track/src/components/add_transaction_form.dart';
import 'package:money_track/src/components/transaction_group_separator.dart';
import 'package:money_track/src/models/account_model.dart';
import 'package:money_track/src/models/category_model.dart';
import 'package:money_track/src/models/operationals/paging.dart';
import 'package:money_track/src/models/transaction_model.dart';
import 'package:intl/intl.dart';
import 'package:money_track/src/services/transaction_service.dart';

class TransactionListPage extends StatefulWidget {
  const TransactionListPage({ Key? key }) : super(key: key);

  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  final _formKey = GlobalKey<AddTransactionFormState>();

  final TransactionService _transactionService;

  ScrollController _controller = ScrollController();

  final List<TransactionModel> _transactionList = [];

  final int _pageSize = 20;
  int _currentPage = 1;

  _TransactionListPageState()
  : _transactionService = GetIt.I.get<TransactionService>();
  
  @override
  void initState(){
    super.initState();
    _controller = ScrollController()..addListener(_scrollListener);

    Future.delayed(Duration.zero, () async {
      var transactionList = await _transactionService.getLast(Paging(currentPage: _currentPage, pageSize: _pageSize));

      setState(() {
        _transactionList.addAll(transactionList);
      });
    });
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
                              onPressed: () async {
                                var transaction = _formKey.currentState?.getTransaction();

                                if(transaction != null){
                                  await _transactionService.update(transaction);
                                }
                              },
                            ),
                            TextButton(
                              child: const Text("Delete"),
                              onPressed: () async {
                                await _transactionService.delete(transaction.id);
                              },
                            ),
                            OutlinedButton(
                              child: const Text("Cancel"),
                              onPressed: () {
                                Navigator.pop(context);
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

  double prevExtentAfter = 0;

  void _scrollListener() {
    if ((_controller.position.extentAfter < 500 && _controller.position.extentAfter >= prevExtentAfter) 
    || _controller.position.extentAfter < 300) {
      prevExtentAfter = _controller.position.extentAfter;

      var newPage = _currentPage + 1;
      var newItems = _transactionService.getLast(Paging(currentPage: newPage, pageSize: _pageSize));
      
      newItems.then((data){
          setState(() {
            _currentPage = newPage;
            _transactionList.addAll(data);
        });
      });
    }
  }
}
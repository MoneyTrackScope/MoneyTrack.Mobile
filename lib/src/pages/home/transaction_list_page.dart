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


  var _transactionList = <TransactionModel>[
    TransactionModel(addeDttm: DateTime(2022, 1, 5, 1, 2, 3), description: "Part 1jbdfhkaegfhjg aeygf weyugj jkfgv sdf g sgfh jse gdaghgdfj hgs gs gsjdghsdlkj gheslkjgh sldfkghPart 1jbdfhkaegfhjg aeygf weyugj jkfgv sdf g sgfh jse gdaghgdfj hgs gs gsjdghsdlkj gheslkjgh sldfkgh", quantity: Decimal.parse("12"),
    category:  CategoryModel(id: 1, name: "Cat2", isSystem: false), account: AccountModel(id: 1, name: "Acc2", balance: Decimal.zero)),
    TransactionModel(addeDttm: DateTime(2022, 1, 5, 1, 4, 3), description: "Part 1", quantity: Decimal.parse("12")),

    TransactionModel(addeDttm: DateTime(2022, 1, 5, 1, 45, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 5, 1, 23, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 4, 1, 4, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 4, 1, 54, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 4, 1, 23, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 4, 3, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),

    TransactionModel(addeDttm: DateTime(2022, 1, 2, 5, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 2, 23, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 2, 22, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 2, 15, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),

    TransactionModel(addeDttm: DateTime(2022, 1, 3, 5, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 3, 23, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 3, 43, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 3, 30, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
  ];
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GroupedListView<TransactionModel, DateTime>(
        elements: _transactionList,
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
                  child: Column(
                    children: <Widget>[
                      AddTransactionForm(key: _formKey, model: transaction)
                    ],
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
                    transaction.description,
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
}
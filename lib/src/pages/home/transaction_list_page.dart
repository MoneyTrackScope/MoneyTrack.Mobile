import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:money_track/src/components/transaction_group_separator.dart';
import 'package:money_track/src/models/transaction_model.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:intl/intl.dart';

class TransactionListPage extends StatefulWidget {
  const TransactionListPage({ Key? key }) : super(key: key);

  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {

  var _transactionList = <TransactionModel>[
    TransactionModel(addeDttm: DateTime(2022, 1, 5, 1, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 5, 1, 4, 3), description: "Part 1", quantity: Decimal.parse("12")),

    TransactionModel(addeDttm: DateTime(2022, 1, 5, 1, 45, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 5, 1, 23, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 4, 1, 4, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 4, 1, 54, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 4, 1, 23, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 4, 3, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),

        TransactionModel(addeDttm: DateTime(2022, 1, 2, 5, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 2, 23, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 2, 43, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 2, 30, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),

    TransactionModel(addeDttm: DateTime(2022, 1, 3, 5, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 3, 23, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 3, 43, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
    TransactionModel(addeDttm: DateTime(2022, 1, 3, 30, 2, 3), description: "Part 1", quantity: Decimal.parse("12")),
  ];
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: StickyGroupedListView<TransactionModel, DateTime>(
        elements: _transactionList,
        groupBy: (transaction){
          // Take only date, without time
          final DateFormat formatter = DateFormat('yyyy-MM-dd');
          final forrmated = formatter.format(transaction.addeDttm);
          
          return DateTime.parse(forrmated);
        },
        groupSeparatorBuilder: (TransactionModel model) => TransactionGroupSeparator(model.addeDttm),
        order: StickyGroupedListOrder.DESC,
        itemBuilder: (context, transaction) => Card(
          child: ListTile(
            title: Text(transaction.description),
            trailing: Text(
              "${transaction.quantity.toString()} ${DateFormat("HH:mm").format(transaction.addeDttm)}",  
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
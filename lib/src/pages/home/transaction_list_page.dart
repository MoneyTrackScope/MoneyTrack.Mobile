import 'package:flutter/material.dart';

class TransactionListPage extends StatefulWidget {
  const TransactionListPage({ Key? key }) : super(key: key);

  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("TransactionListPage"),
    );
  }
}
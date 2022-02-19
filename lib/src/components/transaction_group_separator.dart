import 'package:flutter/material.dart';

class TransactionGroupSeparator extends StatelessWidget {
  final DateTime date;
  const TransactionGroupSeparator(this.date, { Key? key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: Text(
          "${this.date.day}/${this.date.month}/${this.date.year}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
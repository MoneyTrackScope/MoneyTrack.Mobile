import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionGroupSeparator extends StatelessWidget {
  final DateTime date;
  const TransactionGroupSeparator(this.date, { Key? key }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Text(
        buildDate(date),
        style: const TextStyle(fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }

  String buildDate(DateTime date){
    var year = DateFormat('y').format(date);
    var month = DateFormat('MMMM').format(date);
    var dayOfWeek = DateFormat('EEEE').format(date);
    var day = DateFormat('d').format(date);

    return "$dayOfWeek, the ${day}th of $month $year";
  }
}
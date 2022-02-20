import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:money_track/src/components/add_transaction_form.dart';
import 'package:money_track/src/models/transaction_model.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<AddTransactionFormState>();

  final _model = TransactionModel(quantity: Decimal.zero, addeDttm: TransactionModel.cutOffDate);

  _AddTransactionPageState();

  @override
  Widget build(BuildContext context) {
    var transactionAddForm = AddTransactionForm(key: _formKey, model: _model);

    return Scaffold(
      body: transactionAddForm,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var transaction = _formKey.currentState?.getTransaction();

          if(transaction != null){
            // add transaction
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

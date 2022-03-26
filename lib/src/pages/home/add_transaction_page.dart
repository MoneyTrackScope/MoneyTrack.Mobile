import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/components/add_transaction_form.dart';
import 'package:money_track/src/models/transaction_model.dart';
import 'package:money_track/src/services/transaction_service.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<AddTransactionFormState>();

  final _model = TransactionModel(quantity: Decimal.zero, addedDttm: TransactionModel.cutOffDate);
  final TransactionService _transactionService = GetIt.I.get<TransactionService>();

  _AddTransactionPageState();

  @override
  Widget build(BuildContext context) {
    var transactionAddForm = AddTransactionForm(key: _formKey, model: _model);

    return Scaffold(
      body: transactionAddForm,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var transaction = _formKey.currentState?.getTransaction();

          if(transaction != null){
            await _transactionService.add(transaction);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

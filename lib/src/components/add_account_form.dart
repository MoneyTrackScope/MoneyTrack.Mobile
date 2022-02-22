import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:money_track/src/models/account_model.dart';

class AddAccountForm extends StatefulWidget {
  AccountModel model;

  AddAccountForm({ Key? key, required this.model }) : super(key: key);

  @override
  AddAccountFormState createState() => AddAccountFormState(model);
}

class AddAccountFormState extends State<AddAccountForm> {
  final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AccountModel _model;

  final TextEditingController _nameController;
  final TextEditingController _balanceController;

    AddAccountFormState(this._model)
    : _nameController = TextEditingController(text: _model.name)
    , _balanceController = TextEditingController(text: _model.balance !=  Decimal.zero ? _model.balance.toString() : "");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _nameController,
                decoration: const InputDecoration(
                    filled: false,
                    hintText: "e.g. cash, card",
                    labelText: "Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the name";
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: _balanceController,
                decoration: const InputDecoration(
                  filled: false,
                  hintText: "e.g. 100",
                  labelText: "Balance",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the balance";
                  }
                  if (Decimal.tryParse(value) == null) {
                    return "Incorrect number";
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
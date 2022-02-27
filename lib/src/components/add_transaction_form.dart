import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/models/account_model.dart';
import 'package:money_track/src/models/category_model.dart';
import 'package:money_track/src/models/transaction_model.dart';
import 'package:intl/intl.dart';
import 'package:money_track/src/services/account_service.dart';
import 'package:money_track/src/services/category_service.dart';

class AddTransactionForm extends StatefulWidget {

  TransactionModel model;

  AddTransactionForm({ Key? key, required this.model}) : super(key: key);

  @override
  AddTransactionFormState createState() => AddTransactionFormState(model);
}

class AddTransactionFormState extends State<AddTransactionForm> {
  final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _quantityController;
  final TextEditingController _descriptionController;

  final AccountService _accountService;
  final CategoryService _categoryService;

  final TransactionModel _model;

  List<DropdownMenuItem<CategoryModel>> _categories = [];
  List<DropdownMenuItem<AccountModel>>_accounts = [];

  AddTransactionFormState(this._model)
    : _quantityController = TextEditingController(text: _model.quantity !=  Decimal.zero ? _model.quantity.toString() : "")
    , _descriptionController = TextEditingController(text: _model.description)
    , _accountService = GetIt.I.get<AccountService>()
    , _categoryService = GetIt.I.get<CategoryService>();

  @override
  void initState(){
    super.initState();

    _accountService.getAll()
      .then((value){
        setState(() {
          _accounts = value
            .map((c) => DropdownMenuItem(child: Text(c.name), value: c))
            .toList();
        }
      );
    });
    _categoryService.getAll()
      .then((value){
        setState(() {
          _categories = value
            .map((c) => DropdownMenuItem(child: Text(c.name), value: c))
            .toList();
        }
      );
    });
  }  

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
                keyboardType: TextInputType.number,
                controller: _quantityController,
                decoration: const InputDecoration(
                  filled: false,
                  hintText: "e.g. 100",
                  labelText: "How much",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the quantity";
                  }
                  if (Decimal.tryParse(value) == null) {
                    return "Incorrect number";
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _descriptionController,
                decoration: const InputDecoration(
                    filled: false,
                    hintText: "e.g. products, car",
                    labelText: "Description"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the description";
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<CategoryModel>(
                decoration: const InputDecoration(
                    filled: false, labelText: "Category"),
                items: _categories,
                value: _model.category,
                onChanged: (value) {
                  setState(() {
                    _model.category = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Please choose category";
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<AccountModel>(
                decoration: const InputDecoration(
                    filled: false, labelText: "Account"),
                items: _accounts,
                value: _model.account,
                onChanged: (value) {
                  setState(() {
                    _model.account = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Please choose account";
                  }
                  return null;
                },
              ),
              CheckboxListTile(
                title: const Text("Is postponed"),
                value: _model.isPostponed,
                onChanged: (value) {
                  setState(() {
                    _model.isPostponed = value as bool;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text("Set current date time"),
                value: _model.setCurrentDatetime,
                onChanged: (value) {
                  setState(() {
                    _model.setCurrentDatetime = value as bool;
                  });
                },
              ),
              if (!_model.setCurrentDatetime)
                DateTimeField(
                  format: DateFormat("yyyy-MM-dd HH:mm"),
                  decoration: const InputDecoration(
                    labelText: "Added Date Time",
                  ),
                  onChanged: (value) {
                    _model.addeDttm = value ?? TransactionModel.cutOffDate;
                  },
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: TransactionModel.cutOffDate,
                        lastDate: DateTime.now());
                    if (date != null) {
                      final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()));

                      if (time == null) {
                        return currentValue;
                      }

                      return DateTimeField.combine(date, time);
                    }
                    return currentValue;
                  },
                  validator: (value) {
                    if (_model.setCurrentDatetime) {
                      return null;
                    }

                    if (value == null) {
                      return "Please enter the added date";
                    }

                    if (value.isBefore(TransactionModel.cutOffDate) ||
                        value.isAfter(DateTime.now())) {
                      return "Please enter correct date time";
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  TransactionModel? getTransaction(){
    var valid = _formKey.currentState!.validate();
      if (!valid) {
        return null;
      }
    
    _model.description = _descriptionController.text;
    _model.quantity = Decimal.parse(_quantityController.text);

    return _model;
  }
}
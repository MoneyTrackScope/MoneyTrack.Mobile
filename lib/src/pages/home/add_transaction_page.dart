import 'package:decimal/decimal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:money_track/src/models/account_model.dart';
import 'package:money_track/src/models/category_model.dart';
import 'package:money_track/src/models/transaction_model.dart';
import 'package:intl/intl.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();

  final _quantityController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _model = TransactionModel(quantity: Decimal.zero, addeDttm: TransactionModel.cutOffDate);

  List<CategoryModel>? _categories;
  List<AccountModel>? _accounts;

  _AddTransactionPageState() {
    _categories = <CategoryModel>[
      CategoryModel(id: 0, name: "Cat1", isSystem: false),
      CategoryModel(id: 1, name: "Cat2", isSystem: false)
    ];

    _accounts = <AccountModel>[
    AccountModel(id: 0, name: "Acc1", balance: Decimal.zero),
    AccountModel(id: 1, name: "Acc2", balance: Decimal.zero)
  ];
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<CategoryModel>> categoryMenuItems = _categories!
        .map((c) => DropdownMenuItem(child: Text(c.name), value: c))
        .toList();

    List<DropdownMenuItem<AccountModel>> accountMenuItems = _accounts!
        .map((c) => DropdownMenuItem(child: Text(c.name), value: c))
        .toList();

    return Scaffold(
      body: Form(
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
                  items: categoryMenuItems,
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
                  items: accountMenuItems,
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var valid = _formKey.currentState!.validate();
          if (!valid) {
            return;
          }
          _model.description = _descriptionController.text;
          _model.quantity = Decimal.parse(_quantityController.text);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

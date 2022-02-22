import 'package:flutter/material.dart';
import 'package:money_track/src/models/category_model.dart';

class AddCategoryForm extends StatefulWidget {

  CategoryModel model;

  AddCategoryForm({ Key? key, required this.model }) : super(key: key);

  @override
  AddCategoryFormState createState() => AddCategoryFormState(model);
}

class AddCategoryFormState extends State<AddCategoryForm> {
  final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController;

  final CategoryModel _model;

  AddCategoryFormState(this._model)
    : _nameController = TextEditingController(text: _model.name);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children:[
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _nameController,
                decoration: const InputDecoration(
                  filled: false,
                  hintText: "e.g. products, car",
                  labelText: "Name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter the name";
                  }
                  return null;
                },
              ),
            ]
          )
        )
      )
    );
  }

  CategoryModel? getCategory(){
    var valid = _formKey.currentState!.validate();
      if (!valid) {
        return null;
      }
    
    _model.name = _nameController.text;

    return _model;
  }
}
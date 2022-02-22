import 'package:flutter/material.dart';
import 'package:money_track/src/components/add_category_form.dart';
import 'package:money_track/src/models/category_model.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({ Key? key }) : super(key: key);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final _formKey = GlobalKey<AddCategoryFormState>();

  late final List<CategoryModel> _categories;

  //test
  Iterable<int> countDownFromSync(int num1, int num2) sync* {
    int counter = num1;
    while (counter <= num2) {
      yield counter++;
    }
  }

  _CategoriesListState(){
    _categories = countDownFromSync(1, 5).map((e) => CategoryModel(
        name: "name"+e.toString())
      ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: ListTile(
              title: Text(
                _categories[index].name.length > 100
                ? _categories[index].name.substring(0, 100) + "..."
                : _categories[index].name,
              ),
            ),
            onTap: () => {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context){
                  return Container(
                    margin: const EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          AddCategoryForm(key: _formKey, model:  _categories[index]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ElevatedButton(
                              child: const Text("Update"),
                              onPressed: () => {
                                // Update
                                },
                              ),
                              TextButton(
                                child: const Text("Delete"),
                                onPressed: () => {
                                  // Delete
                                },
                              ),
                              OutlinedButton(
                                child: const Text("Cancel"),
                                onPressed: () => {
                                  Navigator.pop(context)
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                isScrollControlled:true
              )
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var category = CategoryModel();

          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context){
              return Container(
                margin: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      AddCategoryForm(key: _formKey, model: category),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text("Add"),
                            onPressed: () => {
                              // Add
                            },
                          ),
                          OutlinedButton(
                            child: const Text("Cancel"),
                            onPressed: () => {
                              Navigator.pop(context)
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            isScrollControlled:true
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
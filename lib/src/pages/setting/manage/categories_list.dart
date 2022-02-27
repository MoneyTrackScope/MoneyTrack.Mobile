import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/components/add_category_form.dart';
import 'package:money_track/src/models/category_model.dart';
import 'package:money_track/src/services/category_service.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({ Key? key }) : super(key: key);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final _formKey = GlobalKey<AddCategoryFormState>();

  final CategoryService _categoryService;

  late final List<CategoryModel> _categories;

  _CategoriesListState()
  : _categoryService = GetIt.I.get<CategoryService>();


  @override
  void initState(){
    super.initState();

    Future.delayed(Duration.zero, () async {
      var categoryList = await _categoryService.getAll();

      setState(() {
        _categories = categoryList;
      });
    });
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
                              onPressed: () async {
                                  var category = _formKey.currentState?.getCategory();

                                  if(category != null){
                                    await _categoryService.update(category);
                                  }
                                },
                              ),
                              TextButton(
                                child: const Text("Delete"),
                                onPressed: () async {
                                  await _categoryService.delete(_categories[index].id);
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
                            onPressed: () async {
                              var category = _formKey.currentState?.getCategory();

                              if(category != null){
                                await _categoryService.add(category);
                              }
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
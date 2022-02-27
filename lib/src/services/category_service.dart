import 'package:money_track/src/models/category_model.dart';

class CategoryService{
  Future add(CategoryModel model) async {

  }

  Future update(CategoryModel model) async {

  }

  Future delete(int id) async {

  }

  Future<List<CategoryModel>> getAll(){
    return Future(() => <CategoryModel>[
      CategoryModel(id: 0, name: "Cat1", isSystem: false),
      CategoryModel(id: 1, name: "Cat2", isSystem: false)
    ]);
  }
}
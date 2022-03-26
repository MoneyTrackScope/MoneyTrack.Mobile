import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable{
  int id;
  String name;
  bool isSystem;

  CategoryModel({
    this.id = 0,
    this.name = '',
    this.isSystem = false
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    name = json["name"],
    isSystem = json["isSystem"];

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : name,
    "isSystem": isSystem
  };

  @override
  List<Object> get props => [id];
}
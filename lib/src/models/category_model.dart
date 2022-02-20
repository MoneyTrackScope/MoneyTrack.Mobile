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

  @override
  List<Object> get props => [id];
}
import 'package:decimal/decimal.dart';
import 'account_model.dart';
import 'category_model.dart';

class TransactionModel {
  static DateTime cutOffDate = DateTime(1970);

  int id;
  Decimal quantity;
  String description;
  CategoryModel? category;
  AccountModel? account;
  DateTime addedDttm;
  bool isPostponed;
  bool setCurrentDatetime;

  TransactionModel(
      {this.id = 0,
      required this.quantity,
      this.description = "",
      this.category,
      this.account,
      required this.addedDttm,
      this.isPostponed = false,
      this.setCurrentDatetime = true});

  TransactionModel.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    quantity = Decimal.fromJson(json["quantity"].toString()),
    description = json["description"],
    category = CategoryModel.fromJson(json["category"]),
    account = AccountModel.fromJson(json["account"]),
    addedDttm = DateTime.parse(json["addedDttm"].toString()),
    isPostponed = json["isPostponed"],
    setCurrentDatetime = json["setCurrentDttm"];

    Map<String, dynamic> toJson() => {
    "id" : id,
    "quantity" : quantity,
    "description": description,
    "category" : category?.toJson(),
    "account":  account?.toJson(),
    "addedDttm" : addedDttm.toIso8601String(),
    "isPostponed" : isPostponed,
    "setCurrentDttm" : setCurrentDatetime
  };
}

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
  DateTime addeDttm;
  bool isPostponed;
  bool setCurrentDatetime;

  TransactionModel(
      {this.id = 0,
      required this.quantity,
      this.description = "",
      this.category,
      this.account,
      required this.addeDttm,
      this.isPostponed = false,
      this.setCurrentDatetime = true});
}

import 'package:decimal/decimal.dart';
import 'account_model.dart';
import 'category_model.dart';

class TransactionModel {
  static DateTime CutOffDate = DateTime(1970);

  int id;
  Decimal? quantity;
  String description;
  CategoryModel? category;
  AccountModel? account;
  DateTime? addeDttm;
  bool isPostponed;
  bool setCurrentDatetime;

  TransactionModel(
      {this.id = 0,
      this.quantity = null,
      this.description = "",
      this.category = null,
      this.account = null,
      this.addeDttm = null,
      this.isPostponed = false,
      this.setCurrentDatetime = true});
}

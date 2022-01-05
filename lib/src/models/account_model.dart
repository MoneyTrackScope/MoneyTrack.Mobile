import 'package:decimal/decimal.dart';

class AccountModel{
  int id;
  String name;
  Decimal? balance;

  AccountModel({
    this.id = 0,
    this.name = '',
    this.balance = null
  });
}
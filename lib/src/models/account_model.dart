import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class AccountModel extends Equatable{
  int id;
  String name;
  Decimal balance;

  AccountModel({
    this.id = 0,
    this.name = '',
    required this.balance
  });

  AccountModel.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    name = json["name"],
    balance = Decimal.fromJson(json["balance"].toString());

  Map<String, dynamic> toJson() => {
    "id" : id,
    "name" : name,
    "balance" : balance.toJson()
  };

  @override
  List<Object> get props => [id];
}
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

  @override
  List<Object> get props => [id];
}
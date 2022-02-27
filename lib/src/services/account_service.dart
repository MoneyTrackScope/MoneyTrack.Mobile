import 'package:decimal/decimal.dart';
import 'package:money_track/src/models/account_model.dart';

class AccountService{
  Future add(AccountModel model) async {

  }

  Future update(AccountModel model) async{

  }

  Future delete(int id) async {

  }

  Future<List<AccountModel>> getAll(){
    return Future(() => <AccountModel>[
      AccountModel(id: 0, name: "Acc1", balance: Decimal.zero),
      AccountModel(id: 1, name: "Acc2", balance: Decimal.zero)
    ].toList());
  }
}
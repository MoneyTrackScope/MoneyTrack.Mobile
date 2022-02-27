import 'package:decimal/decimal.dart';
import 'package:money_track/src/models/account_model.dart';
import 'package:money_track/src/models/category_model.dart';
import 'package:money_track/src/models/operationals/paging.dart';
import 'package:money_track/src/models/transaction_model.dart';

class TransactionService{
  Future add(TransactionModel model) async{
    //add to server
  }


  //test
  Iterable<int> countDownFromSync(int num1, int num2) sync* {
    int counter = num1;
    while (counter <= num2) {
      yield counter++;
    }
  }
  Future<List<TransactionModel>> getLast(Paging paging) async{

    return  countDownFromSync((paging.currentPage - 1)*paging.pageSize + 1, paging.currentPage*paging.pageSize).map((e) => TransactionModel(
        addeDttm: DateTime.now().add(Duration(days: -e)), 
        description: "Description" + e.toString(), 
        quantity: Decimal.parse(e.toString()),
        category:  CategoryModel(id: e, name: "Cat" + e.toString(), isSystem: false), 
        account: AccountModel(id: e, name: "Acc" + e.toString(), balance: Decimal.zero))
      ).toList();
  }

  Future update(TransactionModel model) async{

  }

  Future delete(int id) async{
    
  }
}
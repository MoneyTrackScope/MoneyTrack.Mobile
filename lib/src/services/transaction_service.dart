import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/models/operationals/paging.dart';
import 'package:money_track/src/models/transaction_model.dart';
import 'package:money_track/src/services/internal/app_http_client.dart';
import 'package:money_track/src/settings/api_settings.dart';

class TransactionService{
  static const String _controllerUrl = "api/Transaction";
  final AppHtppClient _httpClient = GetIt.I.get<AppHtppClient>();

  Future add(TransactionModel model) async{
    final response = await _httpClient
      .post("${ApiSettings.baseApiUrl}/$_controllerUrl/add",
      body: model.toJson());

    if (response == null){
      throw Exception("Error during adding");
    }
  }

  Future<List<TransactionModel>> getLast(Paging paging) async{
    final response = await _httpClient
      .get("${ApiSettings.baseApiUrl}/$_controllerUrl/getLast?currentPage=${paging.currentPage}&pageSize=${paging.pageSize}");

    if (response != null){
      var responseBody = jsonDecode(response);

      if (responseBody.length == 0){
        return <TransactionModel>[];
      }
      
      var result = responseBody.map((x) => TransactionModel.fromJson(x)).toList();
      return List<TransactionModel>.from(result);
    }

    throw Exception("Error");
  }

  Future update(TransactionModel model) async{
    final response = await _httpClient
      .put("${ApiSettings.baseApiUrl}/$_controllerUrl/update",
      body: model.toJson());

    if (response == null){
      throw Exception("Error during adding");
    }
  }

  Future delete(int id) async{
    final response = await _httpClient
      .delete("${ApiSettings.baseApiUrl}/$_controllerUrl/delete?id=$id");

    if (response == null){
      throw Exception("Error during adding");
    }
  }
}
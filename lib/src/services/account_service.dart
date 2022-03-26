import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/models/account_model.dart';
import 'package:money_track/src/services/internal/app_http_client.dart';
import 'package:money_track/src/settings/api_settings.dart';

class AccountService{
  static const String _controllerUrl = "api/Account";
  final AppHtppClient _httpClient = GetIt.I.get<AppHtppClient>();

  Future add(AccountModel model) async {
    final response = await _httpClient
      .post("${ApiSettings.baseApiUrl}/$_controllerUrl/add",
      body: model.toJson());

    if (response == null){
      throw Exception("Error during adding");
    }
  }

  Future update(AccountModel model) async{
    final response = await _httpClient
      .put("${ApiSettings.baseApiUrl}/$_controllerUrl/update",
      body: model.toJson());

    if (response == null){
      throw Exception("Error during adding");
    }
  }

  Future delete(int id) async {

  }

  Future<List<AccountModel>> getAll() async {
    final response = await _httpClient
      .get("${ApiSettings.baseApiUrl}/$_controllerUrl/getAll");

    if (response != null){
      var responseBody = jsonDecode(response);

      if (responseBody.length == 0){
        return <AccountModel>[];
      }
      
      var result = responseBody.map((x) => AccountModel.fromJson(x)).toList();
      return List<AccountModel>.from(result);
    }

    throw Exception("Error");
  }
}
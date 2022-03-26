import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:money_track/src/models/category_model.dart';
import 'package:money_track/src/services/internal/app_http_client.dart';
import 'package:money_track/src/settings/api_settings.dart';

class CategoryService{
  static const String _controllerUrl = "api/Category";
  final AppHtppClient _httpClient = GetIt.I.get<AppHtppClient>();

  Future add(CategoryModel model) async {
    final response = await _httpClient
      .post("${ApiSettings.baseApiUrl}/$_controllerUrl/add",
      body: model.toJson());

    if (response == null){
      throw Exception("Error during adding");
    }
  }

  Future update(CategoryModel model) async {
    final response = await _httpClient
      .put("${ApiSettings.baseApiUrl}/$_controllerUrl/update",
      body: model.toJson());

    if (response == null){
      throw Exception("Error during adding");
    }
  }

  Future delete(int id) async {

  }

  Future<List<CategoryModel>> getAll() async {
    final response = await _httpClient
      .get("${ApiSettings.baseApiUrl}/$_controllerUrl/getAll");

    if (response != null){
      var responseBody = jsonDecode(response);

      if (responseBody.length == 0){
        return <CategoryModel>[];
      }
      
      var result = responseBody.map((x) => CategoryModel.fromJson(x)).toList();
      return List<CategoryModel>.from(result);
    }

    throw Exception("Error");
  }
}
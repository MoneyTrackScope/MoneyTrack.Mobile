import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:money_track/src/exceptions/auth_exception.dart';
import 'package:money_track/src/models/internal/storage_item.dart';
import 'package:money_track/src/models/user_model.dart';
import 'package:money_track/src/services/internal/app_http_client.dart';
import 'package:money_track/src/settings/api_settings.dart';
import 'package:money_track/src/settings/app_settings.dart';

import 'internal/secure_storeage.dart';

class UserService{
  static const String _controllerUrl = "api/User";

  final AppHtppClient _httpClient = GetIt.I.get<AppHtppClient>();

  final StorageService _storage = GetIt.I.get<StorageService>();

  Future<UserModel> signIn(String login, String password) async {
    final response = await _httpClient
      .post(
        "${ApiSettings.baseApiUrl}/$_controllerUrl/signIn",
        body: <String, String>{
          "login" : login,
          "password" : password
        }
      );

    if(response != null){
      var responseBody = jsonDecode(response);

      _storage.writeSecureData(StorageItem(AppSettings.tokenKey, responseBody["token"]));
      _storage.writeSecureData(StorageItem(AppSettings.tokenExpiredAtKey, responseBody["expiredAt"]));

      return UserModel.fromJson(responseBody["user"]);
    }

    throw const AuthException("Cannot load user");
  }

  Future<UserModel> signUp(UserModel model, String password) async {
    final response = await _httpClient
      .post(
        "${ApiSettings.baseApiUrl}/$_controllerUrl/signUp",
        body: <String, dynamic>{
          "user" : model.toJson(),
          "password" : password
        }
      );

    if(response != null){
      var responseBody = jsonDecode(response);

      _storage.writeSecureData(StorageItem(AppSettings.tokenKey, responseBody["token"]));
      _storage.writeSecureData(StorageItem(AppSettings.tokenExpiredAtKey, responseBody["expiredAt"]));

      return UserModel.fromJson(responseBody["user"]);
    }

    throw const AuthException("Cannot load user");
  }
}
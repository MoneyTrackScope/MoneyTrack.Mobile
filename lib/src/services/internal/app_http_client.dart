import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:money_track/src/services/internal/secure_storeage.dart';
import 'package:money_track/src/settings/api_settings.dart';
import 'package:money_track/src/settings/app_settings.dart';

class AppHtppClient{
  final StorageService _storage = GetIt.I.get<StorageService>(); 

  Future<String?> get(String uri, {Map<String, String>? headers}) async{
    headers = await _enrichHeadersWithAuth(headers);

    var response = await http.get(Uri.parse(uri), headers: headers)
      .timeout(
        const Duration(seconds: ApiSettings.timeoutSeconds),
        onTimeout: () {
          throw Exception("Timeout");
        }
      );
    
    if(response.statusCode == 200){
      return response.body;
    }

    return null;
  }

  Future<String?> post(String uri, {Map<String, String>? headers, Object? body}) async{
    headers = await _enrichHeadersWithAuth(headers);

    var response = await http.post(Uri.parse(uri), headers: headers, body: jsonEncode(body))
      .timeout(
        const Duration(seconds: ApiSettings.timeoutSeconds),
        onTimeout: () {
          throw Exception("Timeout");
        }
      );
    
    if(response.statusCode == 200){
      return response.body;
    }

    return null;
  }

  Future<String?> put(String uri, {Map<String, String>? headers, Object? body}) async{
    headers = await _enrichHeadersWithAuth(headers);

    var response = await http.put(Uri.parse(uri), headers: headers, body: jsonEncode(body))
      .timeout(
        const Duration(seconds: ApiSettings.timeoutSeconds),
        onTimeout: () {
          throw Exception("Timeout");
        }
      );
    
    if(response.statusCode == 200){
      return response.body;
    }

    return null;
  }

  Future<String?> delete(String uri, {Map<String, String>? headers}) async{
    headers = await _enrichHeadersWithAuth(headers);

    var response = await http.delete(Uri.parse(uri), headers: headers)
      .timeout(
        const Duration(seconds: ApiSettings.timeoutSeconds),
        onTimeout: () {
          throw Exception("Timeout");
        }
      );
    
    if(response.statusCode == 200){
      return response.body;
    }

    return null;
  }

  Future<Map<String, String>?> _enrichHeadersWithAuth(Map<String, String>? headers) async{
    var additionalHeaders = <String, String>{};
    additionalHeaders["Content-Type"] = "application/json";

    var token = await _storage.readSecureData(AppSettings.tokenKey);

    if(token != null){
      additionalHeaders["Authorization"] = "Bearer $token";
    }

    if(headers != null){
      headers.addAll(additionalHeaders);
    }
    else{
      headers = additionalHeaders;
    }
    
    return headers;
  }
}
/* import 'dart:convert';

import 'package:eventos_flutter/config.dart';
import 'package:eventos_flutter/models/login_request_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static Future<bool> login(LoginRequestModel model) {
    Map<String, String> requestHeaders = {'Content-type': 'application/json'};
    var url = Uri.http(Config.apiUrl, Config.loginAPiPart);

    var response=await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    return LoginRequestModel(response.body);
  }
}
 */
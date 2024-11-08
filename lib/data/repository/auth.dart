import 'dart:convert';
import 'dart:developer';

import 'package:books/core/network/api_endpoints.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<String> registerUser(
      {required String userName, required String password}) async {
    try {
      var responce =
          await http.post(Uri.parse(ApiEndpoints.getUserRegisterEndPoint),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode({"username": userName, "password": password}));
      var result = jsonDecode(responce.body);
      log(result.toString());
      if (responce.statusCode == 201) {
        return result['result']['access_token'];
      } else {
        throw (result['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}

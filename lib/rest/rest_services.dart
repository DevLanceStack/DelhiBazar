import 'dart:convert';

import 'package:delhibazar/rest/api_url.dart';
import 'package:delhibazar/rest/rest_client.dart';
import 'package:http/http.dart' as http;

class RestServices {
  // we create here a register function for api call
  // with our created api client and response
  static Future<http.Response> register(
      String name,
      String email,
      String phone,
      String password,
      String pin) async {
    // how add return type
    http.Response response;
    var result = await RestClient.postData(ApiUrl.register, body:jsonEncode( {
      "app_key": "SgRTXsywVmWteEBLlYWecwgbDiHwlh",
      "env_type": "Prod",
      "name": name,
      "email": email,
      "mobile": phone,
      "password": password,
      "security_pin": pin
    }));
    response=http.Response(jsonEncode(result),200);

    // here return
    // now no error in our project
    return response;
  }
}

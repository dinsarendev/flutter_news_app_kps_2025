import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_news_app_kps_2025/data/remote/services/base_api_service.dart';
import 'package:http/http.dart' as http;

import '../../../exceptions/app_exception.dart';

class BaseApiServiceImpl implements BaseApiService {
  var header = {"Content-Type": "application/json"};
  @override
  Future apiPost(String url, {requestBody}) async {
    dynamic responseBody;
    if (kDebugMode) {
      print("Request url $url\n");
      print("Request Body $requestBody");
    }
    try {
      var response = await http
          .post(
            headers: header,
            Uri.parse(url),
            body: jsonEncode(requestBody),
          )
          .timeout(
            const Duration(seconds: 120),
          );
      switch (response.statusCode) {
        case 200:
          responseBody = jsonDecode(response.body);
          break;
        case 401:
          throw UnAuthorization("");
          break;
        case 400:
          responseBody = jsonDecode(response.body);
          break;
        case 500:
          throw InternalServerError();
      }
    } catch (e) {
      print("General error {$e}");
      throw GeneralError(e.toString());
    }
    if (kDebugMode) {
      print("Response Body $responseBody");
    }
    return responseBody;
  }
}

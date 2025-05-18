import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_news_app_kps_2025/app/routes.dart';
import 'package:flutter_news_app_kps_2025/data/remote/api/api.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/request/Login_request.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/request/Refresh_token_request.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/response/Login_response.dart';
import 'package:flutter_news_app_kps_2025/data/remote/services/base_api_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../exceptions/app_exception.dart';

class BaseApiServiceImpl implements BaseApiService {
  var storage = GetStorage();
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

  Future<bool> _refreshToken() async {
    var refreshRequest = RefreshTokenRequest();
    var refreshToken = await storage.read("REFRESH_TOKEN");
    refreshRequest.refreshToken = refreshToken;
    var response = await apiPost(Api.refreshTokenPath,
        requestBody: refreshRequest.toJson());
    LoginResponse userLogin = LoginResponse.fromJson(response);
    if (userLogin.accessToken != null) {
      await storage.write("ACCESS_TOKEN", response.accessToken);
      await storage.write("REFRESH_TOKEN", response.refreshToken);
      return true;
    }
    return false;
  }

  @override
  Future apiPostWithToken(String url, {req}) async {
    dynamic responseBody;
    if (kDebugMode) {
      print("Request url $url\n");
      print("Request Body $req");
    }
    var response = await http.post(
      headers: {
        "Authorization": "Bearer ${storage.read("ACCESS_TOKEN")}",
        "Content-Type": "application/json"
      },
      Uri.parse(url),
      body: jsonEncode(req),
    ).timeout(
      const Duration(seconds: 120),
    );
    switch (response.statusCode) {
      case 200:
        responseBody = jsonDecode(response.body);
        break;
      case 401:
        if (await _refreshToken() == true) {
          responseBody = _retryApiPost(url, req: req);
        } else {
          Get.offAndToNamed(RouteName.splashView);
        }
      case 400:
        responseBody = jsonDecode(response.body);
        break;
      case 500:
        throw InternalServerError();
    }
    if (kDebugMode) {
      print("Response Body $responseBody");
    }
    return responseBody;
  }

  _retryApiPost(String url, {req}) async {
    dynamic responseBody;
    if (kDebugMode) {
      print("Request url $url\n");
      print("Request Body $req");
    }
    var response = await http.post(
      headers: {
        "Authorization": "Bearer ${storage.read("ACCESS_TOKEN")}",
        "Content-Type": "application/json"
      },
      Uri.parse(url),
      body: jsonEncode(req),
    ).timeout(
      const Duration(seconds: 120),
    );
    switch (response.statusCode) {
      case 200:
        responseBody = jsonDecode(response.body);
        break;
      case 400:
        responseBody = jsonDecode(response.body);
        break;
      case 500:
        throw InternalServerError();
    }
    if (kDebugMode) {
      print("Response Body $responseBody");
    }
    return responseBody;
  }
}

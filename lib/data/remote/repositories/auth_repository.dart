import 'package:flutter_news_app_kps_2025/data/remote/models/request/Login_request.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/request/Register_request.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/response/Base_body_response.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/response/Login_response.dart';

abstract class AuthRepository {
  Future<BaseBodyResponse> register(RegisterRequest req);
  Future<LoginResponse> login(LoginRequest req);
}
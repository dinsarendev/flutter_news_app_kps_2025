import 'package:flutter_news_app_kps_2025/data/remote/api/api.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/request/Register_request.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/response/Base_body_response.dart';
import 'package:flutter_news_app_kps_2025/data/remote/repositories/auth_repository.dart';
import 'package:flutter_news_app_kps_2025/data/remote/services/base_api_service.dart';
import 'package:flutter_news_app_kps_2025/data/remote/services/base_api_service_impl.dart';

class AuthRepositoryImpl extends AuthRepository{
  final BaseApiService baseApiService = BaseApiServiceImpl();

  @override
  Future<BaseBodyResponse> register(RegisterRequest req) async {
    var response = await baseApiService.apiPost(Api.registerPath, requestBody: req.toJson());
    BaseBodyResponse baseBodyResponse = BaseBodyResponse.fromJson(response);
    return baseBodyResponse;
  }

}
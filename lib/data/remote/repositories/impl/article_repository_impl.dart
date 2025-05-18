import 'package:flutter_news_app_kps_2025/data/remote/api/api.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/request/Post_base_request.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/response/Base_body_response.dart';
import 'package:flutter_news_app_kps_2025/data/remote/repositories/article_repository.dart';
import 'package:flutter_news_app_kps_2025/data/remote/services/base_api_service_impl.dart';

class ArticleRepositoryImpl extends ArticleRepository{
  var service = BaseApiServiceImpl();
  @override
  Future<BaseBodyResponse> getAllCategories(PostBaseRequest req) async {
    var response = await service.apiPostWithToken(Api.getAllCategoriesPath, req: req.toJson());
    return BaseBodyResponse.fromJson(response);
  }

}
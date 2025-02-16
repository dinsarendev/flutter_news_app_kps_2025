import 'package:flutter_news_app_kps_2025/app/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeViewModel extends GetxController{

  @override
  void onInit() {
    super.onInit();
  }

  logout() async {
    var storage = GetStorage();
    await storage.remove("ACCESS_TOKEN");
    await  storage.remove("REFRESH_TOKEN");
    Get.offAndToNamed(RouteName.splashView);
  }
}
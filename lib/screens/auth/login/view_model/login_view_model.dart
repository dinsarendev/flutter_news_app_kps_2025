import 'package:flutter/cupertino.dart';
import 'package:flutter_news_app_kps_2025/app/routes.dart';
import 'package:flutter_news_app_kps_2025/data/remote/models/request/Login_request.dart';
import 'package:flutter_news_app_kps_2025/data/remote/repositories/impl/auth_repository_impl.dart';
import 'package:flutter_news_app_kps_2025/exceptions/app_exception.dart';
import 'package:flutter_news_app_kps_2025/utils/message_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginViewModel extends GetxController {
  final authRepository = AuthRepositoryImpl();
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isLoginLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onLogin() async {
    if (usernameController.value.text.isEmpty) {
      MessageUtils.onMessageError("Username is empty");
    } else if (passwordController.value.text.isEmpty) {
      MessageUtils.onMessageError("Password is empty");
    } else {
      isLoginLoading(true);
      try {
        var loginReq = LoginRequest();
        loginReq.phoneNumber = usernameController.value.text;
        loginReq.password = passwordController.value.text;
        var response  = await authRepository.login(loginReq);
        if(response.accessToken != null){
          var storage = GetStorage();
          storage.write("ACCESS_TOKEN", response.accessToken);
          storage.write("REFRESH_TOKEN", response.refreshToken);
          Get.offAndToNamed(RouteName.homeView);
        }
      } catch (e) {
        MessageUtils.onMessageError(e.toString());
      }
      isLoginLoading(false);
    }
  }
}

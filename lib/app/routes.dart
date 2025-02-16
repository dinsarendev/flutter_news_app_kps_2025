import 'package:flutter_news_app_kps_2025/screens/auth/register/view/register_view.dart';
import 'package:flutter_news_app_kps_2025/screens/splash/view/splash_view.dart';
import 'package:get/get.dart';

class Routes{
  final routes = [
    GetPage(name: RouteName.splashView, page:()=> SplashView()),
    GetPage(name: RouteName.registerView, page:()=> RegisterView()),
  ];
}
class RouteName {
  static String  splashView = "/splash";
  static String  registerView = "/register";
}
import 'package:flutter/material.dart';
import 'package:flutter_news_app_kps_2025/screens/splash/view/splash_view.dart';
import 'package:get/get.dart';

import 'app/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Mobile App',
      getPages: Routes().routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/splash",
    );
  }
}
